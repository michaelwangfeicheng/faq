#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@file: 
@version: 
@desc:  
@time: 2021/3/2 15:45 

@Modify Time      @Author    @Version    @Desciption
------------      -------    --------    -----------
2021/3/2 15:45   wangfc      1.0         None

"""
import sys
import os
import time
from datetime import datetime
import re
import random
from typing import Dict, Text, Any, Union, List, Iterable

import numpy  as np
import torch
import torch.nn.functional as F
from tqdm import tqdm
from torch.utils.data import DataLoader, RandomSampler, SequentialSampler, Dataset, IterableDataset
import torch.distributed as dist
from torch.nn.parallel.data_parallel import DataParallel
from torch.utils.data.distributed import DistributedSampler
from torch.nn.parallel.distributed import DistributedDataParallel

from data_process.n_gram import generate_n_gram
from transformers.optimization import AdamW
import transformers
from utils.io import pickle_load, pickle_dump
from utils.time import TIME_FORMAT, get_current_time
from utils.torch.environment import _setup_torch_environment, load_model_to_device, _reset_random_seed
from utils.torch.utils import set_batch_to_device
from utils.torch.metrics import binary_accuracy
from evaluation.InformationRetrievalEvaluator import InformationRetrievalEvaluator
from torch.utils.tensorboard import SummaryWriter
from sklearn import metrics

import logging

from utils.torch.utils_adversarial import clamp, l2_normalize
from utils.utils_fasttext import get_time_dif

logger = logging.getLogger(__name__)

PY2 = sys.version_info[0] == 2
PY3 = sys.version_info[0] == 3
if PY2:
    import collections

    container_abcs = collections
elif PY3:
    import collections.abc

    container_abcs = collections.abc


class BaseTorchTask():
    def __init__(self, data_dir, output_dir, model_config: Dict[Text, Any], mode='train',
                 init_model=True,
                 adversarial_train_mode=None,
                 parallel_decorate=False, local_rank=-1, cuda_no=0, device_ids=None, fp16=False,
                 tokenizer=None, optimizer_name: Text = 'adam', loss_name='cross_entropy', metric_name='accuracy',
                 seed=1234, num_train_epochs=1, learning_rate=0.005, warmup_proportion=0.1, weight_decay_rate=0.01,
                 train_filename='train.json', dev_filename='dev.json', test_filename='test.json',
                 random_sampling=True,custom_collate_fn=None,
                 train_batch_size=128, dev_batch_size=128, test_batch_size=128,
                 evaluate_train_data=True,
                 evaluate_every_step=100,
                 evaluate_every_epoch=None,
                 evaluate_metrics_output_dirname='evaluate_metrics',
                 print_evaluate_step_interval=10,
                 if_resume_checkpoint=True, resume_epoch=None, resume_global_step=None,
                 save_checkpoint_every_step=100,
                 save_checkpoint_every_epoch=None,
                 saved_model_name='model',
                 log_summary_every_step=100,
                 debug=False,
                 *args,
                 **kwargs
                 ):
        self.data_dir = data_dir
        self.output_dir = output_dir
        self.model_config = model_config

        self.mode = mode
        self.adversarial_train_mode = adversarial_train_mode
        self.parallel_decorate = parallel_decorate  # ?????????????????????????????????
        self.local_rank = local_rank  # ???????????????
        # self.n_gpus = n_gpus # ???????????? _init_device() ???????????????
        self.device_ids = device_ids  # ??????????????????????????? gpu
        self.cuda_no = cuda_no  # ??????????????????????????? gpu
        self.fp16 = fp16

        self.tokenizer = tokenizer
        self.optimizer_name = optimizer_name.lower()
        self.loss_name = loss_name.lower()
        self.metric_name = metric_name.lower()

        self.seed = seed
        self.num_train_epochs = num_train_epochs
        self.learning_rate = learning_rate
        self.warmup_proportion = warmup_proportion
        self.weight_decay_rate = weight_decay_rate
        self.train_filename, self.dev_filename, self.test_filename = train_filename, dev_filename, test_filename
        self.train_batch_size, self.dev_batch_size, self.test_batch_size = train_batch_size, dev_batch_size, test_batch_size
        self.random_sampling = random_sampling
        self.custom_collate_fn = custom_collate_fn

        self.best_valid_loss = float('inf')
        self.best_metric_value = -1
        self.evaluate_train_data = evaluate_train_data
        self.print_evaluate_step_interval = print_evaluate_step_interval
        self.evaluate_every_step = evaluate_every_step
        self.evaluate_every_epoch = evaluate_every_epoch
        self.evaluate_metrics_output_dir = os.path.join(output_dir, evaluate_metrics_output_dirname)

        self.saved_model_name = saved_model_name
        self.saved_model_name_pattern = f"{self.saved_model_name}" + "_(\d{1,5}).pt"
        self.if_resume_checkpoint = if_resume_checkpoint
        self.resume_epoch = resume_epoch
        self.resume_global_step = resume_global_step
        self.save_checkpoint_every_step = save_checkpoint_every_step
        self.save_checkpoint_every_epoch = save_checkpoint_every_epoch
        self.best_model_path = os.path.join(self.output_dir, 'model.pt')
        os.makedirs(self.output_dir, exist_ok=True)

        self.log_summary_every_step = log_summary_every_step
        self.summary_filename = get_current_time()

        if mode =='train':
            self._init_summary_writer()

        self.dubug = debug

        self.device, self.n_gpu = _setup_torch_environment(cuda_no=self.cuda_no, local_rank=self.local_rank,
                                                           parallel_decorate=self.parallel_decorate, fp16=self.fp16)

        if init_model:
            self._init_summary_writer()

    def _init_model(self):
        self.model = self._build_model(self.model_config)
        load_model_to_device(model=self.model, device=self.device)
        self.optimizer = self._build_optimizer()
        self.loss_fn = self._build_loss_fn()
        self.metric_fn = self._build_metric_fn()

    def _build_tokenizer(self):
        raise NotImplementedError

    def _build_model(self, model_config: Dict[Text, Any]):
        raise NotImplementedError

    def _build_learning_schedule(self):
        raise NotImplementedError

    def _build_optimizer(self):
        if self.optimizer_name == "sgd":
            optimizer = torch.optim.SGD(self.model.parameters(), lr=self.learning_rate)
        elif self.optimizer_name == 'adam':
            optimizer = torch.optim.Adam(self.model.parameters(), lr=self.learning_rate)
        elif self.optimizer_name == 'adamw':
            optimizer = AdamW(self.model.parameters(), lr=self.learning_rate)()
        return optimizer

    def _build_loss_fn(self):
        if self.loss_name == 'sigmoid':
            return F.sigmoid
        elif self.loss_name == 'cross_entropy':
            return F.cross_entropy

    def _build_metric_fn(self):
        if self.metric_name == 'accuracy':
            return metrics.accuracy_score

    def train(self):
        # ????????? random_seed
        _reset_random_seed(seed=self.seed, n_gpu=self.n_gpu)
        # ?????????????????????
        train_dataset, dev_dataset, test_dataset = self._load_datasets(load_train=True, load_dev=True, load_test=True)
        #  ?????? data_loader
        train_dataloader = self._prepare_data_loader(data_type='train',
                                                     dataset=train_dataset,
                                                     batch_size=self.train_batch_size,
                                                     rand_flag=self.random_sampling)
        if dev_dataset:
            dev_dataloader = self._prepare_data_loader(data_type='dev',
                                                       dataset=dev_dataset,
                                                       batch_size=self.dev_batch_size)
        best_valid_loss_on_epoch = self.best_valid_loss
        best_valid_loss_on_step = self.best_valid_loss
        global_step = 0
        for epoch in range(self.num_train_epochs):
            if self.adversarial_train_mode is None:
                global_step,best_valid_loss_on_step = self._train_on_epoch(epoch=epoch, train_dataloader=train_dataloader,
                                                               dev_dataloader=dev_dataloader,
                                                               global_step=global_step,
                                                               best_valid_loss=best_valid_loss_on_step)
            else:
                global_step, best_valid_loss_on_step = self._adversarial_train_on_epoch(
                    epoch=epoch, train_dataloader=train_dataloader, dev_dataloader=dev_dataloader,
                    global_step=global_step,best_valid_loss=best_valid_loss_on_step,
                    adversarial_train_mode=self.adversarial_train_mode)

            if self.save_checkpoint_every_epoch and epoch % self.save_checkpoint_every_epoch == 0:
                dev_loss_on_epoch, dev_metric_on_epoch, _, _ = self.evaluate(data_iterator=dev_dataloader)
                if dev_loss_on_epoch < best_valid_loss_on_epoch:
                    best_valid_loss_on_epoch = dev_loss_on_epoch
                    self.save_model(epoch=epoch,global_step=global_step)

        if test_dataset:
            test_dataloader = self._prepare_data_loader(data_type='test',
                                                        dataset=test_dataset,
                                                        batch_size=self.test_batch_size)
            self.test(test_dataloader=test_dataloader)



    def _train_on_epoch(self, epoch, train_dataloader: DataLoader,
                        dev_dataloader: DataLoader = None,
                        global_step= 0,
                        best_valid_loss= None
                        ):
        self.model.train()
        # ?????????????????????batch
        epoch_loss_sum = 0
        if best_valid_loss is None:
            best_valid_loss = self.best_valid_loss

        for step, batch in enumerate(train_dataloader):
            batch = self._set_batch_on_device(batch, device=self.device)
            if global_step % self.log_summary_every_step == 0:
                logger.info(f"????????????epoch={epoch},step={step},global_step={global_step}")
            # ????????????

            self.optimizer.zero_grad()
            output = self.model(batch)
            labels = batch[1]

            loss = self.loss_fn(output, labels)
            epoch_loss_sum += loss.item()
            loss.backward()
            self.optimizer.step()

            if self.evaluate_every_step and step % self.evaluate_every_step == 0:
                # ????????????????????????
                predicts = torch.argmax(output, dim=-1)
                train_metric = self.metric_fn(labels.cpu(), predicts.cpu())
                # ??? dev ?????????????????????
                dev_loss, dev_metric = None, None
                if dev_dataloader:
                    dev_loss, dev_metric, _, _ = self.evaluate(dev_dataloader)
                    if self.save_checkpoint_every_step and dev_loss < best_valid_loss:
                        best_valid_loss = dev_loss
                        self.save_model(epoch=epoch,global_step=global_step)
                        improve = '*'
                        last_improve_step = global_step
                    else:
                        improve = ''

                self.summary_writer.add_scalar("loss/train", loss.item(), global_step)
                self.summary_writer.add_scalar("loss/dev", dev_loss.item(), global_step)
                self.summary_writer.add_scalar(f"{self.metric_name}/train", train_metric, global_step)
                self.summary_writer.add_scalar(f"{self.metric_name}/dev", dev_metric, global_step)
                self.model.train()
                logger.info(f"epoch={epoch},step={step},global_step={global_step},"
                            f"loss={loss.item()},"
                            f"train_{self.metric_name} ={train_metric},"
                            f"dev_loss={dev_loss.item()},dev_{self.metric_name}={dev_metric},"
                            f"improve={improve}, last_improve_step={last_improve_step}")
            global_step += 1
        epoch_loss_avg = epoch_loss_sum / train_dataloader.__len__()
        return global_step,best_valid_loss

    def _adversarial_train_on_epoch(self, epoch, train_dataloader: DataLoader,
                                    dev_dataloader: DataLoader = None,
                                    global_step=0,
                                    best_valid_loss=None,adversarial_train_mode=None):
        """
        ?????? ?????????????????????
        """
        pass

    @staticmethod
    def _set_batch_on_device(batch, device):
        if isinstance(batch, list):
            return [x.to(device) for x in batch]
        elif isinstance(batch, dict):
            return {key: value.to(device) for key, value in batch.items()}

    def _load_datasets(self, load_train=True, load_dev=False, load_test=False, overwrite_saved_datafile=False):

        """
        @author: wangfc27441
        @desc:  ??? BaseTask ?????? ??? ?????? load_example_func, convert_to_feature_func, convert_to_dataset_func
            ??? ?????? ???????????? ?????? ??????
            ?????????????????????????????????????????????????????????
            load_example_func??? ?????? example
            convert_to_feature_func: ??? example ????????? feature
            convert_to_dataset_func: ??? feature ????????? dataset

        @version???
        @time:2020/7/28 11:09 

        """"""

        """
        logger.info('=' * 20 + 'Load Task Data' + '=' * 20)
        # prepare data
        if load_train:
            logger.info('Load train portion')
            self.train_examples, self.train_features, self.train_dataset = self._load_example_feature_dataset(
                data_type='train',
                file_name=self.train_filename,
                overwrite_saved_datafile=overwrite_saved_datafile
            )
        else:
            logger.info('Do not load train portion')

        if load_dev:
            logger.info('Load dev portion')
            self.dev_examples, self.dev_features, self.dev_dataset = self._load_example_feature_dataset(
                data_type='dev',
                file_name=self.dev_filename,
                overwrite_saved_datafile=overwrite_saved_datafile
            )
        else:
            logger.info('Do not load dev portion')

        if load_test:
            logger.info('Load test portion')
            self.test_examples, self.test_features, self.test_dataset = self._load_example_feature_dataset(
                data_type='test',
                file_name=self.test_filename,
                overwrite_saved_datafile=overwrite_saved_datafile
            )
        else:
            logger.info('Do not load test portion')

    def _load_example_feature_dataset(self, data_type=None,
                                      file_name=None, file_path=None, overwrite_saved_datafile=False):
        """
        @author:wangfc27441
        @desc: ??? BaseTask ?????? ??? ?????? load_example_func, convert_to_feature_func, convert_to_dataset_func
            ??? ?????? ???????????? ?????? ??????
        @version???
        @time:2020/7/28 11:11

        """
        if file_name is None and file_path is None:
            raise Exception('Either file name or file path should be provided')

        if file_path is None:
            file_path = os.path.join(self.data_dir, file_name)

        saved_pkl_path = os.path.join(self.data_dir, f"{data_type}.pkl")

        if os.path.exists(file_path):
            logger.info('Load example feature dataset from {}'.format(file_path))
            if not overwrite_saved_datafile and os.path.exists(saved_pkl_path):
                examples, features, dataset = pickle_load(saved_pkl_path)
                logger.info(f"???{saved_pkl_path}????????????,??????{examples.__len__()}exmaple")
            else:
                # ??????????????????????????? ?????? ???????????? ?????? ?????? ????????????
                # load_example_func -> DEEExampleLoader
                examples = self._load_example_func(file_path)
                # feature_converter_func -> DEEFeatureConverter
                features = self._convert_example_to_feature_func(examples)
                dataset = self._convert_to_dataset_func(features, data_type=data_type)

                data = (examples, features, dataset)
                pickle_dump(data, saved_pkl_path)
                logger.info(f"?????? examples,features,dataset ?????????{saved_pkl_path}")
        else:
            logger.info('Warning: file does not exists, {}'.format(file_path))
            examples = None
            features = None
            dataset = None
            raise ValueError
        return examples, features, dataset

    # ???????????????????????????3?????????
    def _load_example_func(self, file_path):
        raise NotImplementedError

    def _convert_exmaple_to_feature_func(self, examples):
        raise NotImplementedError

    def _convert_to_dataset_func(self, features):
        raise NotImplementedError

    def _prepare_data_loader(self, data_type, dataset, batch_size, rand_flag=False) \
            -> DataLoader:
        """
        @author:wangfc
        @desc:
        dataset: ????????? from torch.utils.data import Dataset, IterableDataset

        @version???
        @time:2021/3/8 14:14

        Parameters
        ----------

        Returns
        -------
        """
        # prepare data loader
        logger.info(f"?????? {data_type} dataloader")
        if isinstance(dataset, IterableDataset):
            # IterableDataset ????????????sampler ?????????None
            data_sampler = None
        elif isinstance(dataset, Dataset):
            if rand_flag:
                data_sampler = RandomSampler(dataset)
            else:
                data_sampler = SequentialSampler(dataset)

        if self.custom_collate_fn is None:
            dataloader = DataLoader(dataset,
                                    batch_size=batch_size,
                                    sampler=data_sampler)
        else:
            dataloader = DataLoader(dataset,
                                    batch_size=batch_size,
                                    sampler=data_sampler,
                                    collate_fn=self.custom_collate_fn)

        return dataloader

    def evaluate(self, data_iterator: Iterable):
        self.model.eval()
        loss_total = 0
        predict_all = np.array([], dtype=int)
        labels_all = np.array([], dtype=int)
        with torch.no_grad():
            for batch in data_iterator:
                batch = self._set_batch_on_device(batch=batch, device=self.device)
                outputs = self.model(batch)
                labels = batch[1]
                loss = self.loss_fn(outputs, labels)
                loss_total += loss
                labels = labels.data.cpu().numpy()
                predictions = torch.max(outputs.data, 1)[1].cpu().numpy()
                labels_all = np.append(labels_all, labels)
                predict_all = np.append(predict_all, predictions)
        metric_value = self.metric_fn(labels_all,predict_all)
        loss_avg = loss_total / len(data_iterator)
        return loss_avg, metric_value, predict_all, labels_all

    def _evaluate_on_batch(self):
        raise NotImplementedError

    def _evaluate_on_epoch(self, epoch, itetator):
        self.model.eval()
        epoch_loss_sum = 0
        epoch_accuracy = 0
        for batch in itetator:
            output = self.model(batch)
            loss = self.loss_fn(output, batch.label)
            accuracy = self.metric_fn(output, batch.label)
            # ????????????loss??????????????????????????????
            epoch_loss_sum += loss.item()
            epoch_accuracy += accuracy.item()

        return epoch_loss_sum / len(itetator), epoch_accuracy / len(itetator)

    def save_model(self, epoch, global_step=None,with_suffix=False):
        saved_model_filename,_ = self._get_saved_model_filename(epoch,global_step,with_suffix)
        saved_model_path = os.path.join(self.output_dir, saved_model_filename)

        # store_dict = { 'setting': self.setting.__dict__}
        store_dict = {}
        if self.model:
            if isinstance(self.model, DataParallel) or isinstance(self.model, DistributedDataParallel):
                model_state = self.model.module.state_dict()
            else:
                model_state = self.model.state_dict()
            store_dict['model_state'] = model_state
        else:
            logging.info('No model state is dumped', level=logging.WARNING)

        if self.optimizer:
            store_dict['optimizer_state'] = self.optimizer.state_dict()
        else:
            logging.info('No optimizer state is dumped', level=logging.WARNING)

        if epoch:
            store_dict['epoch'] = epoch
        if global_step:
            # ?????? global_step
            store_dict['global_step'] = global_step
        torch.save(store_dict, saved_model_path)


    def _get_saved_model_filename(self,epoch=None, global_step=None,with_suffix=False):
        if with_suffix:
            saved_model_filename = f"{self.saved_model_name}_{epoch}.pt"
            saved_model_filename_pattern =  f"{self.saved_model_name}" + "_(\d{1,5}).pt"
        else:
            saved_model_filename = f"{self.saved_model_name}.pt"
            saved_model_filename_pattern = f"{self.saved_model_name}.pt"
        return saved_model_filename,saved_model_filename_pattern

    def load_saved_model(self, epoch=None,global_step=None,with_suffix=False):
        if with_suffix:
            if epoch is None:
                resume_epoch = self._get_latest_epoch(epoch,global_step,with_suffix)
            else:
                resume_epoch = epoch
            self._load_saved_model_on_epoch(resume_epoch=resume_epoch)

        else:
            saved_model_filename,_ = self._get_saved_model_filename()
            saved_model_path = os.path.join(self.output_dir,saved_model_filename)
            resume_epoch, resume_global_step = self._load_model(saved_model_path=saved_model_path)



    def _get_latest_epoch(self,epoch=None,global_step=None,with_suffix=False) -> int:
        """
        ??????????????? epoch
        """
        latest_epoch = None
        prev_epochs = []
        _, saved_model_filename_pattern = self._get_saved_model_filename(epoch,global_step,with_suffix)
        for fn in os.listdir(self.output_dir):
            # if fn.startswith('{}.cpt'.format(self.cpt_file_name)):
            # try:
            #     epoch = int(fn.split('.')[-1])
            #     prev_epochs.append(epoch)
            # except Exception as e:
            #     continue
            matched = re.match(pattern=saved_model_filename_pattern, string=fn)
            if matched :
                epoch = int(matched.groups()[0])
                prev_epochs.append(epoch)

        prev_epochs.sort()

        if len(prev_epochs) > 0:
            latest_epoch = prev_epochs[-1]
            logging.info('Pick latest epoch {} from {}'.format(latest_epoch, str(prev_epochs)))
        else:
            logging.info('No previous epoch checkpoints, just start from scratch')
        # ??????????????????None
        return latest_epoch

    def _load_saved_model_on_epoch(self, resume_epoch=None, resume_model=True, resume_optimizer=False):
        """
        @author:wangfc27441
        @desc:
        @version???
        @time:2020/8/3 9:13

        """
        saved_model_path = os.path.join(self.output_dir, '{}_{}.pt'.format(self.saved_model_name, resume_epoch))
        if not os.path.exists(saved_model_path):
            raise IOError(f"{saved_model_path}????????????")
        resume_epoch, resume_global_step = self._load_model(saved_model_path=saved_model_path,
                                                            resume_model=resume_model,
                                                            resume_optimizer=resume_optimizer)
        return resume_epoch, resume_global_step

    def _load_model(self, saved_model_path=None,
                    resume_model=True, resume_optimizer=False, strict=False):
        """
        @author:wangfc27441
        @desc:  ?????? ?????? ???epoch
        @version???
        @time:2020/7/30 14:47
        """
        # dict_keys(['model_state', 'optimizer_state', 'epoch', 'global_step'])
        store_dict = torch.load(saved_model_path, map_location=self.device)

        # ??? ckpt????????? resume_epoch
        # dict_keys(['setting', 'model_state', 'optimizer_state']) ?????????????????? epoch ??????
        resume_epoch = store_dict.get('epoch')  # int
        resume_global_step = store_dict.get('global_step')

        if resume_model:
            if self.model and 'model_state' in store_dict:
                if isinstance(self.model, DataParallel) or \
                        isinstance(self.model, DistributedDataParallel):
                    self.model.module.load_state_dict(store_dict['model_state'])
                else:
                    self.model.load_state_dict(store_dict['model_state'])
                logging.info('Resume model successfully')
            elif strict:
                raise Exception('Resume model failed, dict.keys = {}'.format(store_dict.keys()))

        if resume_optimizer:
            if self.optimizer and 'optimizer_state' in store_dict:
                self.optimizer.load_state_dict(store_dict['optimizer_state'])
                logging.info('Resume optimizer successfully')
            elif strict:
                raise Exception('Resume optimizer failed, dict.keys = {}'.format(store_dict.keys()))

        return resume_epoch, resume_global_step

    def infer(self):
        raise NotImplementedError

    def _init_summary_writer(self):
        """
        @author:wangfc27441
        @desc:  ??????????????? Writer
               ????????? Tensorboard ????????? Python ??????????????? Writer ??????????????????????????????
        @version???
        @time:2020/7/28 16:25

        """
        if self.log_summary_every_step:
            current_time = datetime.now().strftime(TIME_FORMAT)
            # sum_dir = '{}-{}'.format(self.summary_filename,current_time)
            log_dir = os.path.join(self.output_dir, "tensorboard", self.summary_filename)
            self.summary_writer = SummaryWriter(log_dir=log_dir)
            logger.info('????????? Summary Writer???Writing summary into {}'.format(log_dir))

    def _add_scalar_to_tensorboard(self, mode: str, tag: str, value: object, global_step: int):
        if self.summary_writer is not None and value is not None:
            self.summary_writer.add_scalar(tag='%s/%s' % (mode, tag), scalar_value=value, global_step=global_step)

    def _log_summary(self, mode: str, epoch: int, global_step: int,
                     optimizer, loss: float, metric_name: str, metric_value: float):
        """
        @author:wangfc27441
        @desc:  ?????? ??????????????????????????? tensorboard
        @version???
        @time:2020/7/28 14:58

        """
        # get current learning rate
        lr = self._get_lr(optimizer)[0]

        # log to tensorboard
        self._add_scalar_to_tensorboard(mode, 'loss', loss, global_step)
        self._add_scalar_to_tensorboard(mode, 'lr', lr, global_step)
        self._add_scalar_to_tensorboard(mode, metric_name, metric_value, global_step)
        # logger.info('write epoch={} global_iteration ={} loss={} and lr={} of {}={}  into tensorboard'
        #             .format(epoch, global_iteration, loss, lr, metric_name, metric_value))

    def _get_lr(self, optimizer):
        lrs = []
        for group in optimizer.param_groups:
            lr_scheduled = group['lr']
            lrs.append(lr_scheduled)
        return lrs


class PallelTorchTask(BaseTorchTask):
    def __init__(self,
                 gradient_accumulation_steps=1,
                 optimize_on_cpu=False,
                 metric_name='recall@k', metric_at_k=100,

                 *args, **kwargs):
        super(PallelTorchTask, self).__init__(*args, **kwargs)
        # ???????????????
        self.run_step = 0  # ???????????????
        self.gradient_accumulation_steps = gradient_accumulation_steps

        self.optimize_on_cpu = optimize_on_cpu

        if self.parallel_decorate:
            self._init_process_group_distributed()

        self._init_device()

        # ????????? seed
        self.reset_random_seed()

        # ?????? summary_writer
        self._init_summary_writer()

        self.metric_name = metric_name
        self.metric_at_k = metric_at_k

        # ?????????????????????????????????????????? ????????? train.json,dev.json, test.json
        filename_ls = []
        for data_type in ['train', 'dev', 'test']:
            filename_ls.append(f'{data_type}.json')
        self.train_filename, self.dev_filename, self.test_filename = filename_ls

        # ???????????????????????????????????? _load_data ????????? dataset ??? dataloader
        self.train_dataset = None
        self.train_dataloader = None
        self.dev_dataset = None
        self.dev_dataloader = None
        self.test_dataset = None
        self.test_dataloader = None

        # ????????????????????????
        self.model = None
        self.optimizer = None
        self.loss_fn = None

    def train(self):
        logger.info("????????????")
        if self.num_train_steps is None:
            self.num_train_steps = round(
                self.num_train_epochs * len(
                    self.train_examples) / self.train_batch_size / self.gradient_accumulation_steps
            )
        # logger.info('=' * 20 + 'Start Base Training' + '=' * 20)
        logger.info("\tTotal examples Num = {}".format(len(self.train_examples)))
        logger.info("\tTrain Batch size = {}".format(self.train_batch_size))
        logger.info("\tTrain num steps = {}".format(self.num_train_steps))

        # ?????????????????????????????????self.train_dataset????????? prepare data loader
        train_dataloader = self._prepare_data_loader('train',
                                                     self.train_dataset, self.train_batch_size, rand_flag=True
                                                     )

        start_epoch = 0
        start_step = 0
        best_metric_value = self.best_metric_value
        if self.if_resume_checkpoint:
            resume_epoch, resume_global_step = self.resume_cpt_at(resume_optimizer=True)
        if resume_epoch is not None and isinstance(resume_epoch, int):
            start_epoch = resume_epoch + 1
            start_step = resume_global_step + 1
            for _ in range(start_step):
                self.scheduler.step()

        global_step = start_step

        for epoch_index in range(start_epoch, self.num_train_epochs):
            start_time = time.time()
            if self.parallel_decorate:
                train_dataloader = self.prepare_dist_data_loader(dataset=self.train_dataset,
                                                                 batch_size=self.train_batch_size,
                                                                 epoch=epoch_index)

            train_loss, train_acc, global_step = self._train_and_evaluate_at_epoch(mode='train',
                                                                                   epoch_index=epoch_index,
                                                                                   start_step=start_step,
                                                                                   global_step=global_step,
                                                                                   iterator=train_dataloader)

            end_time = time.time()
            epoch_mins, epoch_secs = self.epoch_time(start_time, end_time)
            logger.info(f'Epoch: {epoch_index + 1:02} | Epoch Time: {epoch_mins}m {epoch_secs}s')
            if train_acc is not None:
                logger.info(f'\tTrain Loss: {train_loss:.3f}| Train Acc: {train_acc * 100:.2f}%')
            else:
                logger.info(f'\tTrain Loss: {train_loss:.3f}')

            if self.save_checkpoint_every_epoch and epoch_index % self.save_checkpoint_every_epoch == 0:
                self.save_checkpoint(epoch=epoch_index, global_step=global_step)

            if self.evaluate_every_epoch and epoch_index % self.evaluate_every_epoch == 0:
                self.model.eval()
                dev_dataloader = self.prepare_data_loader('dev',
                                                          self.dev_dataset, self.dev_batch_size, rand_flag=False
                                                          )
                #
                valid_loss, _, _ = self.train_and_evaluate_at_epoch(mode='evaluate',
                                                                    epoch_index=epoch_index,
                                                                    start_step=start_step,
                                                                    global_step=global_step,
                                                                    iterator=dev_dataloader)

                # 1) ?????? loss ????????????????????????
                # best_valid_loss = self.best_valid_loss
                # if valid_loss < best_valid_loss:
                #     best_valid_loss = valid_loss
                #     torch.save(self.model.state_dict(), self.best_model_path)

                # 2) ?????? evaluate ???????????????????????????
                valid_metric_values = self.evaluate(epoch_index, global_step)

                # ??????????????? evaluate_metric_name,??????????????????????????????????????????????????????????????? recall
                valid_evaluate_metric_values = valid_metric_values.get(self.metric_name)
                valid_evaluate_metric_value = valid_evaluate_metric_values.get(self.metric_at_k)

                # ???????????????????????????????????????????????????

                if valid_evaluate_metric_value > best_metric_value:
                    best_metric_value = valid_evaluate_metric_value
                    # torch.save(self.model.state_dict(), self.best_model_path)
                    self.save_checkpoint(epoch=epoch_index, global_step=global_step)

                if valid_evaluate_metric_value is not None:
                    logger.info(
                        f'\t epoch_index:{epoch_index} \t Val. Loss: {valid_loss:.3f} |  Val. {self.metric_name}{self.metric_at_k}: {valid_evaluate_metric_value * 100:.2f}%')
                else:
                    logger.info(
                        f'\t epoch_index:{epoch_index} \t Val. Loss: {valid_loss:.3f}')

                if self.log_summary_every_step:
                    self._log_summary(mode='dev', epoch=epoch_index, global_iteration=global_step,
                                      optimizer=self.optimizer, loss=valid_loss,
                                      metric_name=self.metric_name, metric_value=valid_evaluate_metric_value)

    def _train_and_evaluate_at_epoch(self, mode, epoch_index, start_step, global_step, iterator, print_first_n_steps=1):
        """
        @author:wangfc27441
        @desc:
        @version???
        @time:2021/3/2 9:59

        Parameters
        ----------

        Returns
        -------
        """
        logger.info(f"?????? {mode} ???{epoch_index}???epoch")
        if mode == 'train':
            self.model.train()
        elif mode == 'evaluate':
            self.model.eval()

        epoch_loss_sum = 0
        epoch_metric = 0
        # ????????????step???????????????batch??? ???1???????????? triplet = (anchor,positive,negative) ???2???????????? sentence-label data
        for batch in iterator:
            # ??????????????????
            self.optimizer.zero_grad()
            # ??? sentences ?????? tokenize
            batch_encoding = self.tokenizer_fn(batch)
            # if print_first_n_steps and global_step - start_step <print_first_n_steps:
            #     for key,value in  batch_encoding.items()

            # ??? batch ????????? device
            batch_encoding_on_device = set_batch_to_device(batch=batch_encoding, device=self.device)
            # ????????????
            output = self.model(batch_encoding_on_device)
            if self.evaluate_train_data:
                # ?????? accuracy
                metric = self.evaluate_on_batch(**output)

            # ?????? loss
            loss = self.loss_fn(**output)
            # ????????????
            loss.backward()
            # ??????????????????????????????
            self.optimizer.step()

            # ?????? scheduler:  Update learning rate schedule
            self.scheduler.step()

            epoch_loss_sum += loss.item()

            global_step += 1
            self.run_step += 1

            if self.evaluate_train_data:
                epoch_metric += metric.item()
                metric_value = metric.item()
            else:
                epoch_metric = None
                metric_value = None

            if global_step % self.print_evaluate_step_interval == 0:
                logger.info(f"step={global_step},loss={loss.item()},{self.metric_name}={metric_value}")

            # ?????? ??????????????? summary
            if self.log_summary_every_step and global_step % self.log_summary_every_step == 0:
                # self.summary_writer.add_scalar('Loss', loss_scalar, global_step=global_step)
                self._log_summary(mode='train', epoch=epoch_index, global_iteration=global_step,
                                  optimizer=self.optimizer, loss=loss.item(),
                                  metric_name=self.metric_name, metric_value=metric_value)

        epoch_loss_mean = epoch_loss_sum / len(iterator)

        if self.evaluate_train_data:
            epoch_accuracy_mean = epoch_metric / len(iterator)
        else:
            epoch_accuracy_mean = None

        logger.info(
            f"epoch_index={epoch_index},epoch_loss_mean={epoch_loss_mean},epoch_accuracy_mean={epoch_accuracy_mean}")

        return epoch_loss_sum / len(iterator), epoch_accuracy_mean, global_step

    # def evaluate(self,**kwargs):
    #     pass
    #

    def basic_evaluate(self, epoch):
        """
        ?????????????????????
        """
        logger.info("?????? evaluate")
        # ????????????
        self.resume_cpt_at(epoch=epoch)

        self.model.eval()
        # ??????????????????
        logger.info("\tTotal test_examples Num = {}".format(len(self.test_examples)))
        logger.info("\tTrain Test Batch size = {}".format(self.test_batch_size))
        test_dataloader = self.prepare_data_loader(
            self.test_dataset, self.test_batch_size, rand_flag=False
        )

        loss_sum = 0
        metric_sum = 0
        for batch in test_dataloader:
            # ??? sentences ?????? tokenize
            batch_encoding = self.tokenizer_fn(batch)
            # ??? batch ????????? device
            batch_encoding_on_device = self.set_batch_to_device(batch_encoding)

            output = self.model(batch_encoding_on_device)

            loss = self.loss_fn(**output)

            metric_tensor = self.evaluate_on_batch(**output)
            # ????????????loss??????????????????????????????
            loss_sum += loss.item()
            metric_sum += metric_tensor.item()
        return loss_sum / len(test_dataloader), metric_sum / len(test_dataloader)

    def evaluate_on_batch(self, **kwargs):
        # ?????????batch???????????????
        raise NotImplementedError

    def test(self, best_model_path):
        test_dataloader = self.prepare_data_loader(
            self.test_dataset, self.test_batch_size, rand_flag=False
        )

        # ?????????????????????????????????
        self.model.load_state_dict(torch.load(best_model_path))
        test_loss, test_acc = self.evaluate(self.model, itetator=test_dataloader, loss_fn=self.loss_fn)
        logger.info(f'Test Loss: {test_loss:.3f} | Test Acc: {test_acc * 100:.2f}%')

    def tokenizer_fn(self):
        raise NotImplementedError

    def epoch_time(self, start_time, end_time):
        elapsed_time = end_time - start_time
        elapsed_mins = int(elapsed_time / 60)
        elapsed_secs = int(elapsed_time - (elapsed_mins * 60))
        return elapsed_mins, elapsed_secs

    def _init_process_group_distributed(self):
        """
        @author:wangfc
        @desc:  Initialize the process and join up with the other processes.
        This is ???blocking,??? meaning that no process will continue until all processes have joined.
        @version???
        @time:2021/3/9 9:33
        
        Parameters
        ----------
        The init_method tells the process group where to look for some settings. it???s looking at environment variables for the MASTER_ADDR and MASTER_PORT
        
        Returns
        -------
        """
        # ???????????? ?????? ??????????????? ????????????
        # Initializes the distributed backend which will take care of sychronizing nodes/GPUs
        dist.init_process_group(backend='nccl')
        if self.in_distributed_mode() and not dist.is_initialized():
            # dist.init_process_group(backend='gloo')  # 3 times slower than nccl for gpu training
            # ?????? CUDA ??????????????? ?????????????????? CUDA_VISIBLE_DEVICES?????????????????? set_device ?????????
            torch.cuda.set_device(self.local_rank)
            logging.info('World Size {} Rank {}, Local Rank {}, Device Num {}, Device {}'.format(
                dist.get_world_size(), dist.get_rank(), self.setting.local_rank,
                torch.cuda.device_count(), torch.cuda.current_device()
            ))
            dist.barrier()

    def _decorate_model(self):
        """
        @author:wangfc27441
        @desc:  ???????????? model,????????? pytorch?????????????????????
        @version???
        @time:2020/7/22 12:01

        """
        logging.info('=' * 20 + 'Decorate Model' + '=' * 20)

        if self.fp16:
            self.model.half()

        self.model.to(self.device)
        logging.info('Set model device to {}'.format(str(self.device)))

        if self.parallel_decorate:
            # ???????????????
            if self.in_distributed_mode():
                self.model = DistributedDataParallel(self.model,
                                                     device_ids=[self.local_rank],
                                                     output_device=self.local_rank)
                logging.info('Wrap distributed data parallel')
                # logging.info('In Distributed Mode, but do not use DistributedDataParallel Wrapper')
            # ????????????
            elif self.n_gpus > 1 and not self.no_cuda:  # ?????? ????????????
                if self.device_ids is None:
                    self.device_ids = range(torch.cuda.device_count())
                """
                GPU?????????????????????????????????:
                ???????????????GPU???12GB??????????????????10GB????????????GPU???????????????2GB???
                ??????????????????????????????????????????????????????????????????loss?????????????????????????????????????????????GPU???????????????????????????????????????GPU?????????????????????????????????????????????
                
                ??????DistributedDataParallel???GPUs??????????????????DataParallel???????????????????????????Pytorch????????????nccl????????????
                ??????????????????DistributedDataParallel?????????
                """
                # self.model = DataParallel(self.model, device_ids=self.device_ids)
                self.model = DistributedDataParallel(self.model, device_ids=self.device_ids)

                logging.info(f'Wrap data parallel on model with multiple gpus={self.device_ids}')
        else:
            logging.info('Do not wrap parallel layers')

    def prepare_dist_data_loader(self, dataset, batch_size, epoch=0):
        """
        @author:wangfc
        @desc:
        ???????????????????????????????????????
        from torch.nn.parallel.distributed import DistributedDataParallel
        self._decarate_mode(paralle_decorate=True)

        ???????????? dataloader?????????DDP???????????????shard??????
            ????????????????????????????????????torch.distributed.get_rank()???shard????????????????????????????????????
            ?????????Dataset API?????????????????????Dataloader????????????DistributedSampler ???shard???
            each process needs to know which slice of the data to work on so that the batches are non-overlapping

        @version???
        @time:2021/3/8 22:40

        Parameters
        ----------

        ???GPU????????????????????????????????????????????????(???????????????????????????x2)??????????????????????????????pin_memory(????????????)?????????
        ??????DistributedDataParallel???GPUs??????????????????DataParallel???????????????????????????Pytorch????????????nccl????????????
        ??????????????????DistributedDataParallel?????????
        ??????????????????????????????
        pin_memory???????????????????????????DataLoader????????????pin_memory=True????????????????????????Tensor???????????????????????????????????????????????????
        ??????????????????Tensor?????????GPU??????????????????????????????
        ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
        ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????,???????????????????????????????????????????????????pin_memory=True???
        ??????????????????????????????????????????????????????????????????pin_memory=False?????????pin_memory??????????????????????????????pytorch???????????????????????????????????????????????????????????????
        ??????pin_memory?????????False???

        Returns
        -------
        """
        # prepare distributed data loader
        # ???????????????????????????????????????????????????????????????
        data_sampler = DistributedSampler(dataset)
        data_sampler.set_epoch(epoch)

        if self.custom_collate_fn is None:
            dataloader = DataLoader(dataset,
                                    batch_size=batch_size,
                                    sampler=data_sampler)
        else:
            dataloader = DataLoader(dataset,
                                    batch_size=batch_size,
                                    sampler=data_sampler,
                                    collate_fn=self.custom_collate_fn)
        return dataloader

    def _init_bert_optimizer(self):
        """
        @author:wangfc27441
        @desc:  ????????? bert_optimizer ??? ???????????????????????????
        @version???
        @time:2020/7/30 9:12

        """
        logger.info('=' * 20 + 'Init Bert Optimizer' + '=' * 20)
        self.optimizer, self.num_train_steps, self.model_named_parameters, self.scheduler = \
            self.reset_bert_optimizer()

    def reset_bert_optimizer(self):
        """
        @author:wangfc27441
        @desc:
        @version???
        @time:2020/7/30 9:13

        """
        # Prepare optimizer
        if self.fp16:
            model_named_parameters = [(n, param.clone().detach().to('cpu').float().requires_grad_())
                                      for n, param in self.model.named_parameters()]
        elif self.optimize_on_cpu:
            model_named_parameters = [(n, param.clone().detach().to('cpu').requires_grad_())
                                      for n, param in self.model.named_parameters()]
        else:
            model_named_parameters = list(self.model.named_parameters())

        no_decay = ['bias', 'gamma', 'beta']
        optimizer_grouped_parameters = [
            {
                'params': [p for n, p in model_named_parameters if n not in no_decay],
                'weight_decay_rate': self.weight_decay_rate  # ???????????? weight_decay_rate
            },
            {
                'params': [p for n, p in model_named_parameters if n in no_decay],
                'weight_decay_rate': 0.0
            }
        ]

        # optimizer = BertAdam(optimizer_grouped_parameters,
        # ??????????????? ckpt ?????????????????????????????? resume_global_step ???????????????????????????
        optimizer = AdamW(optimizer_grouped_parameters,
                          lr=self.learning_rate)
        # warmup=self.setting.warmup_proportion,
        # t_total=num_train_steps)

        # ?????? create scheduler ???????????????????????????????????? lr
        # ?????? train_batch_size ?????????????????????????????? gradient_accumulation_steps ????????? ????????? batch???
        # num_train_steps ????????? ??? batch ?????? loss ?????????
        # ?????? optimizer.step() ?????????????????????????????? num_train_steps/gradient_accumulation_steps
        # ?????? scheduler.step() ????????? optimizer.step() ?????????????????????????????? scheduler ??????????????? num_steps = num_train_steps/gradient_accumulation_steps
        num_train_steps = int(len(self.train_examples)
                              / self.train_batch_size
                              / self.gradient_accumulation_steps
                              * self.num_train_epochs)
        num_warmup_steps = self.warmup_proportion * num_train_steps
        scheduler = transformers.get_linear_schedule_with_warmup(optimizer,
                                                                 num_warmup_steps=num_warmup_steps,
                                                                 num_training_steps=num_train_steps)
        logger.info(f"?????? linear_schedule_with_warmup???num_train_epochs={self.num_train_epochs},"
                    f"train_examples={len(self.train_examples)},"
                    f"train_batch_size={self.train_batch_size},"
                    f"gradient_accumulation_steps={self.gradient_accumulation_steps},"
                    f"num_train_steps = {num_train_steps}???warmup_proportion ={self.warmup_proportion}, num_warmup_steps= {num_warmup_steps} ")

        return optimizer, num_train_steps, model_named_parameters, scheduler

    # def save_and_resume_checkpoint(self,save=True,resume=False,epoch=None, global_step=None, cpt_file_name=None):
    #     if cpt_file_name is None:
    #         cpt_file_name = self.cpt_file_name
    #     if epoch is not None:
    #         cpt_file_name = f"{cpt_file_name}_{epoch}.pt"
    #
    #     if save:
    #         self.save_checkpoint(epoch=epoch,global_step=global_step,cpt_file_name=cpt_file_name)
    #     elif resume:
    #         if epoch is not None:
    #             resume_epoch = epoch
    #         else:
    #             resume_epoch = self.get_latest_cpt_epoch()
    #         self.resume_cpt_at(epoch=resume_epoch)


def epoch_time(start_time, end_time):
    elapsed_time = end_time - start_time
    elapsed_mins = int(elapsed_time / 60)
    elapsed_secs = int(elapsed_time - (elapsed_mins * 60))
    return elapsed_mins, elapsed_secs


class InputTensor():
    def __init__(self, model_name, text, text_lengths=None):
        if model_name == "lstm":
            self.text = (text, text_lengths)
        elif model_name == "fasttext":
            self.text = text


def predict(model_name, model, sentence, tokenize, TEXT, device):
    model.eval()
    # ????????? tokens
    tokens = tokenize(sentence)
    if model_name == "lstm":
        # ????????? indies ??? length
        indies = [TEXT.vocab.stoi[token] for token in tokens]
        lengthes = [indies.__len__()]
        logger.info(f"sentence={sentence},tokens={tokens},indies={indies},lengthes={lengthes}")
        # length_tensor = torch.LongTensor(length).unsqueeze(dim=1) #.to(device) ??????CPU???
        length_tensor = torch.LongTensor(lengthes)
        # ?????????tensor
        tensor = torch.LongTensor(indies).to(device).unsqueeze(dim=1)

        # ??????????????? input_tensor
        input_tensor = InputTensor(text=tensor, text_lengths=length_tensor)
        output_tensor = model(input_tensor)
    elif model_name == "fasttext":
        n_gram_tokens = generate_n_gram(x=tokens)
        # ????????? indies
        indies = [TEXT.vocab.stoi[token] for token in n_gram_tokens]
        logger.info(f"sentence={sentence},tokens={n_gram_tokens},indies={indies}")
        # ?????????tensor
        tensor = torch.LongTensor(indies).to(device).unsqueeze(dim=1)
        input_tensor = InputTensor(model_name=model_name, text=tensor)
        output_tensor = model(input_tensor)

    output_softmax = torch.softmax(output_tensor, dim=-1)
    # ????????????
    probability = torch.max(output_softmax, dim=-1)
    y_pred = torch.argmax(output_softmax, dim=-1, keepdim=False)
    return y_pred.item(), probability.values.item()


class TextClassifierTaskTorch(BaseTorchTask):
    def __init__(self, embedding='random', vocab_path=None,max_sequence_length=32,
                 adversarial_train_mode=None,
                 epsilon=8,alpha=10,delta_init='random',perturb_norm_length=5.0,
                 adv_reg_coeff= 1.0,
                 normalize_embeddings=True,max_grad_norm =1.0,keep_prob_emb=1.0,
                 attack_iters=7,minibatch_replays=8,
                 *args, **kwargs):
        super(TextClassifierTaskTorch, self).__init__(init_model=False, adversarial_train_mode=adversarial_train_mode,
                                                      *args, **kwargs)
        self.embedding = embedding
        self.vocab_path = vocab_path
        self.vocab, self.vocab_freq = self._build_vocab()

        self.max_sequence_length = max_sequence_length


        self.epsilon = epsilon
        self.alpha = alpha
        self.delta_init = delta_init
        self.perturb_norm_length = perturb_norm_length
        self.adv_reg_coeff = adv_reg_coeff
        self.normalize_embeddings = normalize_embeddings
        self.max_grad_norm = max_grad_norm
        self.keep_prob_emb = keep_prob_emb
        # pgd Attack iterations
        self.attack_iters = attack_iters
        # free minibatch_replays
        self.minibatch_replays = minibatch_replays
        self._init_model()

    def _build_vocab(self) -> Dict[Text, int]:
        from data_process.vocab_utils import build_vocab
        train_file_path = os.path.join(self.data_dir, self.train_filename)
        vocab, vocab_freq = build_vocab(vocab_path=self.vocab_path, file_path=train_file_path, tokenizer=self.tokenizer)
        return vocab, vocab_freq

    def _build_model(self, model_config: Dict[Text, Any]):
        from models.models_torch.classifiers.TextCNN import Model as TextCNNModel
        from models.models_torch.classifiers.TextCNN import TextCNNAT
        if model_config["model_name"] == 'TextCNN':
            model = TextCNNModel(config=model_config)
        elif model_config["model_name"] == 'TextCNNAT':
            model = TextCNNAT(config=model_config, vocab_freq=self.vocab_freq)

        self._init_model_weights(model=model)
        return model

    # ????????????????????????xavier
    def _init_model_weights(self, model, method='xavier', exclude='embedding', seed=123):
        for name, w in model.named_parameters():
            if exclude not in name:
                if 'weight' in name:
                    if method == 'xavier':
                        torch.nn.init.xavier_normal_(w)
                    elif method == 'kaiming':
                        torch.nn.init.kaiming_normal_(w)
                    else:
                        torch.nn.init.normal_(w)
                elif 'bias' in name:
                    torch.nn.init.constant_(w, 0)
                else:
                    pass

    def _load_datasets(self, load_train=True, load_dev=False, load_test=False, overwrite_saved_datafile=False) -> List[Dataset]:
        from data_process.dataset_torch import TextClassifierDataset
        train_dataset, dev_dataset, test_dataset = None, None, None
        if load_train:
            train_path = os.path.join(self.data_dir, self.train_filename)
            train_dataset = TextClassifierDataset(train_path, tokenizer=self.tokenizer, vocab=self.vocab,
                                                  pad_size=self.max_sequence_length)
        if load_dev:
            dev_path = os.path.join(self.data_dir, self.dev_filename)
            dev_dataset = TextClassifierDataset(dev_path, tokenizer=self.tokenizer, vocab=self.vocab,
                                                pad_size=self.max_sequence_length)
        if load_test:
            test_path = os.path.join(self.data_dir, self.test_filename)
            test_dataset = TextClassifierDataset(test_path, tokenizer=self.tokenizer, vocab=self.vocab,
                                                 pad_size=self.max_sequence_length)
        return train_dataset, dev_dataset, test_dataset


    def _set_tensor_on_device(self,x):
        return torch.tensor(x).to(self.device)


    def train(self):
        # ????????? random_seed
        _reset_random_seed(seed=self.seed, n_gpu=self.n_gpu)
        # ?????????????????????
        train_dataset, dev_dataset, test_dataset = self._load_datasets(load_train=True, load_dev=True, load_test=True)
        #  ?????? data_loader
        train_dataloader = self._prepare_data_loader(data_type='train',
                                                     dataset=train_dataset,
                                                     batch_size=self.train_batch_size,
                                                     rand_flag=self.random_sampling)
        if dev_dataset:
            dev_dataloader = self._prepare_data_loader(data_type='dev',
                                                       dataset=dev_dataset,
                                                       batch_size=self.dev_batch_size)
        best_valid_loss_on_epoch = self.best_valid_loss
        best_valid_loss_on_step = self.best_valid_loss
        global_step = 0
        delta = None
        for epoch in range(self.num_train_epochs):
            if self.adversarial_train_mode is None:
                global_step,best_valid_loss_on_step = self._train_on_epoch(epoch=epoch, train_dataloader=train_dataloader,
                                                               dev_dataloader=dev_dataloader,
                                                               global_step=global_step,
                                                               best_valid_loss=best_valid_loss_on_step)
            else:
                # ?????? free ?????? ??????????????????????????????????????????????????? delta
                global_step, best_valid_loss_on_step,delta = self._adversarial_train_on_epoch(
                    epoch=epoch, train_dataloader=train_dataloader, dev_dataloader=dev_dataloader,
                    global_step=global_step,best_valid_loss=best_valid_loss_on_step,
                    adversarial_train_mode=self.adversarial_train_mode,
                    delta = delta
                )

            if self.save_checkpoint_every_epoch and epoch % self.save_checkpoint_every_epoch == 0:
                dev_loss_on_epoch, dev_metric_on_epoch, _, _ = self.evaluate(data_iterator=dev_dataloader)
                if dev_loss_on_epoch < best_valid_loss_on_epoch:
                    best_valid_loss_on_epoch = dev_loss_on_epoch
                    self.save_model(epoch=epoch,global_step=global_step)

        if test_dataset:
            test_dataloader = self._prepare_data_loader(data_type='test',
                                                        dataset=test_dataset,
                                                        batch_size=self.test_batch_size)
            self.test(test_dataloader=test_dataloader)


    def _adversarial_train_on_epoch(self, epoch, train_dataloader: DataLoader,
                                    dev_dataloader: DataLoader = None,
                                    global_step=0,
                                    best_valid_loss=None,
                                    adversarial_train_mode=None,
                                    delta=None
                                    ):
        """
        ??????????????????:
        1. ???????????????????????????
        2. ?????????????????? adv_loss
        3. loss + adv_loss ????????????????????????: ??? adv_loss ???????????? regularizer

        1. ???????????????????????????
        fgsm:
        1?????? ????????? ebedding = (batch_size, seq_length,embedding_size) ????????????????????????
        2??????????????? ????????? l2 ?????????
        3???????????????????????????

        free???
        ????????????????????????????????? minibatch_replays?????????????????? ??????????????? loss??????????????????


        pgd???
        ?????????????????????????????????????????????????????????????????????????????? attack_iters ?????????????????????
        ??????????????? ??????????????????loss?????????????????????

        """
        std =1
        epsilon = self.epsilon
        alpha = self.alpha
        norm_length = self.perturb_norm_length

        # ???????????????
        epsilon = self._set_tensor_on_device((epsilon / 255.) / std )
        # ????????????????????? ????????? ??? alpha= 1.25 epsilon?????????????????????????????????
        alpha = self._set_tensor_on_device((alpha / 255.) / std)
        # pgd ????????????????????? ??????
        pgd_alpha = self._set_tensor_on_device((2 / 255.) / std)
        attack_iters = self.attack_iters
        minibatch_replays = self.minibatch_replays

        upper_limit = self._set_tensor_on_device(1)
        lower_limit = self._set_tensor_on_device(0)

        self.model.train()
        # ?????????????????????batch
        epoch_loss_sum = 0

        if delta is None:
            if adversarial_train_mode=='free' and global_step>0:
                raise ValueError("free ??????????????????????????????????????????")
            # ????????? delta = (batch_size, seq_len, embedding_dim)
            delta = torch.zeros(self.train_batch_size, self.max_sequence_length,self.model.embedding_dim).to(self.device)
        else:
            if adversarial_train_mode in ['fgsm','pgd']:
                raise ValueError("fgsm pgd ?????????????????????????????????????????????")

        for step, batch in enumerate(train_dataloader):
            batch = self._set_batch_on_device(batch, device=self.device)
            token_ids,labels,seq_lengths = batch
            batch_size = token_ids.shape[0]

            if global_step % self.log_summary_every_step == 0:
                logger.info(f"????????????epoch={epoch},step={step},global_step={global_step}")

            self.optimizer.zero_grad()

            # ???????????????????????????
            # embedded  = (batch_size, seq_len, embedding_dim)
            embedded = self.model.embedding(token_ids)
            embedding_dim = embedded.shape[-1]

            # ?????? fgsm ??? pgd, ??????????????????????????? delta
            if adversarial_train_mode in ['fgsm','pgd'] and self.delta_init == 'random':
                # ????????????????????????????????? (-epsilon, epsilon) ???????????? ?????????
                for i in range(embedding_dim):
                    delta[:, :, i].uniform_(-epsilon, epsilon)
                # ??? ??????delta ????????????
                delta.data = clamp(delta, lower_limit - embedded , upper_limit - embedded)
            elif adversarial_train_mode =='free':
                # Free??????????????????????????????????????????????????? delta
                pass


            delta.requires_grad = True

            if adversarial_train_mode == 'fgsm':
                # ?????? fgsm ??????????????????
                delta = self._fgsm_train_on_batch(delta, embedded, labels, batch_size, epsilon, alpha, lower_limit, upper_limit,
                                     norm_length)

            elif adversarial_train_mode =='pgd':
                delta = self._pgd_train_on_batch(delta, embedded, labels, batch_size, epsilon, alpha, lower_limit, upper_limit,
                                     norm_length,attack_iters
                                                 )
            elif adversarial_train_mode =='free':
                # Free??????????????????????????????????????????????????? delta
                delta = self._free_train_on_batch(delta, embedded, labels, batch_size, epsilon, alpha, lower_limit, upper_limit,
                                     norm_length,minibatch_replays)


            # ??? optimizer ????????????????????????
            self.optimizer.zero_grad()

            # ???????????? embedded
            embedded = self.model.embedding(token_ids)
            # ????????????????????????????????????
            adv_output = self.model(embedded + delta[:batch_size], input_embedding=True)
            # ??????????????????????????? adv_loss
            adv_loss = self.loss_fn(adv_output, labels)

            # ?????????????????????
            output = self.model(batch)
            loss = self.loss_fn(output, labels)

            # ?????? loss + adv_loss
            total_loss = loss + self.adv_reg_coeff * adv_loss
            # ???????????????loss ????????????:
            # ????????????backward()?????????retain_graph????????????????????????????????????????????????????????????????????????????????????????????????????????????
            total_loss.backward()
            self.optimizer.step()

            epoch_loss_sum += total_loss.item()

            if self.evaluate_every_step and global_step % self.evaluate_every_step == 0:
                # ????????????????????????
                self.model.eval()
                output = self.model(batch)
                predicts = torch.argmax(output, dim=-1)
                train_metric = self.metric_fn(labels.cpu(), predicts.cpu())
                # ??? dev ?????????????????????
                dev_loss, dev_metric = None, None
                if dev_dataloader:
                    dev_loss, dev_metric, _, _ = self.evaluate(dev_dataloader)
                    if self.save_checkpoint_every_step and dev_loss < best_valid_loss:
                        best_valid_loss = dev_loss
                        self.save_model(epoch=epoch, global_step=global_step)
                        improve = '*'
                        # last_improve_step = global_step
                    else:
                        improve = ''

                self.summary_writer.add_scalar("loss/train", loss.item(), global_step)
                self.summary_writer.add_scalar("loss/adv_loss", adv_loss.item(), global_step)
                self.summary_writer.add_scalar("loss/total_loss", total_loss.item(), global_step)

                self.summary_writer.add_scalar("loss/dev", dev_loss.item(), global_step)
                self.summary_writer.add_scalar(f"{self.metric_name}/train", train_metric, global_step)
                self.summary_writer.add_scalar(f"{self.metric_name}/dev", dev_metric, global_step)
                self.model.train()
                logger.info(f"epoch={epoch},step={step},global_step={global_step},"
                            f"total_loss={total_loss.item()},loss={loss.item()},adv_loss={adv_loss},"
                            f"train_{self.metric_name} ={train_metric},"
                            f"dev_loss={dev_loss.item()},dev_{self.metric_name}={dev_metric},"
                            f"improve={improve}")

            global_step+=1
        epoch_loss_avg = epoch_loss_sum / train_dataloader.__len__()
        return global_step,best_valid_loss,delta

    def _fgsm_train_on_batch(self,delta,embedded,labels, batch_size, epsilon, alpha,lower_limit, upper_limit,norm_length):
        # ???????????????????????????????????????????????? X -> X + delta[:X.size(0)]
        output = self.model(embedded + delta[:batch_size], input_embedding=True)

        self.optimizer.zero_grad()
        # ?????? adversarial_train_loss
        adversarial_train_loss = self.loss_fn(output, labels)
        adversarial_train_loss.backward()
        # ???????????? delta ??????
        grad = delta.grad.detach()

        # ?????? delta + alpha * torch.sign(grad) ???????????????????????????  alpha ????????????????????? epsilon ????????????
        delta.data = clamp(delta + alpha * torch.sign(grad), -epsilon, epsilon)
        # ?????????????????????????????????
        delta.data[:batch_size] = clamp(delta[:batch_size], lower_limit - embedded, upper_limit - embedded)

        # detach
        delta = delta.detach()

        # ?????? l2 ????????????????????????????????????
        delta.data[:batch_size] = l2_normalize(x=delta, norm_length=norm_length)
        return delta


    def _pgd_train_on_batch(self,delta,embedded,labels, batch_size, epsilon, alpha,lower_limit, upper_limit,norm_length,
                            attack_iters):
        # ???????????????????????????????????? attack_iters ????????????????????? ??????
        for i in range(attack_iters):
            # ???????????????????????????????????????????????? X -> X + delta[:X.size(0)]
            embedded =embedded.detach()
            output = self.model(embedded + delta[:batch_size], input_embedding=True)
            self.optimizer.zero_grad()
            # ?????? adversarial_train_loss
            adversarial_train_loss = self.loss_fn(output, labels)
            # ?????? .backward() ????????? buffer
            adversarial_train_loss.backward()
            # ???????????? delta ??????
            grad = delta.grad.detach()

            # ?????? delta + alpha * torch.sign(grad) ???????????????????????????  alpha ????????????????????? epsilon ????????????
            delta.data = clamp(delta + alpha * torch.sign(grad), -epsilon, epsilon)
            # ?????????????????????????????????
            delta.data[:batch_size] = clamp(delta[:batch_size], lower_limit - embedded, upper_limit - embedded)
            # delta ????????????
            delta.grad.zero_()

        # detach
        delta = delta.detach()

        # ?????? l2 ?????????,???????????????????????????
        delta.data[:batch_size] = l2_normalize(x=delta, norm_length=norm_length)

        return delta


    def _free_train_on_batch(self,delta,embedded,labels, batch_size, epsilon, alpha,lower_limit, upper_limit,norm_length,
                            minibatch_replays):
        # Free??????????????????????????????????????????????????? delta????????? minibatch_replays ???????????????????????????
        for i in range(minibatch_replays):
            # ???????????? ????????????????????????????????? X -> X + delta[:X.size(0)]
            embedded =embedded.detach()
            output = self.model(embedded + delta[:batch_size], input_embedding=True)

            self.optimizer.zero_grad()
            # ???????????????????????? loss
            adversarial_train_loss = self.loss_fn(output, labels)
            # ?????? .backward() ????????? buffer
            adversarial_train_loss.backward()
            # ???????????? delta ??????
            grad = delta.grad.detach()

            # ????????????????????????????????????????????? ??????
            delta.data = clamp(delta + alpha * torch.sign(grad), -epsilon, epsilon)
            delta.data[:batch_size] = clamp(delta[:batch_size], lower_limit - embedded, upper_limit - embedded)

            # ??????????????????
            self.optimizer.step()

            # delta ????????????
            delta.grad.zero_()

        # detach
        delta = delta.detach()

        # ?????? l2 ?????????,???????????????????????????
        delta.data[:batch_size] = l2_normalize(x=delta[:batch_size], norm_length=norm_length)

        return delta




    def test(self, test_dataloader: Iterable = None):
        class_list = self.model_config.class_list
        self.load_saved_model()
        model = self.model

        if test_dataloader is None:
            _, _, test_dataset = self._load_datasets(load_train=False, load_dev=False, load_test=True)
            test_dataloader = self._prepare_data_loader(data_type='test',
                                                        dataset=test_dataset,
                                                        batch_size=self.test_batch_size)

        # test
        # model.load_state_dict(torch.load(saved_model_path))
        model.eval()
        start_time = time.time()
        test_loss, test_acc, predict_all, labels_all = self.evaluate(test_dataloader)
        test_report = metrics.classification_report(labels_all, predict_all, target_names=class_list, digits=4)
        test_confusion = metrics.confusion_matrix(labels_all, predict_all)
        msg = 'Test Loss: {0:>5.2},  Test Acc: {1:>6.2%}'
        print(msg.format(test_loss, test_acc))
        print("Precision, Recall and F1-Score...")
        print(test_report)
        print("Confusion Matrix...")
        print(test_confusion)
        time_dif = get_time_dif(start_time)
        print("Time usage:", time_dif)

        from utils.io import write_text_file
        test_report_path = os.path.join(self.output_dir, f'test_report_{self.model_config.model_name}.csv')
        test_confusion_path = os.path.join(self.output_dir, 'test_confusion.csv')
        write_text_file(test_report, file_path=test_report_path)
        # write_text_file(test_confusion,file_path=test_confusion_path)

        return test_loss, test_acc, test_report, test_confusion
