??
?#?"
:
Add
x"T
y"T
z"T"
Ttype:
2	
h
All	
input

reduction_indices"Tidx

output
"
	keep_dimsbool( "
Tidxtype0:
2	
?
ArgMax

input"T
	dimension"Tidx
output"output_type" 
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
P
Assert
	condition
	
data2T"
T
list(type)(0"
	summarizeint?
x
Assign
ref"T?

value"T

output_ref"T?"	
Ttype"
validate_shapebool("
use_lockingbool(?
i
BatchMatMul
x"T
y"T
output"T"
Ttype:

2	"
adj_xbool( "
adj_ybool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
?
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
.
Identity

input"T
output"T"	
Ttype
:
Less
x"T
y"T
z
"
Ttype:
2	
?
	LessEqual
x"T
y"T
z
"
Ttype:
2	
?

LogSoftmax
logits"T

logsoftmax"T"
Ttype:
2
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
;
Maximum
x"T
y"T
z"T"
Ttype:

2	?
?
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
=
Mul
x"T
y"T
z"T"
Ttype:
2	?
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
?
OneHot
indices"TI	
depth
on_value"T
	off_value"T
output"T"
axisint?????????"	
Ttype"
TItype0	:
2	
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
6
Pow
x"T
y"T
z"T"
Ttype:

2	
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
9
Softmax
logits"T
softmax"T"
Ttype:
2
1
Square
x"T
y"T"
Ttype:

2	
G
SquaredDifference
x"T
y"T
z"T"
Ttype:

2	?
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
2
StopGradient

input"T
output"T"	
Ttype
?
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
?
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
-
Tanh
x"T
y"T"
Ttype:

2
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
?
TruncatedNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	?
s

VariableV2
ref"dtype?"
shapeshape"
dtypetype"
	containerstring "
shared_namestring ?"serve*1.13.12b'v1.13.1-0-g6612da8951'8??

global_step/Initializer/zerosConst*
value	B	 R *
dtype0	*
_output_shapes
: *
_class
loc:@global_step
k
global_step
VariableV2*
_output_shapes
: *
_class
loc:@global_step*
shape: *
dtype0	
?
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
_output_shapes
: *
_class
loc:@global_step*
T0	
j
global_step/readIdentityglobal_step*
_class
loc:@global_step*
T0	*
_output_shapes
: 
d
	label_idsPlaceholder*#
_output_shapes
:?????????*
shape:?????????*
dtype0
n
input_ids_aPlaceholder*'
_output_shapes
:?????????*
shape:?????????*
dtype0
n
input_ids_bPlaceholder*
shape:?????????*
dtype0*'
_output_shapes
:?????????
o
input_mask_aPlaceholder*
dtype0*
shape:?????????*'
_output_shapes
:?????????
o
input_mask_bPlaceholder*'
_output_shapes
:?????????*
shape:?????????*
dtype0
p
segment_ids_aPlaceholder*'
_output_shapes
:?????????*
dtype0*
shape:?????????
p
segment_ids_bPlaceholder*
dtype0*'
_output_shapes
:?????????*
shape:?????????
f
label_ids_1Placeholder*
shape:?????????*
dtype0*#
_output_shapes
:?????????
p
input_ids_a_1Placeholder*
shape:?????????*'
_output_shapes
:?????????*
dtype0
p
input_ids_b_1Placeholder*
dtype0*
shape:?????????*'
_output_shapes
:?????????
q
input_mask_a_1Placeholder*
shape:?????????*
dtype0*'
_output_shapes
:?????????
q
input_mask_b_1Placeholder*
dtype0*
shape:?????????*'
_output_shapes
:?????????
r
segment_ids_a_1Placeholder*
shape:?????????*
dtype0*'
_output_shapes
:?????????
r
segment_ids_b_1Placeholder*
shape:?????????*
dtype0*'
_output_shapes
:?????????
@
ShapeShapelabel_ids_1*
T0*
_output_shapes
:
O

ones/ConstConst*
valueB
 *  ??*
_output_shapes
: *
dtype0
M
onesFillShape
ones/Const*#
_output_shapes
:?????????*
T0
G

bert/ShapeShapeinput_ids_a_1*
T0*
_output_shapes
:
b
bert/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
d
bert/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
d
bert/strided_slice/stack_2Const*
valueB:*
_output_shapes
:*
dtype0
?
bert/strided_sliceStridedSlice
bert/Shapebert/strided_slice/stackbert/strided_slice/stack_1bert/strided_slice/stack_2*
Index0*
_output_shapes
: *
shrink_axis_mask*
T0
v
#bert/bert/embeddings/ExpandDims/dimConst*
_output_shapes
:*
valueB:
?????????*
dtype0
?
bert/bert/embeddings/ExpandDims
ExpandDimsinput_ids_a_1#bert/bert/embeddings/ExpandDims/dim*
T0*+
_output_shapes
:?????????
?
Bbert/embeddings/word_embeddings/Initializer/truncated_normal/shapeConst*2
_class(
&$loc:@bert/embeddings/word_embeddings*
dtype0*
_output_shapes
:*
valueB"L_  ?   
?
Abert/embeddings/word_embeddings/Initializer/truncated_normal/meanConst*
valueB
 *    *2
_class(
&$loc:@bert/embeddings/word_embeddings*
_output_shapes
: *
dtype0
?
Cbert/embeddings/word_embeddings/Initializer/truncated_normal/stddevConst*
dtype0*2
_class(
&$loc:@bert/embeddings/word_embeddings*
_output_shapes
: *
valueB
 *
ף<
?
Lbert/embeddings/word_embeddings/Initializer/truncated_normal/TruncatedNormalTruncatedNormalBbert/embeddings/word_embeddings/Initializer/truncated_normal/shape*!
_output_shapes
:̾?*2
_class(
&$loc:@bert/embeddings/word_embeddings*
T0*
dtype0
?
@bert/embeddings/word_embeddings/Initializer/truncated_normal/mulMulLbert/embeddings/word_embeddings/Initializer/truncated_normal/TruncatedNormalCbert/embeddings/word_embeddings/Initializer/truncated_normal/stddev*
T0*2
_class(
&$loc:@bert/embeddings/word_embeddings*!
_output_shapes
:̾?
?
<bert/embeddings/word_embeddings/Initializer/truncated_normalAdd@bert/embeddings/word_embeddings/Initializer/truncated_normal/mulAbert/embeddings/word_embeddings/Initializer/truncated_normal/mean*
T0*!
_output_shapes
:̾?*2
_class(
&$loc:@bert/embeddings/word_embeddings
?
bert/embeddings/word_embeddings
VariableV2*!
_output_shapes
:̾?*
dtype0*2
_class(
&$loc:@bert/embeddings/word_embeddings*
shape:̾?
?
&bert/embeddings/word_embeddings/AssignAssignbert/embeddings/word_embeddings<bert/embeddings/word_embeddings/Initializer/truncated_normal*
T0*2
_class(
&$loc:@bert/embeddings/word_embeddings*!
_output_shapes
:̾?
?
$bert/embeddings/word_embeddings/readIdentitybert/embeddings/word_embeddings*!
_output_shapes
:̾?*2
_class(
&$loc:@bert/embeddings/word_embeddings*
T0
u
"bert/bert/embeddings/Reshape/shapeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
bert/bert/embeddings/ReshapeReshapebert/bert/embeddings/ExpandDims"bert/bert/embeddings/Reshape/shape*
T0*#
_output_shapes
:?????????
d
"bert/bert/embeddings/GatherV2/axisConst*
value	B : *
dtype0*
_output_shapes
: 
?
bert/bert/embeddings/GatherV2GatherV2$bert/embeddings/word_embeddings/readbert/bert/embeddings/Reshape"bert/bert/embeddings/GatherV2/axis*
Taxis0*
Tindices0*
Tparams0*(
_output_shapes
:??????????
?
Dbert/embeddings/word_embeddings_2/Initializer/truncated_normal/shapeConst*
dtype0*
_output_shapes
:*4
_class*
(&loc:@bert/embeddings/word_embeddings_2*
valueB"?   8  
?
Cbert/embeddings/word_embeddings_2/Initializer/truncated_normal/meanConst*
dtype0*4
_class*
(&loc:@bert/embeddings/word_embeddings_2*
valueB
 *    *
_output_shapes
: 
?
Ebert/embeddings/word_embeddings_2/Initializer/truncated_normal/stddevConst*
_output_shapes
: *4
_class*
(&loc:@bert/embeddings/word_embeddings_2*
valueB
 *
ף<*
dtype0
?
Nbert/embeddings/word_embeddings_2/Initializer/truncated_normal/TruncatedNormalTruncatedNormalDbert/embeddings/word_embeddings_2/Initializer/truncated_normal/shape*
dtype0* 
_output_shapes
:
??*
T0*4
_class*
(&loc:@bert/embeddings/word_embeddings_2
?
Bbert/embeddings/word_embeddings_2/Initializer/truncated_normal/mulMulNbert/embeddings/word_embeddings_2/Initializer/truncated_normal/TruncatedNormalEbert/embeddings/word_embeddings_2/Initializer/truncated_normal/stddev* 
_output_shapes
:
??*4
_class*
(&loc:@bert/embeddings/word_embeddings_2*
T0
?
>bert/embeddings/word_embeddings_2/Initializer/truncated_normalAddBbert/embeddings/word_embeddings_2/Initializer/truncated_normal/mulCbert/embeddings/word_embeddings_2/Initializer/truncated_normal/mean*
T0* 
_output_shapes
:
??*4
_class*
(&loc:@bert/embeddings/word_embeddings_2
?
!bert/embeddings/word_embeddings_2
VariableV2*4
_class*
(&loc:@bert/embeddings/word_embeddings_2*
shape:
??* 
_output_shapes
:
??*
dtype0
?
(bert/embeddings/word_embeddings_2/AssignAssign!bert/embeddings/word_embeddings_2>bert/embeddings/word_embeddings_2/Initializer/truncated_normal* 
_output_shapes
:
??*
T0*4
_class*
(&loc:@bert/embeddings/word_embeddings_2
?
&bert/embeddings/word_embeddings_2/readIdentity!bert/embeddings/word_embeddings_2* 
_output_shapes
:
??*
T0*4
_class*
(&loc:@bert/embeddings/word_embeddings_2
?
bert/bert/embeddings/MatMulMatMulbert/bert/embeddings/GatherV2&bert/embeddings/word_embeddings_2/read*
T0*(
_output_shapes
:??????????
i
bert/bert/embeddings/ShapeShapebert/bert/embeddings/ExpandDims*
T0*
_output_shapes
:
r
(bert/bert/embeddings/strided_slice/stackConst*
valueB: *
_output_shapes
:*
dtype0
t
*bert/bert/embeddings/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
t
*bert/bert/embeddings/strided_slice/stack_2Const*
valueB:*
_output_shapes
:*
dtype0
?
"bert/bert/embeddings/strided_sliceStridedSlicebert/bert/embeddings/Shape(bert/bert/embeddings/strided_slice/stack*bert/bert/embeddings/strided_slice/stack_1*bert/bert/embeddings/strided_slice/stack_2*
Index0*
_output_shapes
: *
shrink_axis_mask*
T0
h
&bert/bert/embeddings/Reshape_1/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
i
&bert/bert/embeddings/Reshape_1/shape/2Const*
dtype0*
_output_shapes
: *
value
B :?
?
$bert/bert/embeddings/Reshape_1/shapePack"bert/bert/embeddings/strided_slice&bert/bert/embeddings/Reshape_1/shape/1&bert/bert/embeddings/Reshape_1/shape/2*
T0*
_output_shapes
:*
N
?
bert/bert/embeddings/Reshape_1Reshapebert/bert/embeddings/MatMul$bert/bert/embeddings/Reshape_1/shape*
T0*,
_output_shapes
:??????????
j
bert/bert/embeddings/Shape_1Shapebert/bert/embeddings/Reshape_1*
T0*
_output_shapes
:
t
*bert/bert/embeddings/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 
v
,bert/bert/embeddings/strided_slice_1/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
v
,bert/bert/embeddings/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
$bert/bert/embeddings/strided_slice_1StridedSlicebert/bert/embeddings/Shape_1*bert/bert/embeddings/strided_slice_1/stack,bert/bert/embeddings/strided_slice_1/stack_1,bert/bert/embeddings/strided_slice_1/stack_2*
Index0*
shrink_axis_mask*
_output_shapes
: *
T0
?
Hbert/embeddings/token_type_embeddings/Initializer/truncated_normal/shapeConst*
_output_shapes
:*
dtype0*8
_class.
,*loc:@bert/embeddings/token_type_embeddings*
valueB"   8  
?
Gbert/embeddings/token_type_embeddings/Initializer/truncated_normal/meanConst*
dtype0*
_output_shapes
: *8
_class.
,*loc:@bert/embeddings/token_type_embeddings*
valueB
 *    
?
Ibert/embeddings/token_type_embeddings/Initializer/truncated_normal/stddevConst*
_output_shapes
: *
dtype0*8
_class.
,*loc:@bert/embeddings/token_type_embeddings*
valueB
 *
ף<
?
Rbert/embeddings/token_type_embeddings/Initializer/truncated_normal/TruncatedNormalTruncatedNormalHbert/embeddings/token_type_embeddings/Initializer/truncated_normal/shape*
T0*8
_class.
,*loc:@bert/embeddings/token_type_embeddings*
dtype0*
_output_shapes
:	?
?
Fbert/embeddings/token_type_embeddings/Initializer/truncated_normal/mulMulRbert/embeddings/token_type_embeddings/Initializer/truncated_normal/TruncatedNormalIbert/embeddings/token_type_embeddings/Initializer/truncated_normal/stddev*
_output_shapes
:	?*
T0*8
_class.
,*loc:@bert/embeddings/token_type_embeddings
?
Bbert/embeddings/token_type_embeddings/Initializer/truncated_normalAddFbert/embeddings/token_type_embeddings/Initializer/truncated_normal/mulGbert/embeddings/token_type_embeddings/Initializer/truncated_normal/mean*
_output_shapes
:	?*
T0*8
_class.
,*loc:@bert/embeddings/token_type_embeddings
?
%bert/embeddings/token_type_embeddings
VariableV2*
_output_shapes
:	?*
dtype0*8
_class.
,*loc:@bert/embeddings/token_type_embeddings*
shape:	?
?
,bert/embeddings/token_type_embeddings/AssignAssign%bert/embeddings/token_type_embeddingsBbert/embeddings/token_type_embeddings/Initializer/truncated_normal*
_output_shapes
:	?*
T0*8
_class.
,*loc:@bert/embeddings/token_type_embeddings
?
*bert/embeddings/token_type_embeddings/readIdentity%bert/embeddings/token_type_embeddings*
_output_shapes
:	?*8
_class.
,*loc:@bert/embeddings/token_type_embeddings*
T0
w
$bert/bert/embeddings/Reshape_2/shapeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
bert/bert/embeddings/Reshape_2Reshapesegment_ids_a_1$bert/bert/embeddings/Reshape_2/shape*
T0*#
_output_shapes
:?????????
j
%bert/bert/embeddings/one_hot/on_valueConst*
dtype0*
valueB
 *  ??*
_output_shapes
: 
k
&bert/bert/embeddings/one_hot/off_valueConst*
valueB
 *    *
dtype0*
_output_shapes
: 
d
"bert/bert/embeddings/one_hot/depthConst*
value	B :*
_output_shapes
: *
dtype0
?
bert/bert/embeddings/one_hotOneHotbert/bert/embeddings/Reshape_2"bert/bert/embeddings/one_hot/depth%bert/bert/embeddings/one_hot/on_value&bert/bert/embeddings/one_hot/off_value*
TI0*'
_output_shapes
:?????????*
T0
?
bert/bert/embeddings/MatMul_1MatMulbert/bert/embeddings/one_hot*bert/embeddings/token_type_embeddings/read*
T0*(
_output_shapes
:??????????
h
&bert/bert/embeddings/Reshape_3/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
i
&bert/bert/embeddings/Reshape_3/shape/2Const*
value
B :?*
dtype0*
_output_shapes
: 
?
$bert/bert/embeddings/Reshape_3/shapePack$bert/bert/embeddings/strided_slice_1&bert/bert/embeddings/Reshape_3/shape/1&bert/bert/embeddings/Reshape_3/shape/2*
T0*
N*
_output_shapes
:
?
bert/bert/embeddings/Reshape_3Reshapebert/bert/embeddings/MatMul_1$bert/bert/embeddings/Reshape_3/shape*,
_output_shapes
:??????????*
T0
?
bert/bert/embeddings/addAddbert/bert/embeddings/Reshape_1bert/bert/embeddings/Reshape_3*
T0*,
_output_shapes
:??????????
j
(bert/bert/embeddings/assert_less_equal/xConst*
value	B :*
dtype0*
_output_shapes
: 
k
(bert/bert/embeddings/assert_less_equal/yConst*
_output_shapes
: *
dtype0*
value
B :?
?
0bert/bert/embeddings/assert_less_equal/LessEqual	LessEqual(bert/bert/embeddings/assert_less_equal/x(bert/bert/embeddings/assert_less_equal/y*
_output_shapes
: *
T0
o
,bert/bert/embeddings/assert_less_equal/ConstConst*
valueB *
_output_shapes
: *
dtype0
?
*bert/bert/embeddings/assert_less_equal/AllAll0bert/bert/embeddings/assert_less_equal/LessEqual,bert/bert/embeddings/assert_less_equal/Const*
_output_shapes
: 
t
3bert/bert/embeddings/assert_less_equal/Assert/ConstConst*
dtype0*
valueB B *
_output_shapes
: 
?
5bert/bert/embeddings/assert_less_equal/Assert/Const_1Const*
dtype0*
_output_shapes
: *m
valuedBb B\Condition x <= y did not hold element-wise:x (bert/bert/embeddings/assert_less_equal/x:0) = 
?
5bert/bert/embeddings/assert_less_equal/Assert/Const_2Const*
dtype0*
_output_shapes
: *B
value9B7 B1y (bert/bert/embeddings/assert_less_equal/y:0) = 
|
;bert/bert/embeddings/assert_less_equal/Assert/Assert/data_0Const*
_output_shapes
: *
dtype0*
valueB B 
?
;bert/bert/embeddings/assert_less_equal/Assert/Assert/data_1Const*m
valuedBb B\Condition x <= y did not hold element-wise:x (bert/bert/embeddings/assert_less_equal/x:0) = *
dtype0*
_output_shapes
: 
?
;bert/bert/embeddings/assert_less_equal/Assert/Assert/data_3Const*
dtype0*
_output_shapes
: *B
value9B7 B1y (bert/bert/embeddings/assert_less_equal/y:0) = 
?
4bert/bert/embeddings/assert_less_equal/Assert/AssertAssert*bert/bert/embeddings/assert_less_equal/All;bert/bert/embeddings/assert_less_equal/Assert/Assert/data_0;bert/bert/embeddings/assert_less_equal/Assert/Assert/data_1(bert/bert/embeddings/assert_less_equal/x;bert/bert/embeddings/assert_less_equal/Assert/Assert/data_3(bert/bert/embeddings/assert_less_equal/y*
T	
2
?
Fbert/embeddings/position_embeddings/Initializer/truncated_normal/shapeConst*
dtype0*
_output_shapes
:*
valueB"   8  *6
_class,
*(loc:@bert/embeddings/position_embeddings
?
Ebert/embeddings/position_embeddings/Initializer/truncated_normal/meanConst*
_output_shapes
: *
valueB
 *    *6
_class,
*(loc:@bert/embeddings/position_embeddings*
dtype0
?
Gbert/embeddings/position_embeddings/Initializer/truncated_normal/stddevConst*6
_class,
*(loc:@bert/embeddings/position_embeddings*
_output_shapes
: *
dtype0*
valueB
 *
ף<
?
Pbert/embeddings/position_embeddings/Initializer/truncated_normal/TruncatedNormalTruncatedNormalFbert/embeddings/position_embeddings/Initializer/truncated_normal/shape* 
_output_shapes
:
??*6
_class,
*(loc:@bert/embeddings/position_embeddings*
T0*
dtype0
?
Dbert/embeddings/position_embeddings/Initializer/truncated_normal/mulMulPbert/embeddings/position_embeddings/Initializer/truncated_normal/TruncatedNormalGbert/embeddings/position_embeddings/Initializer/truncated_normal/stddev*6
_class,
*(loc:@bert/embeddings/position_embeddings* 
_output_shapes
:
??*
T0
?
@bert/embeddings/position_embeddings/Initializer/truncated_normalAddDbert/embeddings/position_embeddings/Initializer/truncated_normal/mulEbert/embeddings/position_embeddings/Initializer/truncated_normal/mean* 
_output_shapes
:
??*
T0*6
_class,
*(loc:@bert/embeddings/position_embeddings
?
#bert/embeddings/position_embeddings
VariableV2*6
_class,
*(loc:@bert/embeddings/position_embeddings*
shape:
??*
dtype0* 
_output_shapes
:
??
?
*bert/embeddings/position_embeddings/AssignAssign#bert/embeddings/position_embeddings@bert/embeddings/position_embeddings/Initializer/truncated_normal*
T0* 
_output_shapes
:
??*6
_class,
*(loc:@bert/embeddings/position_embeddings
?
(bert/embeddings/position_embeddings/readIdentity#bert/embeddings/position_embeddings*6
_class,
*(loc:@bert/embeddings/position_embeddings*
T0* 
_output_shapes
:
??
?
 bert/bert/embeddings/Slice/beginConst5^bert/bert/embeddings/assert_less_equal/Assert/Assert*
_output_shapes
:*
dtype0*
valueB"        
?
bert/bert/embeddings/Slice/sizeConst5^bert/bert/embeddings/assert_less_equal/Assert/Assert*
_output_shapes
:*
dtype0*
valueB"   ????
?
bert/bert/embeddings/SliceSlice(bert/embeddings/position_embeddings/read bert/bert/embeddings/Slice/beginbert/bert/embeddings/Slice/size*
Index0*
_output_shapes
:	?*
T0
?
$bert/bert/embeddings/Reshape_4/shapeConst5^bert/bert/embeddings/assert_less_equal/Assert/Assert*!
valueB"      8  *
dtype0*
_output_shapes
:
?
bert/bert/embeddings/Reshape_4Reshapebert/bert/embeddings/Slice$bert/bert/embeddings/Reshape_4/shape*
T0*#
_output_shapes
:?
?
bert/bert/embeddings/add_1Addbert/bert/embeddings/addbert/bert/embeddings/Reshape_4*,
_output_shapes
:??????????*
T0
?
0bert/embeddings/LayerNorm/beta/Initializer/zerosConst*
_output_shapes	
:?*
dtype0*1
_class'
%#loc:@bert/embeddings/LayerNorm/beta*
valueB?*    
?
bert/embeddings/LayerNorm/beta
VariableV2*
_output_shapes	
:?*1
_class'
%#loc:@bert/embeddings/LayerNorm/beta*
dtype0*
shape:?
?
%bert/embeddings/LayerNorm/beta/AssignAssignbert/embeddings/LayerNorm/beta0bert/embeddings/LayerNorm/beta/Initializer/zeros*
_output_shapes	
:?*1
_class'
%#loc:@bert/embeddings/LayerNorm/beta*
T0
?
#bert/embeddings/LayerNorm/beta/readIdentitybert/embeddings/LayerNorm/beta*
_output_shapes	
:?*
T0*1
_class'
%#loc:@bert/embeddings/LayerNorm/beta
?
0bert/embeddings/LayerNorm/gamma/Initializer/onesConst*
_output_shapes	
:?*2
_class(
&$loc:@bert/embeddings/LayerNorm/gamma*
dtype0*
valueB?*  ??
?
bert/embeddings/LayerNorm/gamma
VariableV2*
shape:?*
dtype0*
_output_shapes	
:?*2
_class(
&$loc:@bert/embeddings/LayerNorm/gamma
?
&bert/embeddings/LayerNorm/gamma/AssignAssignbert/embeddings/LayerNorm/gamma0bert/embeddings/LayerNorm/gamma/Initializer/ones*
T0*2
_class(
&$loc:@bert/embeddings/LayerNorm/gamma*
_output_shapes	
:?
?
$bert/embeddings/LayerNorm/gamma/readIdentitybert/embeddings/LayerNorm/gamma*
_output_shapes	
:?*
T0*2
_class(
&$loc:@bert/embeddings/LayerNorm/gamma
?
=bert/bert/embeddings/LayerNorm/moments/mean/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
?
+bert/bert/embeddings/LayerNorm/moments/meanMeanbert/bert/embeddings/add_1=bert/bert/embeddings/LayerNorm/moments/mean/reduction_indices*
T0*
	keep_dims(*+
_output_shapes
:?????????
?
3bert/bert/embeddings/LayerNorm/moments/StopGradientStopGradient+bert/bert/embeddings/LayerNorm/moments/mean*
T0*+
_output_shapes
:?????????
?
8bert/bert/embeddings/LayerNorm/moments/SquaredDifferenceSquaredDifferencebert/bert/embeddings/add_13bert/bert/embeddings/LayerNorm/moments/StopGradient*,
_output_shapes
:??????????*
T0
?
Abert/bert/embeddings/LayerNorm/moments/variance/reduction_indicesConst*
valueB:*
dtype0*
_output_shapes
:
?
/bert/bert/embeddings/LayerNorm/moments/varianceMean8bert/bert/embeddings/LayerNorm/moments/SquaredDifferenceAbert/bert/embeddings/LayerNorm/moments/variance/reduction_indices*+
_output_shapes
:?????????*
T0*
	keep_dims(
s
.bert/bert/embeddings/LayerNorm/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *̼?+
?
,bert/bert/embeddings/LayerNorm/batchnorm/addAdd/bert/bert/embeddings/LayerNorm/moments/variance.bert/bert/embeddings/LayerNorm/batchnorm/add/y*
T0*+
_output_shapes
:?????????
?
.bert/bert/embeddings/LayerNorm/batchnorm/RsqrtRsqrt,bert/bert/embeddings/LayerNorm/batchnorm/add*
T0*+
_output_shapes
:?????????
?
,bert/bert/embeddings/LayerNorm/batchnorm/mulMul.bert/bert/embeddings/LayerNorm/batchnorm/Rsqrt$bert/embeddings/LayerNorm/gamma/read*
T0*,
_output_shapes
:??????????
?
.bert/bert/embeddings/LayerNorm/batchnorm/mul_1Mulbert/bert/embeddings/add_1,bert/bert/embeddings/LayerNorm/batchnorm/mul*,
_output_shapes
:??????????*
T0
?
.bert/bert/embeddings/LayerNorm/batchnorm/mul_2Mul+bert/bert/embeddings/LayerNorm/moments/mean,bert/bert/embeddings/LayerNorm/batchnorm/mul*
T0*,
_output_shapes
:??????????
?
,bert/bert/embeddings/LayerNorm/batchnorm/subSub#bert/embeddings/LayerNorm/beta/read.bert/bert/embeddings/LayerNorm/batchnorm/mul_2*
T0*,
_output_shapes
:??????????
?
.bert/bert/embeddings/LayerNorm/batchnorm/add_1Add.bert/bert/embeddings/LayerNorm/batchnorm/mul_1,bert/bert/embeddings/LayerNorm/batchnorm/sub*,
_output_shapes
:??????????*
T0
T
bert/bert/encoder/ShapeShapeinput_ids_a_1*
T0*
_output_shapes
:
o
%bert/bert/encoder/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
q
'bert/bert/encoder/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
q
'bert/bert/encoder/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
?
bert/bert/encoder/strided_sliceStridedSlicebert/bert/encoder/Shape%bert/bert/encoder/strided_slice/stack'bert/bert/encoder/strided_slice/stack_1'bert/bert/encoder/strided_slice/stack_2*
T0*
_output_shapes
: *
Index0*
shrink_axis_mask
W
bert/bert/encoder/Shape_1Shapeinput_mask_a_1*
T0*
_output_shapes
:
q
'bert/bert/encoder/strided_slice_1/stackConst*
_output_shapes
:*
valueB: *
dtype0
s
)bert/bert/encoder/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
s
)bert/bert/encoder/strided_slice_1/stack_2Const*
valueB:*
_output_shapes
:*
dtype0
?
!bert/bert/encoder/strided_slice_1StridedSlicebert/bert/encoder/Shape_1'bert/bert/encoder/strided_slice_1/stack)bert/bert/encoder/strided_slice_1/stack_1)bert/bert/encoder/strided_slice_1/stack_2*
T0*
Index0*
_output_shapes
: *
shrink_axis_mask
c
!bert/bert/encoder/Reshape/shape/1Const*
value	B :*
_output_shapes
: *
dtype0
c
!bert/bert/encoder/Reshape/shape/2Const*
value	B :*
_output_shapes
: *
dtype0
?
bert/bert/encoder/Reshape/shapePackbert/bert/encoder/strided_slice!bert/bert/encoder/Reshape/shape/1!bert/bert/encoder/Reshape/shape/2*
T0*
N*
_output_shapes
:
?
bert/bert/encoder/ReshapeReshapeinput_mask_a_1bert/bert/encoder/Reshape/shape*+
_output_shapes
:?????????*
T0
~
bert/bert/encoder/CastCastbert/bert/encoder/Reshape*+
_output_shapes
:?????????*

DstT0*

SrcT0
^
bert/bert/encoder/ones/mul/yConst*
dtype0*
_output_shapes
: *
value	B :
?
bert/bert/encoder/ones/mulMulbert/bert/encoder/strided_slicebert/bert/encoder/ones/mul/y*
_output_shapes
: *
T0
`
bert/bert/encoder/ones/mul_1/yConst*
dtype0*
value	B :*
_output_shapes
: 
?
bert/bert/encoder/ones/mul_1Mulbert/bert/encoder/ones/mulbert/bert/encoder/ones/mul_1/y*
_output_shapes
: *
T0
`
bert/bert/encoder/ones/Less/yConst*
dtype0*
_output_shapes
: *
value
B :?
?
bert/bert/encoder/ones/LessLessbert/bert/encoder/ones/mul_1bert/bert/encoder/ones/Less/y*
_output_shapes
: *
T0
a
bert/bert/encoder/ones/packed/1Const*
_output_shapes
: *
dtype0*
value	B :
a
bert/bert/encoder/ones/packed/2Const*
_output_shapes
: *
value	B :*
dtype0
?
bert/bert/encoder/ones/packedPackbert/bert/encoder/strided_slicebert/bert/encoder/ones/packed/1bert/bert/encoder/ones/packed/2*
T0*
_output_shapes
:*
N
a
bert/bert/encoder/ones/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  ??
?
bert/bert/encoder/onesFillbert/bert/encoder/ones/packedbert/bert/encoder/ones/Const*+
_output_shapes
:?????????*
T0
?
bert/bert/encoder/mulMulbert/bert/encoder/onesbert/bert/encoder/Cast*
T0*+
_output_shapes
:?????????
w
bert/bert/encoder/Shape_2Shape.bert/bert/embeddings/LayerNorm/batchnorm/add_1*
_output_shapes
:*
T0
q
'bert/bert/encoder/strided_slice_2/stackConst*
_output_shapes
:*
valueB: *
dtype0
s
)bert/bert/encoder/strided_slice_2/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
s
)bert/bert/encoder/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
!bert/bert/encoder/strided_slice_2StridedSlicebert/bert/encoder/Shape_2'bert/bert/encoder/strided_slice_2/stack)bert/bert/encoder/strided_slice_2/stack_1)bert/bert/encoder/strided_slice_2/stack_2*
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
r
!bert/bert/encoder/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"????8  
?
bert/bert/encoder/Reshape_1Reshape.bert/bert/embeddings/LayerNorm/batchnorm/add_1!bert/bert/encoder/Reshape_1/shape*
T0*(
_output_shapes
:??????????
~
3bert/bert/encoder/layer_shared/attention/self/ShapeShapebert/bert/encoder/Reshape_1*
T0*
_output_shapes
:
?
Abert/bert/encoder/layer_shared/attention/self/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
?
Cbert/bert/encoder/layer_shared/attention/self/strided_slice/stack_1Const*
valueB:*
_output_shapes
:*
dtype0
?
Cbert/bert/encoder/layer_shared/attention/self/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
?
;bert/bert/encoder/layer_shared/attention/self/strided_sliceStridedSlice3bert/bert/encoder/layer_shared/attention/self/ShapeAbert/bert/encoder/layer_shared/attention/self/strided_slice/stackCbert/bert/encoder/layer_shared/attention/self/strided_slice/stack_1Cbert/bert/encoder/layer_shared/attention/self/strided_slice/stack_2*
Index0*
_output_shapes
: *
T0*
shrink_axis_mask
?
5bert/bert/encoder/layer_shared/attention/self/Shape_1Shapebert/bert/encoder/Reshape_1*
T0*
_output_shapes
:
?
Cbert/bert/encoder/layer_shared/attention/self/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 
?
Ebert/bert/encoder/layer_shared/attention/self/strided_slice_1/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
?
Ebert/bert/encoder/layer_shared/attention/self/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
=bert/bert/encoder/layer_shared/attention/self/strided_slice_1StridedSlice5bert/bert/encoder/layer_shared/attention/self/Shape_1Cbert/bert/encoder/layer_shared/attention/self/strided_slice_1/stackEbert/bert/encoder/layer_shared/attention/self/strided_slice_1/stack_1Ebert/bert/encoder/layer_shared/attention/self/strided_slice_1/stack_2*
shrink_axis_mask*
Index0*
_output_shapes
: *
T0
?
Xbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal/shapeConst*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/query/kernel*
valueB"8  8  *
dtype0*
_output_shapes
:
?
Wbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal/meanConst*
_output_shapes
: *
dtype0*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/query/kernel*
valueB
 *    
?
Ybert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *
ף<*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/query/kernel
?
bbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalXbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal/shape*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/query/kernel*
T0* 
_output_shapes
:
??*
dtype0
?
Vbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal/mulMulbbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal/TruncatedNormalYbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal/stddev* 
_output_shapes
:
??*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/query/kernel*
T0
?
Rbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normalAddVbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal/mulWbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal/mean* 
_output_shapes
:
??*
T0*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/query/kernel
?
5bert/encoder/layer_shared/attention/self/query/kernel
VariableV2*
shape:
??* 
_output_shapes
:
??*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/query/kernel*
dtype0
?
<bert/encoder/layer_shared/attention/self/query/kernel/AssignAssign5bert/encoder/layer_shared/attention/self/query/kernelRbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal*
T0* 
_output_shapes
:
??*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/query/kernel
?
:bert/encoder/layer_shared/attention/self/query/kernel/readIdentity5bert/encoder/layer_shared/attention/self/query/kernel* 
_output_shapes
:
??*
T0*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/query/kernel
?
Ebert/encoder/layer_shared/attention/self/query/bias/Initializer/zerosConst*
dtype0*
valueB?*    *
_output_shapes	
:?*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/query/bias
?
3bert/encoder/layer_shared/attention/self/query/bias
VariableV2*
dtype0*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/query/bias*
shape:?*
_output_shapes	
:?
?
:bert/encoder/layer_shared/attention/self/query/bias/AssignAssign3bert/encoder/layer_shared/attention/self/query/biasEbert/encoder/layer_shared/attention/self/query/bias/Initializer/zeros*
T0*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/query/bias*
_output_shapes	
:?
?
8bert/encoder/layer_shared/attention/self/query/bias/readIdentity3bert/encoder/layer_shared/attention/self/query/bias*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/query/bias*
T0*
_output_shapes	
:?
?
:bert/bert/encoder/layer_shared/attention/self/query/MatMulMatMulbert/bert/encoder/Reshape_1:bert/encoder/layer_shared/attention/self/query/kernel/read*(
_output_shapes
:??????????*
T0
?
;bert/bert/encoder/layer_shared/attention/self/query/BiasAddBiasAdd:bert/bert/encoder/layer_shared/attention/self/query/MatMul8bert/encoder/layer_shared/attention/self/query/bias/read*(
_output_shapes
:??????????*
T0
?
Vbert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal/shapeConst*
valueB"8  8  *
dtype0*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/key/kernel*
_output_shapes
:
?
Ubert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal/meanConst*
valueB
 *    *
dtype0*
_output_shapes
: *F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/key/kernel
?
Wbert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal/stddevConst*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/key/kernel*
dtype0*
valueB
 *
ף<*
_output_shapes
: 
?
`bert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalVbert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal/shape* 
_output_shapes
:
??*
T0*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/key/kernel*
dtype0
?
Tbert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal/mulMul`bert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal/TruncatedNormalWbert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal/stddev*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/key/kernel* 
_output_shapes
:
??*
T0
?
Pbert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normalAddTbert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal/mulUbert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal/mean* 
_output_shapes
:
??*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/key/kernel*
T0
?
3bert/encoder/layer_shared/attention/self/key/kernel
VariableV2* 
_output_shapes
:
??*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/key/kernel*
dtype0*
shape:
??
?
:bert/encoder/layer_shared/attention/self/key/kernel/AssignAssign3bert/encoder/layer_shared/attention/self/key/kernelPbert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/key/kernel* 
_output_shapes
:
??*
T0
?
8bert/encoder/layer_shared/attention/self/key/kernel/readIdentity3bert/encoder/layer_shared/attention/self/key/kernel*
T0*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/key/kernel* 
_output_shapes
:
??
?
Cbert/encoder/layer_shared/attention/self/key/bias/Initializer/zerosConst*
_output_shapes	
:?*
dtype0*
valueB?*    *D
_class:
86loc:@bert/encoder/layer_shared/attention/self/key/bias
?
1bert/encoder/layer_shared/attention/self/key/bias
VariableV2*D
_class:
86loc:@bert/encoder/layer_shared/attention/self/key/bias*
_output_shapes	
:?*
shape:?*
dtype0
?
8bert/encoder/layer_shared/attention/self/key/bias/AssignAssign1bert/encoder/layer_shared/attention/self/key/biasCbert/encoder/layer_shared/attention/self/key/bias/Initializer/zeros*
_output_shapes	
:?*D
_class:
86loc:@bert/encoder/layer_shared/attention/self/key/bias*
T0
?
6bert/encoder/layer_shared/attention/self/key/bias/readIdentity1bert/encoder/layer_shared/attention/self/key/bias*
_output_shapes	
:?*
T0*D
_class:
86loc:@bert/encoder/layer_shared/attention/self/key/bias
?
8bert/bert/encoder/layer_shared/attention/self/key/MatMulMatMulbert/bert/encoder/Reshape_18bert/encoder/layer_shared/attention/self/key/kernel/read*(
_output_shapes
:??????????*
T0
?
9bert/bert/encoder/layer_shared/attention/self/key/BiasAddBiasAdd8bert/bert/encoder/layer_shared/attention/self/key/MatMul6bert/encoder/layer_shared/attention/self/key/bias/read*
T0*(
_output_shapes
:??????????
?
Xbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal/shapeConst*
valueB"8  8  *H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/value/kernel*
dtype0*
_output_shapes
:
?
Wbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal/meanConst*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/value/kernel*
_output_shapes
: *
valueB
 *    *
dtype0
?
Ybert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal/stddevConst*
_output_shapes
: *H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/value/kernel*
valueB
 *
ף<*
dtype0
?
bbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalXbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal/shape*
T0*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/value/kernel* 
_output_shapes
:
??*
dtype0
?
Vbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal/mulMulbbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal/TruncatedNormalYbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal/stddev*
T0* 
_output_shapes
:
??*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/value/kernel
?
Rbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normalAddVbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal/mulWbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal/mean*
T0* 
_output_shapes
:
??*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/value/kernel
?
5bert/encoder/layer_shared/attention/self/value/kernel
VariableV2*
dtype0*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/value/kernel*
shape:
??* 
_output_shapes
:
??
?
<bert/encoder/layer_shared/attention/self/value/kernel/AssignAssign5bert/encoder/layer_shared/attention/self/value/kernelRbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal*
T0*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/value/kernel* 
_output_shapes
:
??
?
:bert/encoder/layer_shared/attention/self/value/kernel/readIdentity5bert/encoder/layer_shared/attention/self/value/kernel*
T0*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/value/kernel* 
_output_shapes
:
??
?
Ebert/encoder/layer_shared/attention/self/value/bias/Initializer/zerosConst*
dtype0*
valueB?*    *
_output_shapes	
:?*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/value/bias
?
3bert/encoder/layer_shared/attention/self/value/bias
VariableV2*
_output_shapes	
:?*
shape:?*
dtype0*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/value/bias
?
:bert/encoder/layer_shared/attention/self/value/bias/AssignAssign3bert/encoder/layer_shared/attention/self/value/biasEbert/encoder/layer_shared/attention/self/value/bias/Initializer/zeros*
_output_shapes	
:?*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/value/bias*
T0
?
8bert/encoder/layer_shared/attention/self/value/bias/readIdentity3bert/encoder/layer_shared/attention/self/value/bias*
T0*
_output_shapes	
:?*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/value/bias
?
:bert/bert/encoder/layer_shared/attention/self/value/MatMulMatMulbert/bert/encoder/Reshape_1:bert/encoder/layer_shared/attention/self/value/kernel/read*(
_output_shapes
:??????????*
T0
?
;bert/bert/encoder/layer_shared/attention/self/value/BiasAddBiasAdd:bert/bert/encoder/layer_shared/attention/self/value/MatMul8bert/encoder/layer_shared/attention/self/value/bias/read*
T0*(
_output_shapes
:??????????

=bert/bert/encoder/layer_shared/attention/self/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 

=bert/bert/encoder/layer_shared/attention/self/Reshape/shape/2Const*
_output_shapes
: *
value	B :*
dtype0

=bert/bert/encoder/layer_shared/attention/self/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
?
;bert/bert/encoder/layer_shared/attention/self/Reshape/shapePack!bert/bert/encoder/strided_slice_2=bert/bert/encoder/layer_shared/attention/self/Reshape/shape/1=bert/bert/encoder/layer_shared/attention/self/Reshape/shape/2=bert/bert/encoder/layer_shared/attention/self/Reshape/shape/3*
T0*
_output_shapes
:*
N
?
5bert/bert/encoder/layer_shared/attention/self/ReshapeReshape;bert/bert/encoder/layer_shared/attention/self/query/BiasAdd;bert/bert/encoder/layer_shared/attention/self/Reshape/shape*/
_output_shapes
:?????????*
T0
?
<bert/bert/encoder/layer_shared/attention/self/transpose/permConst*
dtype0*%
valueB"             *
_output_shapes
:
?
7bert/bert/encoder/layer_shared/attention/self/transpose	Transpose5bert/bert/encoder/layer_shared/attention/self/Reshape<bert/bert/encoder/layer_shared/attention/self/transpose/perm*/
_output_shapes
:?????????*
T0
?
?bert/bert/encoder/layer_shared/attention/self/Reshape_1/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
?bert/bert/encoder/layer_shared/attention/self/Reshape_1/shape/2Const*
value	B :*
dtype0*
_output_shapes
: 
?
?bert/bert/encoder/layer_shared/attention/self/Reshape_1/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
?
=bert/bert/encoder/layer_shared/attention/self/Reshape_1/shapePack!bert/bert/encoder/strided_slice_2?bert/bert/encoder/layer_shared/attention/self/Reshape_1/shape/1?bert/bert/encoder/layer_shared/attention/self/Reshape_1/shape/2?bert/bert/encoder/layer_shared/attention/self/Reshape_1/shape/3*
T0*
N*
_output_shapes
:
?
7bert/bert/encoder/layer_shared/attention/self/Reshape_1Reshape9bert/bert/encoder/layer_shared/attention/self/key/BiasAdd=bert/bert/encoder/layer_shared/attention/self/Reshape_1/shape*
T0*/
_output_shapes
:?????????
?
>bert/bert/encoder/layer_shared/attention/self/transpose_1/permConst*
dtype0*%
valueB"             *
_output_shapes
:
?
9bert/bert/encoder/layer_shared/attention/self/transpose_1	Transpose7bert/bert/encoder/layer_shared/attention/self/Reshape_1>bert/bert/encoder/layer_shared/attention/self/transpose_1/perm*
T0*/
_output_shapes
:?????????
?
4bert/bert/encoder/layer_shared/attention/self/MatMulBatchMatMul7bert/bert/encoder/layer_shared/attention/self/transpose9bert/bert/encoder/layer_shared/attention/self/transpose_1*
T0*/
_output_shapes
:?????????*
adj_y(
x
3bert/bert/encoder/layer_shared/attention/self/Mul/yConst*
valueB
 *??H>*
dtype0*
_output_shapes
: 
?
1bert/bert/encoder/layer_shared/attention/self/MulMul4bert/bert/encoder/layer_shared/attention/self/MatMul3bert/bert/encoder/layer_shared/attention/self/Mul/y*/
_output_shapes
:?????????*
T0
?
<bert/bert/encoder/layer_shared/attention/self/ExpandDims/dimConst*
dtype0*
_output_shapes
:*
valueB:
?
8bert/bert/encoder/layer_shared/attention/self/ExpandDims
ExpandDimsbert/bert/encoder/mul<bert/bert/encoder/layer_shared/attention/self/ExpandDims/dim*
T0*/
_output_shapes
:?????????
x
3bert/bert/encoder/layer_shared/attention/self/sub/xConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
1bert/bert/encoder/layer_shared/attention/self/subSub3bert/bert/encoder/layer_shared/attention/self/sub/x8bert/bert/encoder/layer_shared/attention/self/ExpandDims*
T0*/
_output_shapes
:?????????
z
5bert/bert/encoder/layer_shared/attention/self/mul_1/yConst*
_output_shapes
: *
dtype0*
valueB
 * @?
?
3bert/bert/encoder/layer_shared/attention/self/mul_1Mul1bert/bert/encoder/layer_shared/attention/self/sub5bert/bert/encoder/layer_shared/attention/self/mul_1/y*/
_output_shapes
:?????????*
T0
?
1bert/bert/encoder/layer_shared/attention/self/addAdd1bert/bert/encoder/layer_shared/attention/self/Mul3bert/bert/encoder/layer_shared/attention/self/mul_1*/
_output_shapes
:?????????*
T0
?
5bert/bert/encoder/layer_shared/attention/self/SoftmaxSoftmax1bert/bert/encoder/layer_shared/attention/self/add*
T0*/
_output_shapes
:?????????
?
?bert/bert/encoder/layer_shared/attention/self/Reshape_2/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
?
?bert/bert/encoder/layer_shared/attention/self/Reshape_2/shape/2Const*
value	B :*
_output_shapes
: *
dtype0
?
?bert/bert/encoder/layer_shared/attention/self/Reshape_2/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
?
=bert/bert/encoder/layer_shared/attention/self/Reshape_2/shapePack!bert/bert/encoder/strided_slice_2?bert/bert/encoder/layer_shared/attention/self/Reshape_2/shape/1?bert/bert/encoder/layer_shared/attention/self/Reshape_2/shape/2?bert/bert/encoder/layer_shared/attention/self/Reshape_2/shape/3*
T0*
N*
_output_shapes
:
?
7bert/bert/encoder/layer_shared/attention/self/Reshape_2Reshape;bert/bert/encoder/layer_shared/attention/self/value/BiasAdd=bert/bert/encoder/layer_shared/attention/self/Reshape_2/shape*/
_output_shapes
:?????????*
T0
?
>bert/bert/encoder/layer_shared/attention/self/transpose_2/permConst*
dtype0*
_output_shapes
:*%
valueB"             
?
9bert/bert/encoder/layer_shared/attention/self/transpose_2	Transpose7bert/bert/encoder/layer_shared/attention/self/Reshape_2>bert/bert/encoder/layer_shared/attention/self/transpose_2/perm*/
_output_shapes
:?????????*
T0
?
6bert/bert/encoder/layer_shared/attention/self/MatMul_1BatchMatMul5bert/bert/encoder/layer_shared/attention/self/Softmax9bert/bert/encoder/layer_shared/attention/self/transpose_2*
T0*/
_output_shapes
:?????????
?
>bert/bert/encoder/layer_shared/attention/self/transpose_3/permConst*
_output_shapes
:*%
valueB"             *
dtype0
?
9bert/bert/encoder/layer_shared/attention/self/transpose_3	Transpose6bert/bert/encoder/layer_shared/attention/self/MatMul_1>bert/bert/encoder/layer_shared/attention/self/transpose_3/perm*
T0*/
_output_shapes
:?????????
w
5bert/bert/encoder/layer_shared/attention/self/mul_2/yConst*
dtype0*
_output_shapes
: *
value	B :
?
3bert/bert/encoder/layer_shared/attention/self/mul_2Mul!bert/bert/encoder/strided_slice_25bert/bert/encoder/layer_shared/attention/self/mul_2/y*
T0*
_output_shapes
: 
?
?bert/bert/encoder/layer_shared/attention/self/Reshape_3/shape/1Const*
value
B :?*
dtype0*
_output_shapes
: 
?
=bert/bert/encoder/layer_shared/attention/self/Reshape_3/shapePack3bert/bert/encoder/layer_shared/attention/self/mul_2?bert/bert/encoder/layer_shared/attention/self/Reshape_3/shape/1*
N*
_output_shapes
:*
T0
?
7bert/bert/encoder/layer_shared/attention/self/Reshape_3Reshape9bert/bert/encoder/layer_shared/attention/self/transpose_3=bert/bert/encoder/layer_shared/attention/self/Reshape_3/shape*(
_output_shapes
:??????????*
T0
?
Zbert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal/shapeConst*
valueB"8  8  *
dtype0*
_output_shapes
:*J
_class@
><loc:@bert/encoder/layer_shared/attention/output/dense/kernel
?
Ybert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal/meanConst*
_output_shapes
: *J
_class@
><loc:@bert/encoder/layer_shared/attention/output/dense/kernel*
dtype0*
valueB
 *    
?
[bert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal/stddevConst*
dtype0*J
_class@
><loc:@bert/encoder/layer_shared/attention/output/dense/kernel*
valueB
 *
ף<*
_output_shapes
: 
?
dbert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalZbert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal/shape*
T0*
dtype0*J
_class@
><loc:@bert/encoder/layer_shared/attention/output/dense/kernel* 
_output_shapes
:
??
?
Xbert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal/mulMuldbert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal/TruncatedNormal[bert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal/stddev*
T0* 
_output_shapes
:
??*J
_class@
><loc:@bert/encoder/layer_shared/attention/output/dense/kernel
?
Tbert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normalAddXbert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal/mulYbert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal/mean*
T0*J
_class@
><loc:@bert/encoder/layer_shared/attention/output/dense/kernel* 
_output_shapes
:
??
?
7bert/encoder/layer_shared/attention/output/dense/kernel
VariableV2* 
_output_shapes
:
??*J
_class@
><loc:@bert/encoder/layer_shared/attention/output/dense/kernel*
dtype0*
shape:
??
?
>bert/encoder/layer_shared/attention/output/dense/kernel/AssignAssign7bert/encoder/layer_shared/attention/output/dense/kernelTbert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal*
T0* 
_output_shapes
:
??*J
_class@
><loc:@bert/encoder/layer_shared/attention/output/dense/kernel
?
<bert/encoder/layer_shared/attention/output/dense/kernel/readIdentity7bert/encoder/layer_shared/attention/output/dense/kernel*
T0*J
_class@
><loc:@bert/encoder/layer_shared/attention/output/dense/kernel* 
_output_shapes
:
??
?
Gbert/encoder/layer_shared/attention/output/dense/bias/Initializer/zerosConst*
valueB?*    *
_output_shapes	
:?*
dtype0*H
_class>
<:loc:@bert/encoder/layer_shared/attention/output/dense/bias
?
5bert/encoder/layer_shared/attention/output/dense/bias
VariableV2*H
_class>
<:loc:@bert/encoder/layer_shared/attention/output/dense/bias*
_output_shapes	
:?*
shape:?*
dtype0
?
<bert/encoder/layer_shared/attention/output/dense/bias/AssignAssign5bert/encoder/layer_shared/attention/output/dense/biasGbert/encoder/layer_shared/attention/output/dense/bias/Initializer/zeros*
_output_shapes	
:?*
T0*H
_class>
<:loc:@bert/encoder/layer_shared/attention/output/dense/bias
?
:bert/encoder/layer_shared/attention/output/dense/bias/readIdentity5bert/encoder/layer_shared/attention/output/dense/bias*H
_class>
<:loc:@bert/encoder/layer_shared/attention/output/dense/bias*
_output_shapes	
:?*
T0
?
<bert/bert/encoder/layer_shared/attention/output/dense/MatMulMatMul7bert/bert/encoder/layer_shared/attention/self/Reshape_3<bert/encoder/layer_shared/attention/output/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
=bert/bert/encoder/layer_shared/attention/output/dense/BiasAddBiasAdd<bert/bert/encoder/layer_shared/attention/output/dense/MatMul:bert/encoder/layer_shared/attention/output/dense/bias/read*(
_output_shapes
:??????????*
T0
?
3bert/bert/encoder/layer_shared/attention/output/addAdd=bert/bert/encoder/layer_shared/attention/output/dense/BiasAddbert/bert/encoder/Reshape_1*
T0*(
_output_shapes
:??????????
?
Kbert/encoder/layer_shared/attention/output/LayerNorm/beta/Initializer/zerosConst*
valueB?*    *L
_classB
@>loc:@bert/encoder/layer_shared/attention/output/LayerNorm/beta*
dtype0*
_output_shapes	
:?
?
9bert/encoder/layer_shared/attention/output/LayerNorm/beta
VariableV2*
shape:?*L
_classB
@>loc:@bert/encoder/layer_shared/attention/output/LayerNorm/beta*
_output_shapes	
:?*
dtype0
?
@bert/encoder/layer_shared/attention/output/LayerNorm/beta/AssignAssign9bert/encoder/layer_shared/attention/output/LayerNorm/betaKbert/encoder/layer_shared/attention/output/LayerNorm/beta/Initializer/zeros*
T0*
_output_shapes	
:?*L
_classB
@>loc:@bert/encoder/layer_shared/attention/output/LayerNorm/beta
?
>bert/encoder/layer_shared/attention/output/LayerNorm/beta/readIdentity9bert/encoder/layer_shared/attention/output/LayerNorm/beta*
_output_shapes	
:?*
T0*L
_classB
@>loc:@bert/encoder/layer_shared/attention/output/LayerNorm/beta
?
Kbert/encoder/layer_shared/attention/output/LayerNorm/gamma/Initializer/onesConst*
valueB?*  ??*M
_classC
A?loc:@bert/encoder/layer_shared/attention/output/LayerNorm/gamma*
dtype0*
_output_shapes	
:?
?
:bert/encoder/layer_shared/attention/output/LayerNorm/gamma
VariableV2*M
_classC
A?loc:@bert/encoder/layer_shared/attention/output/LayerNorm/gamma*
dtype0*
shape:?*
_output_shapes	
:?
?
Abert/encoder/layer_shared/attention/output/LayerNorm/gamma/AssignAssign:bert/encoder/layer_shared/attention/output/LayerNorm/gammaKbert/encoder/layer_shared/attention/output/LayerNorm/gamma/Initializer/ones*M
_classC
A?loc:@bert/encoder/layer_shared/attention/output/LayerNorm/gamma*
T0*
_output_shapes	
:?
?
?bert/encoder/layer_shared/attention/output/LayerNorm/gamma/readIdentity:bert/encoder/layer_shared/attention/output/LayerNorm/gamma*
T0*M
_classC
A?loc:@bert/encoder/layer_shared/attention/output/LayerNorm/gamma*
_output_shapes	
:?
?
Xbert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/mean/reduction_indicesConst*
valueB:*
_output_shapes
:*
dtype0
?
Fbert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/meanMean3bert/bert/encoder/layer_shared/attention/output/addXbert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/mean/reduction_indices*'
_output_shapes
:?????????*
	keep_dims(*
T0
?
Nbert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/StopGradientStopGradientFbert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/mean*
T0*'
_output_shapes
:?????????
?
Sbert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/SquaredDifferenceSquaredDifference3bert/bert/encoder/layer_shared/attention/output/addNbert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
\bert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/variance/reduction_indicesConst*
valueB:*
_output_shapes
:*
dtype0
?
Jbert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/varianceMeanSbert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/SquaredDifference\bert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/variance/reduction_indices*'
_output_shapes
:?????????*
	keep_dims(*
T0
?
Ibert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add/yConst*
_output_shapes
: *
valueB
 *̼?+*
dtype0
?
Gbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/addAddJbert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/varianceIbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add/y*'
_output_shapes
:?????????*
T0
?
Ibert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/RsqrtRsqrtGbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add*'
_output_shapes
:?????????*
T0
?
Gbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mulMulIbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/Rsqrt?bert/encoder/layer_shared/attention/output/LayerNorm/gamma/read*(
_output_shapes
:??????????*
T0
?
Ibert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul_1Mul3bert/bert/encoder/layer_shared/attention/output/addGbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Ibert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul_2MulFbert/bert/encoder/layer_shared/attention/output/LayerNorm/moments/meanGbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Gbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/subSub>bert/encoder/layer_shared/attention/output/LayerNorm/beta/readIbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul_2*(
_output_shapes
:??????????*
T0
?
Ibert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add_1AddIbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul_1Gbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/sub*(
_output_shapes
:??????????*
T0
?
Vbert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal/shapeConst*
valueB"8  ?  *F
_class<
:8loc:@bert/encoder/layer_shared/intermediate/dense/kernel*
_output_shapes
:*
dtype0
?
Ubert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal/meanConst*
dtype0*
valueB
 *    *F
_class<
:8loc:@bert/encoder/layer_shared/intermediate/dense/kernel*
_output_shapes
: 
?
Wbert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal/stddevConst*
valueB
 *
ף<*
dtype0*
_output_shapes
: *F
_class<
:8loc:@bert/encoder/layer_shared/intermediate/dense/kernel
?
`bert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalVbert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal/shape*
T0*
dtype0* 
_output_shapes
:
??	*F
_class<
:8loc:@bert/encoder/layer_shared/intermediate/dense/kernel
?
Tbert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal/mulMul`bert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal/TruncatedNormalWbert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal/stddev* 
_output_shapes
:
??	*
T0*F
_class<
:8loc:@bert/encoder/layer_shared/intermediate/dense/kernel
?
Pbert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normalAddTbert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal/mulUbert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal/mean* 
_output_shapes
:
??	*
T0*F
_class<
:8loc:@bert/encoder/layer_shared/intermediate/dense/kernel
?
3bert/encoder/layer_shared/intermediate/dense/kernel
VariableV2*
dtype0* 
_output_shapes
:
??	*
shape:
??	*F
_class<
:8loc:@bert/encoder/layer_shared/intermediate/dense/kernel
?
:bert/encoder/layer_shared/intermediate/dense/kernel/AssignAssign3bert/encoder/layer_shared/intermediate/dense/kernelPbert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal*F
_class<
:8loc:@bert/encoder/layer_shared/intermediate/dense/kernel*
T0* 
_output_shapes
:
??	
?
8bert/encoder/layer_shared/intermediate/dense/kernel/readIdentity3bert/encoder/layer_shared/intermediate/dense/kernel* 
_output_shapes
:
??	*
T0*F
_class<
:8loc:@bert/encoder/layer_shared/intermediate/dense/kernel
?
Sbert/encoder/layer_shared/intermediate/dense/bias/Initializer/zeros/shape_as_tensorConst*D
_class:
86loc:@bert/encoder/layer_shared/intermediate/dense/bias*
dtype0*
_output_shapes
:*
valueB:?	
?
Ibert/encoder/layer_shared/intermediate/dense/bias/Initializer/zeros/ConstConst*
dtype0*
_output_shapes
: *D
_class:
86loc:@bert/encoder/layer_shared/intermediate/dense/bias*
valueB
 *    
?
Cbert/encoder/layer_shared/intermediate/dense/bias/Initializer/zerosFillSbert/encoder/layer_shared/intermediate/dense/bias/Initializer/zeros/shape_as_tensorIbert/encoder/layer_shared/intermediate/dense/bias/Initializer/zeros/Const*
_output_shapes	
:?	*D
_class:
86loc:@bert/encoder/layer_shared/intermediate/dense/bias*
T0
?
1bert/encoder/layer_shared/intermediate/dense/bias
VariableV2*D
_class:
86loc:@bert/encoder/layer_shared/intermediate/dense/bias*
_output_shapes	
:?	*
dtype0*
shape:?	
?
8bert/encoder/layer_shared/intermediate/dense/bias/AssignAssign1bert/encoder/layer_shared/intermediate/dense/biasCbert/encoder/layer_shared/intermediate/dense/bias/Initializer/zeros*
_output_shapes	
:?	*
T0*D
_class:
86loc:@bert/encoder/layer_shared/intermediate/dense/bias
?
6bert/encoder/layer_shared/intermediate/dense/bias/readIdentity1bert/encoder/layer_shared/intermediate/dense/bias*
_output_shapes	
:?	*
T0*D
_class:
86loc:@bert/encoder/layer_shared/intermediate/dense/bias
?
8bert/bert/encoder/layer_shared/intermediate/dense/MatMulMatMulIbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add_18bert/encoder/layer_shared/intermediate/dense/kernel/read*(
_output_shapes
:??????????	*
T0
?
9bert/bert/encoder/layer_shared/intermediate/dense/BiasAddBiasAdd8bert/bert/encoder/layer_shared/intermediate/dense/MatMul6bert/encoder/layer_shared/intermediate/dense/bias/read*
T0*(
_output_shapes
:??????????	
|
7bert/bert/encoder/layer_shared/intermediate/dense/Pow/yConst*
_output_shapes
: *
valueB
 *  @@*
dtype0
?
5bert/bert/encoder/layer_shared/intermediate/dense/PowPow9bert/bert/encoder/layer_shared/intermediate/dense/BiasAdd7bert/bert/encoder/layer_shared/intermediate/dense/Pow/y*(
_output_shapes
:??????????	*
T0
|
7bert/bert/encoder/layer_shared/intermediate/dense/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *'7=
?
5bert/bert/encoder/layer_shared/intermediate/dense/mulMul7bert/bert/encoder/layer_shared/intermediate/dense/mul/x5bert/bert/encoder/layer_shared/intermediate/dense/Pow*
T0*(
_output_shapes
:??????????	
?
5bert/bert/encoder/layer_shared/intermediate/dense/addAdd9bert/bert/encoder/layer_shared/intermediate/dense/BiasAdd5bert/bert/encoder/layer_shared/intermediate/dense/mul*(
_output_shapes
:??????????	*
T0
~
9bert/bert/encoder/layer_shared/intermediate/dense/mul_1/xConst*
_output_shapes
: *
valueB
 **BL?*
dtype0
?
7bert/bert/encoder/layer_shared/intermediate/dense/mul_1Mul9bert/bert/encoder/layer_shared/intermediate/dense/mul_1/x5bert/bert/encoder/layer_shared/intermediate/dense/add*(
_output_shapes
:??????????	*
T0
?
6bert/bert/encoder/layer_shared/intermediate/dense/TanhTanh7bert/bert/encoder/layer_shared/intermediate/dense/mul_1*
T0*(
_output_shapes
:??????????	
~
9bert/bert/encoder/layer_shared/intermediate/dense/add_1/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ??
?
7bert/bert/encoder/layer_shared/intermediate/dense/add_1Add9bert/bert/encoder/layer_shared/intermediate/dense/add_1/x6bert/bert/encoder/layer_shared/intermediate/dense/Tanh*
T0*(
_output_shapes
:??????????	
~
9bert/bert/encoder/layer_shared/intermediate/dense/mul_2/xConst*
dtype0*
valueB
 *   ?*
_output_shapes
: 
?
7bert/bert/encoder/layer_shared/intermediate/dense/mul_2Mul9bert/bert/encoder/layer_shared/intermediate/dense/mul_2/x7bert/bert/encoder/layer_shared/intermediate/dense/add_1*
T0*(
_output_shapes
:??????????	
?
7bert/bert/encoder/layer_shared/intermediate/dense/mul_3Mul9bert/bert/encoder/layer_shared/intermediate/dense/BiasAdd7bert/bert/encoder/layer_shared/intermediate/dense/mul_2*(
_output_shapes
:??????????	*
T0
?
Pbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal/shapeConst*
valueB"?  8  *
dtype0*
_output_shapes
:*@
_class6
42loc:@bert/encoder/layer_shared/output/dense/kernel
?
Obert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal/meanConst*
dtype0*@
_class6
42loc:@bert/encoder/layer_shared/output/dense/kernel*
valueB
 *    *
_output_shapes
: 
?
Qbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *
ף<*@
_class6
42loc:@bert/encoder/layer_shared/output/dense/kernel
?
Zbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalPbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal/shape*
dtype0*@
_class6
42loc:@bert/encoder/layer_shared/output/dense/kernel*
T0* 
_output_shapes
:
?	?
?
Nbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal/mulMulZbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal/TruncatedNormalQbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal/stddev* 
_output_shapes
:
?	?*
T0*@
_class6
42loc:@bert/encoder/layer_shared/output/dense/kernel
?
Jbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normalAddNbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal/mulObert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal/mean*
T0* 
_output_shapes
:
?	?*@
_class6
42loc:@bert/encoder/layer_shared/output/dense/kernel
?
-bert/encoder/layer_shared/output/dense/kernel
VariableV2*
shape:
?	?*@
_class6
42loc:@bert/encoder/layer_shared/output/dense/kernel* 
_output_shapes
:
?	?*
dtype0
?
4bert/encoder/layer_shared/output/dense/kernel/AssignAssign-bert/encoder/layer_shared/output/dense/kernelJbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal* 
_output_shapes
:
?	?*@
_class6
42loc:@bert/encoder/layer_shared/output/dense/kernel*
T0
?
2bert/encoder/layer_shared/output/dense/kernel/readIdentity-bert/encoder/layer_shared/output/dense/kernel*
T0* 
_output_shapes
:
?	?*@
_class6
42loc:@bert/encoder/layer_shared/output/dense/kernel
?
=bert/encoder/layer_shared/output/dense/bias/Initializer/zerosConst*
_output_shapes	
:?*
dtype0*
valueB?*    *>
_class4
20loc:@bert/encoder/layer_shared/output/dense/bias
?
+bert/encoder/layer_shared/output/dense/bias
VariableV2*
shape:?*
dtype0*>
_class4
20loc:@bert/encoder/layer_shared/output/dense/bias*
_output_shapes	
:?
?
2bert/encoder/layer_shared/output/dense/bias/AssignAssign+bert/encoder/layer_shared/output/dense/bias=bert/encoder/layer_shared/output/dense/bias/Initializer/zeros*
T0*>
_class4
20loc:@bert/encoder/layer_shared/output/dense/bias*
_output_shapes	
:?
?
0bert/encoder/layer_shared/output/dense/bias/readIdentity+bert/encoder/layer_shared/output/dense/bias*>
_class4
20loc:@bert/encoder/layer_shared/output/dense/bias*
_output_shapes	
:?*
T0
?
2bert/bert/encoder/layer_shared/output/dense/MatMulMatMul7bert/bert/encoder/layer_shared/intermediate/dense/mul_32bert/encoder/layer_shared/output/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
3bert/bert/encoder/layer_shared/output/dense/BiasAddBiasAdd2bert/bert/encoder/layer_shared/output/dense/MatMul0bert/encoder/layer_shared/output/dense/bias/read*(
_output_shapes
:??????????*
T0
?
)bert/bert/encoder/layer_shared/output/addAdd3bert/bert/encoder/layer_shared/output/dense/BiasAddIbert/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add_1*
T0*(
_output_shapes
:??????????
?
Abert/encoder/layer_shared/output/LayerNorm/beta/Initializer/zerosConst*
valueB?*    *
_output_shapes	
:?*
dtype0*B
_class8
64loc:@bert/encoder/layer_shared/output/LayerNorm/beta
?
/bert/encoder/layer_shared/output/LayerNorm/beta
VariableV2*
shape:?*B
_class8
64loc:@bert/encoder/layer_shared/output/LayerNorm/beta*
dtype0*
_output_shapes	
:?
?
6bert/encoder/layer_shared/output/LayerNorm/beta/AssignAssign/bert/encoder/layer_shared/output/LayerNorm/betaAbert/encoder/layer_shared/output/LayerNorm/beta/Initializer/zeros*
T0*
_output_shapes	
:?*B
_class8
64loc:@bert/encoder/layer_shared/output/LayerNorm/beta
?
4bert/encoder/layer_shared/output/LayerNorm/beta/readIdentity/bert/encoder/layer_shared/output/LayerNorm/beta*B
_class8
64loc:@bert/encoder/layer_shared/output/LayerNorm/beta*
_output_shapes	
:?*
T0
?
Abert/encoder/layer_shared/output/LayerNorm/gamma/Initializer/onesConst*
valueB?*  ??*
_output_shapes	
:?*
dtype0*C
_class9
75loc:@bert/encoder/layer_shared/output/LayerNorm/gamma
?
0bert/encoder/layer_shared/output/LayerNorm/gamma
VariableV2*
_output_shapes	
:?*
shape:?*C
_class9
75loc:@bert/encoder/layer_shared/output/LayerNorm/gamma*
dtype0
?
7bert/encoder/layer_shared/output/LayerNorm/gamma/AssignAssign0bert/encoder/layer_shared/output/LayerNorm/gammaAbert/encoder/layer_shared/output/LayerNorm/gamma/Initializer/ones*
_output_shapes	
:?*
T0*C
_class9
75loc:@bert/encoder/layer_shared/output/LayerNorm/gamma
?
5bert/encoder/layer_shared/output/LayerNorm/gamma/readIdentity0bert/encoder/layer_shared/output/LayerNorm/gamma*C
_class9
75loc:@bert/encoder/layer_shared/output/LayerNorm/gamma*
T0*
_output_shapes	
:?
?
Nbert/bert/encoder/layer_shared/output/LayerNorm/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
?
<bert/bert/encoder/layer_shared/output/LayerNorm/moments/meanMean)bert/bert/encoder/layer_shared/output/addNbert/bert/encoder/layer_shared/output/LayerNorm/moments/mean/reduction_indices*
T0*'
_output_shapes
:?????????*
	keep_dims(
?
Dbert/bert/encoder/layer_shared/output/LayerNorm/moments/StopGradientStopGradient<bert/bert/encoder/layer_shared/output/LayerNorm/moments/mean*
T0*'
_output_shapes
:?????????
?
Ibert/bert/encoder/layer_shared/output/LayerNorm/moments/SquaredDifferenceSquaredDifference)bert/bert/encoder/layer_shared/output/addDbert/bert/encoder/layer_shared/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
Rbert/bert/encoder/layer_shared/output/LayerNorm/moments/variance/reduction_indicesConst*
valueB:*
dtype0*
_output_shapes
:
?
@bert/bert/encoder/layer_shared/output/LayerNorm/moments/varianceMeanIbert/bert/encoder/layer_shared/output/LayerNorm/moments/SquaredDifferenceRbert/bert/encoder/layer_shared/output/LayerNorm/moments/variance/reduction_indices*
T0*'
_output_shapes
:?????????*
	keep_dims(
?
?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add/yConst*
valueB
 *̼?+*
_output_shapes
: *
dtype0
?
=bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/addAdd@bert/bert/encoder/layer_shared/output/LayerNorm/moments/variance?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add/y*
T0*'
_output_shapes
:?????????
?
?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/RsqrtRsqrt=bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add*
T0*'
_output_shapes
:?????????
?
=bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mulMul?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/Rsqrt5bert/encoder/layer_shared/output/LayerNorm/gamma/read*(
_output_shapes
:??????????*
T0
?
?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul_1Mul)bert/bert/encoder/layer_shared/output/add=bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul_2Mul<bert/bert/encoder/layer_shared/output/LayerNorm/moments/mean=bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
=bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/subSub4bert/encoder/layer_shared/output/LayerNorm/beta/read?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul_2*(
_output_shapes
:??????????*
T0
?
?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1Add?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul_1=bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/sub*(
_output_shapes
:??????????*
T0
?
5bert/bert/encoder/layer_shared_1/attention/self/ShapeShape?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
T0*
_output_shapes
:
?
Cbert/bert/encoder/layer_shared_1/attention/self/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
?
Ebert/bert/encoder/layer_shared_1/attention/self/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
?
Ebert/bert/encoder/layer_shared_1/attention/self/strided_slice/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
=bert/bert/encoder/layer_shared_1/attention/self/strided_sliceStridedSlice5bert/bert/encoder/layer_shared_1/attention/self/ShapeCbert/bert/encoder/layer_shared_1/attention/self/strided_slice/stackEbert/bert/encoder/layer_shared_1/attention/self/strided_slice/stack_1Ebert/bert/encoder/layer_shared_1/attention/self/strided_slice/stack_2*
T0*
_output_shapes
: *
Index0*
shrink_axis_mask
?
7bert/bert/encoder/layer_shared_1/attention/self/Shape_1Shape?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
_output_shapes
:*
T0
?
Ebert/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stackConst*
dtype0*
_output_shapes
:*
valueB: 
?
Gbert/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
?
Gbert/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
?
?bert/bert/encoder/layer_shared_1/attention/self/strided_slice_1StridedSlice7bert/bert/encoder/layer_shared_1/attention/self/Shape_1Ebert/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stackGbert/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stack_1Gbert/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stack_2*
T0*
Index0*
_output_shapes
: *
shrink_axis_mask
?
<bert/bert/encoder/layer_shared_1/attention/self/query/MatMulMatMul?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1:bert/encoder/layer_shared/attention/self/query/kernel/read*(
_output_shapes
:??????????*
T0
?
=bert/bert/encoder/layer_shared_1/attention/self/query/BiasAddBiasAdd<bert/bert/encoder/layer_shared_1/attention/self/query/MatMul8bert/encoder/layer_shared/attention/self/query/bias/read*(
_output_shapes
:??????????*
T0
?
:bert/bert/encoder/layer_shared_1/attention/self/key/MatMulMatMul?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_18bert/encoder/layer_shared/attention/self/key/kernel/read*
T0*(
_output_shapes
:??????????
?
;bert/bert/encoder/layer_shared_1/attention/self/key/BiasAddBiasAdd:bert/bert/encoder/layer_shared_1/attention/self/key/MatMul6bert/encoder/layer_shared/attention/self/key/bias/read*
T0*(
_output_shapes
:??????????
?
<bert/bert/encoder/layer_shared_1/attention/self/value/MatMulMatMul?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1:bert/encoder/layer_shared/attention/self/value/kernel/read*(
_output_shapes
:??????????*
T0
?
=bert/bert/encoder/layer_shared_1/attention/self/value/BiasAddBiasAdd<bert/bert/encoder/layer_shared_1/attention/self/value/MatMul8bert/encoder/layer_shared/attention/self/value/bias/read*
T0*(
_output_shapes
:??????????
?
?bert/bert/encoder/layer_shared_1/attention/self/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
?
?bert/bert/encoder/layer_shared_1/attention/self/Reshape/shape/2Const*
dtype0*
_output_shapes
: *
value	B :
?
?bert/bert/encoder/layer_shared_1/attention/self/Reshape/shape/3Const*
dtype0*
value	B :*
_output_shapes
: 
?
=bert/bert/encoder/layer_shared_1/attention/self/Reshape/shapePack!bert/bert/encoder/strided_slice_2?bert/bert/encoder/layer_shared_1/attention/self/Reshape/shape/1?bert/bert/encoder/layer_shared_1/attention/self/Reshape/shape/2?bert/bert/encoder/layer_shared_1/attention/self/Reshape/shape/3*
N*
_output_shapes
:*
T0
?
7bert/bert/encoder/layer_shared_1/attention/self/ReshapeReshape=bert/bert/encoder/layer_shared_1/attention/self/query/BiasAdd=bert/bert/encoder/layer_shared_1/attention/self/Reshape/shape*
T0*/
_output_shapes
:?????????
?
>bert/bert/encoder/layer_shared_1/attention/self/transpose/permConst*
dtype0*
_output_shapes
:*%
valueB"             
?
9bert/bert/encoder/layer_shared_1/attention/self/transpose	Transpose7bert/bert/encoder/layer_shared_1/attention/self/Reshape>bert/bert/encoder/layer_shared_1/attention/self/transpose/perm*
T0*/
_output_shapes
:?????????
?
Abert/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/1Const*
_output_shapes
: *
value	B :*
dtype0
?
Abert/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value	B :
?
Abert/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
?
?bert/bert/encoder/layer_shared_1/attention/self/Reshape_1/shapePack!bert/bert/encoder/strided_slice_2Abert/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/1Abert/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/2Abert/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/3*
_output_shapes
:*
T0*
N
?
9bert/bert/encoder/layer_shared_1/attention/self/Reshape_1Reshape;bert/bert/encoder/layer_shared_1/attention/self/key/BiasAdd?bert/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape*/
_output_shapes
:?????????*
T0
?
@bert/bert/encoder/layer_shared_1/attention/self/transpose_1/permConst*
_output_shapes
:*%
valueB"             *
dtype0
?
;bert/bert/encoder/layer_shared_1/attention/self/transpose_1	Transpose9bert/bert/encoder/layer_shared_1/attention/self/Reshape_1@bert/bert/encoder/layer_shared_1/attention/self/transpose_1/perm*
T0*/
_output_shapes
:?????????
?
6bert/bert/encoder/layer_shared_1/attention/self/MatMulBatchMatMul9bert/bert/encoder/layer_shared_1/attention/self/transpose;bert/bert/encoder/layer_shared_1/attention/self/transpose_1*
T0*/
_output_shapes
:?????????*
adj_y(
z
5bert/bert/encoder/layer_shared_1/attention/self/Mul/yConst*
valueB
 *??H>*
_output_shapes
: *
dtype0
?
3bert/bert/encoder/layer_shared_1/attention/self/MulMul6bert/bert/encoder/layer_shared_1/attention/self/MatMul5bert/bert/encoder/layer_shared_1/attention/self/Mul/y*
T0*/
_output_shapes
:?????????
?
>bert/bert/encoder/layer_shared_1/attention/self/ExpandDims/dimConst*
_output_shapes
:*
dtype0*
valueB:
?
:bert/bert/encoder/layer_shared_1/attention/self/ExpandDims
ExpandDimsbert/bert/encoder/mul>bert/bert/encoder/layer_shared_1/attention/self/ExpandDims/dim*
T0*/
_output_shapes
:?????????
z
5bert/bert/encoder/layer_shared_1/attention/self/sub/xConst*
dtype0*
valueB
 *  ??*
_output_shapes
: 
?
3bert/bert/encoder/layer_shared_1/attention/self/subSub5bert/bert/encoder/layer_shared_1/attention/self/sub/x:bert/bert/encoder/layer_shared_1/attention/self/ExpandDims*/
_output_shapes
:?????????*
T0
|
7bert/bert/encoder/layer_shared_1/attention/self/mul_1/yConst*
valueB
 * @?*
_output_shapes
: *
dtype0
?
5bert/bert/encoder/layer_shared_1/attention/self/mul_1Mul3bert/bert/encoder/layer_shared_1/attention/self/sub7bert/bert/encoder/layer_shared_1/attention/self/mul_1/y*
T0*/
_output_shapes
:?????????
?
3bert/bert/encoder/layer_shared_1/attention/self/addAdd3bert/bert/encoder/layer_shared_1/attention/self/Mul5bert/bert/encoder/layer_shared_1/attention/self/mul_1*
T0*/
_output_shapes
:?????????
?
7bert/bert/encoder/layer_shared_1/attention/self/SoftmaxSoftmax3bert/bert/encoder/layer_shared_1/attention/self/add*
T0*/
_output_shapes
:?????????
?
Abert/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
?
Abert/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/2Const*
value	B :*
_output_shapes
: *
dtype0
?
Abert/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/3Const*
dtype0*
_output_shapes
: *
value	B :
?
?bert/bert/encoder/layer_shared_1/attention/self/Reshape_2/shapePack!bert/bert/encoder/strided_slice_2Abert/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/1Abert/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/2Abert/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/3*
T0*
_output_shapes
:*
N
?
9bert/bert/encoder/layer_shared_1/attention/self/Reshape_2Reshape=bert/bert/encoder/layer_shared_1/attention/self/value/BiasAdd?bert/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape*
T0*/
_output_shapes
:?????????
?
@bert/bert/encoder/layer_shared_1/attention/self/transpose_2/permConst*
dtype0*
_output_shapes
:*%
valueB"             
?
;bert/bert/encoder/layer_shared_1/attention/self/transpose_2	Transpose9bert/bert/encoder/layer_shared_1/attention/self/Reshape_2@bert/bert/encoder/layer_shared_1/attention/self/transpose_2/perm*/
_output_shapes
:?????????*
T0
?
8bert/bert/encoder/layer_shared_1/attention/self/MatMul_1BatchMatMul7bert/bert/encoder/layer_shared_1/attention/self/Softmax;bert/bert/encoder/layer_shared_1/attention/self/transpose_2*/
_output_shapes
:?????????*
T0
?
@bert/bert/encoder/layer_shared_1/attention/self/transpose_3/permConst*
dtype0*%
valueB"             *
_output_shapes
:
?
;bert/bert/encoder/layer_shared_1/attention/self/transpose_3	Transpose8bert/bert/encoder/layer_shared_1/attention/self/MatMul_1@bert/bert/encoder/layer_shared_1/attention/self/transpose_3/perm*
T0*/
_output_shapes
:?????????
y
7bert/bert/encoder/layer_shared_1/attention/self/mul_2/yConst*
dtype0*
_output_shapes
: *
value	B :
?
5bert/bert/encoder/layer_shared_1/attention/self/mul_2Mul!bert/bert/encoder/strided_slice_27bert/bert/encoder/layer_shared_1/attention/self/mul_2/y*
T0*
_output_shapes
: 
?
Abert/bert/encoder/layer_shared_1/attention/self/Reshape_3/shape/1Const*
dtype0*
_output_shapes
: *
value
B :?
?
?bert/bert/encoder/layer_shared_1/attention/self/Reshape_3/shapePack5bert/bert/encoder/layer_shared_1/attention/self/mul_2Abert/bert/encoder/layer_shared_1/attention/self/Reshape_3/shape/1*
N*
_output_shapes
:*
T0
?
9bert/bert/encoder/layer_shared_1/attention/self/Reshape_3Reshape;bert/bert/encoder/layer_shared_1/attention/self/transpose_3?bert/bert/encoder/layer_shared_1/attention/self/Reshape_3/shape*
T0*(
_output_shapes
:??????????
?
>bert/bert/encoder/layer_shared_1/attention/output/dense/MatMulMatMul9bert/bert/encoder/layer_shared_1/attention/self/Reshape_3<bert/encoder/layer_shared/attention/output/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
?bert/bert/encoder/layer_shared_1/attention/output/dense/BiasAddBiasAdd>bert/bert/encoder/layer_shared_1/attention/output/dense/MatMul:bert/encoder/layer_shared/attention/output/dense/bias/read*(
_output_shapes
:??????????*
T0
?
5bert/bert/encoder/layer_shared_1/attention/output/addAdd?bert/bert/encoder/layer_shared_1/attention/output/dense/BiasAdd?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*(
_output_shapes
:??????????*
T0
?
Zbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/mean/reduction_indicesConst*
_output_shapes
:*
valueB:*
dtype0
?
Hbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/meanMean5bert/bert/encoder/layer_shared_1/attention/output/addZbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/mean/reduction_indices*'
_output_shapes
:?????????*
T0*
	keep_dims(
?
Pbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/StopGradientStopGradientHbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/mean*
T0*'
_output_shapes
:?????????
?
Ubert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/SquaredDifferenceSquaredDifference5bert/bert/encoder/layer_shared_1/attention/output/addPbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
^bert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/variance/reduction_indicesConst*
valueB:*
_output_shapes
:*
dtype0
?
Lbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/varianceMeanUbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/SquaredDifference^bert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/variance/reduction_indices*'
_output_shapes
:?????????*
T0*
	keep_dims(
?
Kbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add/yConst*
valueB
 *̼?+*
_output_shapes
: *
dtype0
?
Ibert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/addAddLbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/varianceKbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add/y*'
_output_shapes
:?????????*
T0
?
Kbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/RsqrtRsqrtIbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add*
T0*'
_output_shapes
:?????????
?
Ibert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mulMulKbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/Rsqrt?bert/encoder/layer_shared/attention/output/LayerNorm/gamma/read*(
_output_shapes
:??????????*
T0
?
Kbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul_1Mul5bert/bert/encoder/layer_shared_1/attention/output/addIbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Kbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul_2MulHbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/meanIbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Ibert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/subSub>bert/encoder/layer_shared/attention/output/LayerNorm/beta/readKbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul_2*(
_output_shapes
:??????????*
T0
?
Kbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add_1AddKbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul_1Ibert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/sub*(
_output_shapes
:??????????*
T0
?
:bert/bert/encoder/layer_shared_1/intermediate/dense/MatMulMatMulKbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add_18bert/encoder/layer_shared/intermediate/dense/kernel/read*(
_output_shapes
:??????????	*
T0
?
;bert/bert/encoder/layer_shared_1/intermediate/dense/BiasAddBiasAdd:bert/bert/encoder/layer_shared_1/intermediate/dense/MatMul6bert/encoder/layer_shared/intermediate/dense/bias/read*
T0*(
_output_shapes
:??????????	
~
9bert/bert/encoder/layer_shared_1/intermediate/dense/Pow/yConst*
_output_shapes
: *
valueB
 *  @@*
dtype0
?
7bert/bert/encoder/layer_shared_1/intermediate/dense/PowPow;bert/bert/encoder/layer_shared_1/intermediate/dense/BiasAdd9bert/bert/encoder/layer_shared_1/intermediate/dense/Pow/y*(
_output_shapes
:??????????	*
T0
~
9bert/bert/encoder/layer_shared_1/intermediate/dense/mul/xConst*
_output_shapes
: *
valueB
 *'7=*
dtype0
?
7bert/bert/encoder/layer_shared_1/intermediate/dense/mulMul9bert/bert/encoder/layer_shared_1/intermediate/dense/mul/x7bert/bert/encoder/layer_shared_1/intermediate/dense/Pow*(
_output_shapes
:??????????	*
T0
?
7bert/bert/encoder/layer_shared_1/intermediate/dense/addAdd;bert/bert/encoder/layer_shared_1/intermediate/dense/BiasAdd7bert/bert/encoder/layer_shared_1/intermediate/dense/mul*(
_output_shapes
:??????????	*
T0
?
;bert/bert/encoder/layer_shared_1/intermediate/dense/mul_1/xConst*
_output_shapes
: *
valueB
 **BL?*
dtype0
?
9bert/bert/encoder/layer_shared_1/intermediate/dense/mul_1Mul;bert/bert/encoder/layer_shared_1/intermediate/dense/mul_1/x7bert/bert/encoder/layer_shared_1/intermediate/dense/add*(
_output_shapes
:??????????	*
T0
?
8bert/bert/encoder/layer_shared_1/intermediate/dense/TanhTanh9bert/bert/encoder/layer_shared_1/intermediate/dense/mul_1*
T0*(
_output_shapes
:??????????	
?
;bert/bert/encoder/layer_shared_1/intermediate/dense/add_1/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ??
?
9bert/bert/encoder/layer_shared_1/intermediate/dense/add_1Add;bert/bert/encoder/layer_shared_1/intermediate/dense/add_1/x8bert/bert/encoder/layer_shared_1/intermediate/dense/Tanh*
T0*(
_output_shapes
:??????????	
?
;bert/bert/encoder/layer_shared_1/intermediate/dense/mul_2/xConst*
dtype0*
valueB
 *   ?*
_output_shapes
: 
?
9bert/bert/encoder/layer_shared_1/intermediate/dense/mul_2Mul;bert/bert/encoder/layer_shared_1/intermediate/dense/mul_2/x9bert/bert/encoder/layer_shared_1/intermediate/dense/add_1*
T0*(
_output_shapes
:??????????	
?
9bert/bert/encoder/layer_shared_1/intermediate/dense/mul_3Mul;bert/bert/encoder/layer_shared_1/intermediate/dense/BiasAdd9bert/bert/encoder/layer_shared_1/intermediate/dense/mul_2*(
_output_shapes
:??????????	*
T0
?
4bert/bert/encoder/layer_shared_1/output/dense/MatMulMatMul9bert/bert/encoder/layer_shared_1/intermediate/dense/mul_32bert/encoder/layer_shared/output/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
5bert/bert/encoder/layer_shared_1/output/dense/BiasAddBiasAdd4bert/bert/encoder/layer_shared_1/output/dense/MatMul0bert/encoder/layer_shared/output/dense/bias/read*
T0*(
_output_shapes
:??????????
?
+bert/bert/encoder/layer_shared_1/output/addAdd5bert/bert/encoder/layer_shared_1/output/dense/BiasAddKbert/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add_1*(
_output_shapes
:??????????*
T0
?
Pbert/bert/encoder/layer_shared_1/output/LayerNorm/moments/mean/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
?
>bert/bert/encoder/layer_shared_1/output/LayerNorm/moments/meanMean+bert/bert/encoder/layer_shared_1/output/addPbert/bert/encoder/layer_shared_1/output/LayerNorm/moments/mean/reduction_indices*
T0*'
_output_shapes
:?????????*
	keep_dims(
?
Fbert/bert/encoder/layer_shared_1/output/LayerNorm/moments/StopGradientStopGradient>bert/bert/encoder/layer_shared_1/output/LayerNorm/moments/mean*
T0*'
_output_shapes
:?????????
?
Kbert/bert/encoder/layer_shared_1/output/LayerNorm/moments/SquaredDifferenceSquaredDifference+bert/bert/encoder/layer_shared_1/output/addFbert/bert/encoder/layer_shared_1/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
Tbert/bert/encoder/layer_shared_1/output/LayerNorm/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
?
Bbert/bert/encoder/layer_shared_1/output/LayerNorm/moments/varianceMeanKbert/bert/encoder/layer_shared_1/output/LayerNorm/moments/SquaredDifferenceTbert/bert/encoder/layer_shared_1/output/LayerNorm/moments/variance/reduction_indices*
T0*
	keep_dims(*'
_output_shapes
:?????????
?
Abert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/add/yConst*
_output_shapes
: *
valueB
 *̼?+*
dtype0
?
?bert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/addAddBbert/bert/encoder/layer_shared_1/output/LayerNorm/moments/varianceAbert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/add/y*
T0*'
_output_shapes
:?????????
?
Abert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/RsqrtRsqrt?bert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/add*
T0*'
_output_shapes
:?????????
?
?bert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mulMulAbert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/Rsqrt5bert/encoder/layer_shared/output/LayerNorm/gamma/read*
T0*(
_output_shapes
:??????????
?
Abert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul_1Mul+bert/bert/encoder/layer_shared_1/output/add?bert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Abert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul_2Mul>bert/bert/encoder/layer_shared_1/output/LayerNorm/moments/mean?bert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
?bert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/subSub4bert/encoder/layer_shared/output/LayerNorm/beta/readAbert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul_2*(
_output_shapes
:??????????*
T0
?
Abert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/add_1AddAbert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul_1?bert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/sub*
T0*(
_output_shapes
:??????????
?
-bert/bert/encoder/layer_shared_1/output/add_1AddAbert/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/add_1?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
T0*(
_output_shapes
:??????????
?
5bert/bert/encoder/layer_shared_2/attention/self/ShapeShape-bert/bert/encoder/layer_shared_1/output/add_1*
T0*
_output_shapes
:
?
Cbert/bert/encoder/layer_shared_2/attention/self/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
?
Ebert/bert/encoder/layer_shared_2/attention/self/strided_slice/stack_1Const*
valueB:*
_output_shapes
:*
dtype0
?
Ebert/bert/encoder/layer_shared_2/attention/self/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
?
=bert/bert/encoder/layer_shared_2/attention/self/strided_sliceStridedSlice5bert/bert/encoder/layer_shared_2/attention/self/ShapeCbert/bert/encoder/layer_shared_2/attention/self/strided_slice/stackEbert/bert/encoder/layer_shared_2/attention/self/strided_slice/stack_1Ebert/bert/encoder/layer_shared_2/attention/self/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
?
7bert/bert/encoder/layer_shared_2/attention/self/Shape_1Shape-bert/bert/encoder/layer_shared_1/output/add_1*
_output_shapes
:*
T0
?
Ebert/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stackConst*
valueB: *
_output_shapes
:*
dtype0
?
Gbert/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?
Gbert/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
?bert/bert/encoder/layer_shared_2/attention/self/strided_slice_1StridedSlice7bert/bert/encoder/layer_shared_2/attention/self/Shape_1Ebert/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stackGbert/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stack_1Gbert/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stack_2*
Index0*
_output_shapes
: *
T0*
shrink_axis_mask
?
<bert/bert/encoder/layer_shared_2/attention/self/query/MatMulMatMul-bert/bert/encoder/layer_shared_1/output/add_1:bert/encoder/layer_shared/attention/self/query/kernel/read*(
_output_shapes
:??????????*
T0
?
=bert/bert/encoder/layer_shared_2/attention/self/query/BiasAddBiasAdd<bert/bert/encoder/layer_shared_2/attention/self/query/MatMul8bert/encoder/layer_shared/attention/self/query/bias/read*
T0*(
_output_shapes
:??????????
?
:bert/bert/encoder/layer_shared_2/attention/self/key/MatMulMatMul-bert/bert/encoder/layer_shared_1/output/add_18bert/encoder/layer_shared/attention/self/key/kernel/read*
T0*(
_output_shapes
:??????????
?
;bert/bert/encoder/layer_shared_2/attention/self/key/BiasAddBiasAdd:bert/bert/encoder/layer_shared_2/attention/self/key/MatMul6bert/encoder/layer_shared/attention/self/key/bias/read*
T0*(
_output_shapes
:??????????
?
<bert/bert/encoder/layer_shared_2/attention/self/value/MatMulMatMul-bert/bert/encoder/layer_shared_1/output/add_1:bert/encoder/layer_shared/attention/self/value/kernel/read*(
_output_shapes
:??????????*
T0
?
=bert/bert/encoder/layer_shared_2/attention/self/value/BiasAddBiasAdd<bert/bert/encoder/layer_shared_2/attention/self/value/MatMul8bert/encoder/layer_shared/attention/self/value/bias/read*(
_output_shapes
:??????????*
T0
?
?bert/bert/encoder/layer_shared_2/attention/self/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
?bert/bert/encoder/layer_shared_2/attention/self/Reshape/shape/2Const*
_output_shapes
: *
value	B :*
dtype0
?
?bert/bert/encoder/layer_shared_2/attention/self/Reshape/shape/3Const*
dtype0*
_output_shapes
: *
value	B :
?
=bert/bert/encoder/layer_shared_2/attention/self/Reshape/shapePack!bert/bert/encoder/strided_slice_2?bert/bert/encoder/layer_shared_2/attention/self/Reshape/shape/1?bert/bert/encoder/layer_shared_2/attention/self/Reshape/shape/2?bert/bert/encoder/layer_shared_2/attention/self/Reshape/shape/3*
T0*
N*
_output_shapes
:
?
7bert/bert/encoder/layer_shared_2/attention/self/ReshapeReshape=bert/bert/encoder/layer_shared_2/attention/self/query/BiasAdd=bert/bert/encoder/layer_shared_2/attention/self/Reshape/shape*
T0*/
_output_shapes
:?????????
?
>bert/bert/encoder/layer_shared_2/attention/self/transpose/permConst*
_output_shapes
:*%
valueB"             *
dtype0
?
9bert/bert/encoder/layer_shared_2/attention/self/transpose	Transpose7bert/bert/encoder/layer_shared_2/attention/self/Reshape>bert/bert/encoder/layer_shared_2/attention/self/transpose/perm*
T0*/
_output_shapes
:?????????
?
Abert/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Abert/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/2Const*
_output_shapes
: *
value	B :*
dtype0
?
Abert/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/3Const*
value	B :*
_output_shapes
: *
dtype0
?
?bert/bert/encoder/layer_shared_2/attention/self/Reshape_1/shapePack!bert/bert/encoder/strided_slice_2Abert/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/1Abert/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/2Abert/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/3*
N*
T0*
_output_shapes
:
?
9bert/bert/encoder/layer_shared_2/attention/self/Reshape_1Reshape;bert/bert/encoder/layer_shared_2/attention/self/key/BiasAdd?bert/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape*/
_output_shapes
:?????????*
T0
?
@bert/bert/encoder/layer_shared_2/attention/self/transpose_1/permConst*%
valueB"             *
dtype0*
_output_shapes
:
?
;bert/bert/encoder/layer_shared_2/attention/self/transpose_1	Transpose9bert/bert/encoder/layer_shared_2/attention/self/Reshape_1@bert/bert/encoder/layer_shared_2/attention/self/transpose_1/perm*/
_output_shapes
:?????????*
T0
?
6bert/bert/encoder/layer_shared_2/attention/self/MatMulBatchMatMul9bert/bert/encoder/layer_shared_2/attention/self/transpose;bert/bert/encoder/layer_shared_2/attention/self/transpose_1*
adj_y(*/
_output_shapes
:?????????*
T0
z
5bert/bert/encoder/layer_shared_2/attention/self/Mul/yConst*
dtype0*
_output_shapes
: *
valueB
 *??H>
?
3bert/bert/encoder/layer_shared_2/attention/self/MulMul6bert/bert/encoder/layer_shared_2/attention/self/MatMul5bert/bert/encoder/layer_shared_2/attention/self/Mul/y*/
_output_shapes
:?????????*
T0
?
>bert/bert/encoder/layer_shared_2/attention/self/ExpandDims/dimConst*
valueB:*
_output_shapes
:*
dtype0
?
:bert/bert/encoder/layer_shared_2/attention/self/ExpandDims
ExpandDimsbert/bert/encoder/mul>bert/bert/encoder/layer_shared_2/attention/self/ExpandDims/dim*
T0*/
_output_shapes
:?????????
z
5bert/bert/encoder/layer_shared_2/attention/self/sub/xConst*
dtype0*
valueB
 *  ??*
_output_shapes
: 
?
3bert/bert/encoder/layer_shared_2/attention/self/subSub5bert/bert/encoder/layer_shared_2/attention/self/sub/x:bert/bert/encoder/layer_shared_2/attention/self/ExpandDims*/
_output_shapes
:?????????*
T0
|
7bert/bert/encoder/layer_shared_2/attention/self/mul_1/yConst*
valueB
 * @?*
dtype0*
_output_shapes
: 
?
5bert/bert/encoder/layer_shared_2/attention/self/mul_1Mul3bert/bert/encoder/layer_shared_2/attention/self/sub7bert/bert/encoder/layer_shared_2/attention/self/mul_1/y*
T0*/
_output_shapes
:?????????
?
3bert/bert/encoder/layer_shared_2/attention/self/addAdd3bert/bert/encoder/layer_shared_2/attention/self/Mul5bert/bert/encoder/layer_shared_2/attention/self/mul_1*/
_output_shapes
:?????????*
T0
?
7bert/bert/encoder/layer_shared_2/attention/self/SoftmaxSoftmax3bert/bert/encoder/layer_shared_2/attention/self/add*/
_output_shapes
:?????????*
T0
?
Abert/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/1Const*
_output_shapes
: *
value	B :*
dtype0
?
Abert/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B :
?
Abert/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
?
?bert/bert/encoder/layer_shared_2/attention/self/Reshape_2/shapePack!bert/bert/encoder/strided_slice_2Abert/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/1Abert/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/2Abert/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/3*
N*
T0*
_output_shapes
:
?
9bert/bert/encoder/layer_shared_2/attention/self/Reshape_2Reshape=bert/bert/encoder/layer_shared_2/attention/self/value/BiasAdd?bert/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape*
T0*/
_output_shapes
:?????????
?
@bert/bert/encoder/layer_shared_2/attention/self/transpose_2/permConst*
_output_shapes
:*%
valueB"             *
dtype0
?
;bert/bert/encoder/layer_shared_2/attention/self/transpose_2	Transpose9bert/bert/encoder/layer_shared_2/attention/self/Reshape_2@bert/bert/encoder/layer_shared_2/attention/self/transpose_2/perm*/
_output_shapes
:?????????*
T0
?
8bert/bert/encoder/layer_shared_2/attention/self/MatMul_1BatchMatMul7bert/bert/encoder/layer_shared_2/attention/self/Softmax;bert/bert/encoder/layer_shared_2/attention/self/transpose_2*/
_output_shapes
:?????????*
T0
?
@bert/bert/encoder/layer_shared_2/attention/self/transpose_3/permConst*
_output_shapes
:*
dtype0*%
valueB"             
?
;bert/bert/encoder/layer_shared_2/attention/self/transpose_3	Transpose8bert/bert/encoder/layer_shared_2/attention/self/MatMul_1@bert/bert/encoder/layer_shared_2/attention/self/transpose_3/perm*
T0*/
_output_shapes
:?????????
y
7bert/bert/encoder/layer_shared_2/attention/self/mul_2/yConst*
_output_shapes
: *
dtype0*
value	B :
?
5bert/bert/encoder/layer_shared_2/attention/self/mul_2Mul!bert/bert/encoder/strided_slice_27bert/bert/encoder/layer_shared_2/attention/self/mul_2/y*
T0*
_output_shapes
: 
?
Abert/bert/encoder/layer_shared_2/attention/self/Reshape_3/shape/1Const*
_output_shapes
: *
dtype0*
value
B :?
?
?bert/bert/encoder/layer_shared_2/attention/self/Reshape_3/shapePack5bert/bert/encoder/layer_shared_2/attention/self/mul_2Abert/bert/encoder/layer_shared_2/attention/self/Reshape_3/shape/1*
T0*
N*
_output_shapes
:
?
9bert/bert/encoder/layer_shared_2/attention/self/Reshape_3Reshape;bert/bert/encoder/layer_shared_2/attention/self/transpose_3?bert/bert/encoder/layer_shared_2/attention/self/Reshape_3/shape*
T0*(
_output_shapes
:??????????
?
>bert/bert/encoder/layer_shared_2/attention/output/dense/MatMulMatMul9bert/bert/encoder/layer_shared_2/attention/self/Reshape_3<bert/encoder/layer_shared/attention/output/dense/kernel/read*(
_output_shapes
:??????????*
T0
?
?bert/bert/encoder/layer_shared_2/attention/output/dense/BiasAddBiasAdd>bert/bert/encoder/layer_shared_2/attention/output/dense/MatMul:bert/encoder/layer_shared/attention/output/dense/bias/read*
T0*(
_output_shapes
:??????????
?
5bert/bert/encoder/layer_shared_2/attention/output/addAdd?bert/bert/encoder/layer_shared_2/attention/output/dense/BiasAdd-bert/bert/encoder/layer_shared_1/output/add_1*(
_output_shapes
:??????????*
T0
?
Zbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
?
Hbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/meanMean5bert/bert/encoder/layer_shared_2/attention/output/addZbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/mean/reduction_indices*'
_output_shapes
:?????????*
	keep_dims(*
T0
?
Pbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/StopGradientStopGradientHbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/mean*'
_output_shapes
:?????????*
T0
?
Ubert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/SquaredDifferenceSquaredDifference5bert/bert/encoder/layer_shared_2/attention/output/addPbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
^bert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/variance/reduction_indicesConst*
valueB:*
dtype0*
_output_shapes
:
?
Lbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/varianceMeanUbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/SquaredDifference^bert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/variance/reduction_indices*
	keep_dims(*'
_output_shapes
:?????????*
T0
?
Kbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add/yConst*
_output_shapes
: *
valueB
 *̼?+*
dtype0
?
Ibert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/addAddLbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/varianceKbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add/y*
T0*'
_output_shapes
:?????????
?
Kbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/RsqrtRsqrtIbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add*'
_output_shapes
:?????????*
T0
?
Ibert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mulMulKbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/Rsqrt?bert/encoder/layer_shared/attention/output/LayerNorm/gamma/read*
T0*(
_output_shapes
:??????????
?
Kbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul_1Mul5bert/bert/encoder/layer_shared_2/attention/output/addIbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Kbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul_2MulHbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/meanIbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Ibert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/subSub>bert/encoder/layer_shared/attention/output/LayerNorm/beta/readKbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul_2*(
_output_shapes
:??????????*
T0
?
Kbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add_1AddKbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul_1Ibert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/sub*
T0*(
_output_shapes
:??????????
?
:bert/bert/encoder/layer_shared_2/intermediate/dense/MatMulMatMulKbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add_18bert/encoder/layer_shared/intermediate/dense/kernel/read*
T0*(
_output_shapes
:??????????	
?
;bert/bert/encoder/layer_shared_2/intermediate/dense/BiasAddBiasAdd:bert/bert/encoder/layer_shared_2/intermediate/dense/MatMul6bert/encoder/layer_shared/intermediate/dense/bias/read*
T0*(
_output_shapes
:??????????	
~
9bert/bert/encoder/layer_shared_2/intermediate/dense/Pow/yConst*
_output_shapes
: *
valueB
 *  @@*
dtype0
?
7bert/bert/encoder/layer_shared_2/intermediate/dense/PowPow;bert/bert/encoder/layer_shared_2/intermediate/dense/BiasAdd9bert/bert/encoder/layer_shared_2/intermediate/dense/Pow/y*
T0*(
_output_shapes
:??????????	
~
9bert/bert/encoder/layer_shared_2/intermediate/dense/mul/xConst*
_output_shapes
: *
valueB
 *'7=*
dtype0
?
7bert/bert/encoder/layer_shared_2/intermediate/dense/mulMul9bert/bert/encoder/layer_shared_2/intermediate/dense/mul/x7bert/bert/encoder/layer_shared_2/intermediate/dense/Pow*(
_output_shapes
:??????????	*
T0
?
7bert/bert/encoder/layer_shared_2/intermediate/dense/addAdd;bert/bert/encoder/layer_shared_2/intermediate/dense/BiasAdd7bert/bert/encoder/layer_shared_2/intermediate/dense/mul*(
_output_shapes
:??????????	*
T0
?
;bert/bert/encoder/layer_shared_2/intermediate/dense/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 **BL?
?
9bert/bert/encoder/layer_shared_2/intermediate/dense/mul_1Mul;bert/bert/encoder/layer_shared_2/intermediate/dense/mul_1/x7bert/bert/encoder/layer_shared_2/intermediate/dense/add*(
_output_shapes
:??????????	*
T0
?
8bert/bert/encoder/layer_shared_2/intermediate/dense/TanhTanh9bert/bert/encoder/layer_shared_2/intermediate/dense/mul_1*(
_output_shapes
:??????????	*
T0
?
;bert/bert/encoder/layer_shared_2/intermediate/dense/add_1/xConst*
_output_shapes
: *
valueB
 *  ??*
dtype0
?
9bert/bert/encoder/layer_shared_2/intermediate/dense/add_1Add;bert/bert/encoder/layer_shared_2/intermediate/dense/add_1/x8bert/bert/encoder/layer_shared_2/intermediate/dense/Tanh*
T0*(
_output_shapes
:??????????	
?
;bert/bert/encoder/layer_shared_2/intermediate/dense/mul_2/xConst*
dtype0*
_output_shapes
: *
valueB
 *   ?
?
9bert/bert/encoder/layer_shared_2/intermediate/dense/mul_2Mul;bert/bert/encoder/layer_shared_2/intermediate/dense/mul_2/x9bert/bert/encoder/layer_shared_2/intermediate/dense/add_1*(
_output_shapes
:??????????	*
T0
?
9bert/bert/encoder/layer_shared_2/intermediate/dense/mul_3Mul;bert/bert/encoder/layer_shared_2/intermediate/dense/BiasAdd9bert/bert/encoder/layer_shared_2/intermediate/dense/mul_2*(
_output_shapes
:??????????	*
T0
?
4bert/bert/encoder/layer_shared_2/output/dense/MatMulMatMul9bert/bert/encoder/layer_shared_2/intermediate/dense/mul_32bert/encoder/layer_shared/output/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
5bert/bert/encoder/layer_shared_2/output/dense/BiasAddBiasAdd4bert/bert/encoder/layer_shared_2/output/dense/MatMul0bert/encoder/layer_shared/output/dense/bias/read*(
_output_shapes
:??????????*
T0
?
+bert/bert/encoder/layer_shared_2/output/addAdd5bert/bert/encoder/layer_shared_2/output/dense/BiasAddKbert/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add_1*(
_output_shapes
:??????????*
T0
?
Pbert/bert/encoder/layer_shared_2/output/LayerNorm/moments/mean/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
?
>bert/bert/encoder/layer_shared_2/output/LayerNorm/moments/meanMean+bert/bert/encoder/layer_shared_2/output/addPbert/bert/encoder/layer_shared_2/output/LayerNorm/moments/mean/reduction_indices*
	keep_dims(*'
_output_shapes
:?????????*
T0
?
Fbert/bert/encoder/layer_shared_2/output/LayerNorm/moments/StopGradientStopGradient>bert/bert/encoder/layer_shared_2/output/LayerNorm/moments/mean*'
_output_shapes
:?????????*
T0
?
Kbert/bert/encoder/layer_shared_2/output/LayerNorm/moments/SquaredDifferenceSquaredDifference+bert/bert/encoder/layer_shared_2/output/addFbert/bert/encoder/layer_shared_2/output/LayerNorm/moments/StopGradient*(
_output_shapes
:??????????*
T0
?
Tbert/bert/encoder/layer_shared_2/output/LayerNorm/moments/variance/reduction_indicesConst*
valueB:*
_output_shapes
:*
dtype0
?
Bbert/bert/encoder/layer_shared_2/output/LayerNorm/moments/varianceMeanKbert/bert/encoder/layer_shared_2/output/LayerNorm/moments/SquaredDifferenceTbert/bert/encoder/layer_shared_2/output/LayerNorm/moments/variance/reduction_indices*'
_output_shapes
:?????????*
	keep_dims(*
T0
?
Abert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/add/yConst*
valueB
 *̼?+*
_output_shapes
: *
dtype0
?
?bert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/addAddBbert/bert/encoder/layer_shared_2/output/LayerNorm/moments/varianceAbert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/add/y*'
_output_shapes
:?????????*
T0
?
Abert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/RsqrtRsqrt?bert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/add*
T0*'
_output_shapes
:?????????
?
?bert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mulMulAbert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/Rsqrt5bert/encoder/layer_shared/output/LayerNorm/gamma/read*(
_output_shapes
:??????????*
T0
?
Abert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul_1Mul+bert/bert/encoder/layer_shared_2/output/add?bert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Abert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul_2Mul>bert/bert/encoder/layer_shared_2/output/LayerNorm/moments/mean?bert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
?bert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/subSub4bert/encoder/layer_shared/output/LayerNorm/beta/readAbert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul_2*(
_output_shapes
:??????????*
T0
?
Abert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/add_1AddAbert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul_1?bert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/sub*(
_output_shapes
:??????????*
T0
?
-bert/bert/encoder/layer_shared_2/output/add_1AddAbert/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/add_1?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
T0*(
_output_shapes
:??????????
?
-bert/bert/encoder/layer_shared_2/output/add_2Add-bert/bert/encoder/layer_shared_2/output/add_1-bert/bert/encoder/layer_shared_1/output/add_1*
T0*(
_output_shapes
:??????????
?
5bert/bert/encoder/layer_shared_3/attention/self/ShapeShape-bert/bert/encoder/layer_shared_2/output/add_2*
_output_shapes
:*
T0
?
Cbert/bert/encoder/layer_shared_3/attention/self/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
?
Ebert/bert/encoder/layer_shared_3/attention/self/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
?
Ebert/bert/encoder/layer_shared_3/attention/self/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
?
=bert/bert/encoder/layer_shared_3/attention/self/strided_sliceStridedSlice5bert/bert/encoder/layer_shared_3/attention/self/ShapeCbert/bert/encoder/layer_shared_3/attention/self/strided_slice/stackEbert/bert/encoder/layer_shared_3/attention/self/strided_slice/stack_1Ebert/bert/encoder/layer_shared_3/attention/self/strided_slice/stack_2*
shrink_axis_mask*
_output_shapes
: *
Index0*
T0
?
7bert/bert/encoder/layer_shared_3/attention/self/Shape_1Shape-bert/bert/encoder/layer_shared_2/output/add_2*
_output_shapes
:*
T0
?
Ebert/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stackConst*
dtype0*
valueB: *
_output_shapes
:
?
Gbert/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
?
Gbert/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
?bert/bert/encoder/layer_shared_3/attention/self/strided_slice_1StridedSlice7bert/bert/encoder/layer_shared_3/attention/self/Shape_1Ebert/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stackGbert/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stack_1Gbert/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stack_2*
Index0*
_output_shapes
: *
T0*
shrink_axis_mask
?
<bert/bert/encoder/layer_shared_3/attention/self/query/MatMulMatMul-bert/bert/encoder/layer_shared_2/output/add_2:bert/encoder/layer_shared/attention/self/query/kernel/read*
T0*(
_output_shapes
:??????????
?
=bert/bert/encoder/layer_shared_3/attention/self/query/BiasAddBiasAdd<bert/bert/encoder/layer_shared_3/attention/self/query/MatMul8bert/encoder/layer_shared/attention/self/query/bias/read*(
_output_shapes
:??????????*
T0
?
:bert/bert/encoder/layer_shared_3/attention/self/key/MatMulMatMul-bert/bert/encoder/layer_shared_2/output/add_28bert/encoder/layer_shared/attention/self/key/kernel/read*
T0*(
_output_shapes
:??????????
?
;bert/bert/encoder/layer_shared_3/attention/self/key/BiasAddBiasAdd:bert/bert/encoder/layer_shared_3/attention/self/key/MatMul6bert/encoder/layer_shared/attention/self/key/bias/read*
T0*(
_output_shapes
:??????????
?
<bert/bert/encoder/layer_shared_3/attention/self/value/MatMulMatMul-bert/bert/encoder/layer_shared_2/output/add_2:bert/encoder/layer_shared/attention/self/value/kernel/read*
T0*(
_output_shapes
:??????????
?
=bert/bert/encoder/layer_shared_3/attention/self/value/BiasAddBiasAdd<bert/bert/encoder/layer_shared_3/attention/self/value/MatMul8bert/encoder/layer_shared/attention/self/value/bias/read*
T0*(
_output_shapes
:??????????
?
?bert/bert/encoder/layer_shared_3/attention/self/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
?bert/bert/encoder/layer_shared_3/attention/self/Reshape/shape/2Const*
dtype0*
_output_shapes
: *
value	B :
?
?bert/bert/encoder/layer_shared_3/attention/self/Reshape/shape/3Const*
dtype0*
_output_shapes
: *
value	B :
?
=bert/bert/encoder/layer_shared_3/attention/self/Reshape/shapePack!bert/bert/encoder/strided_slice_2?bert/bert/encoder/layer_shared_3/attention/self/Reshape/shape/1?bert/bert/encoder/layer_shared_3/attention/self/Reshape/shape/2?bert/bert/encoder/layer_shared_3/attention/self/Reshape/shape/3*
N*
_output_shapes
:*
T0
?
7bert/bert/encoder/layer_shared_3/attention/self/ReshapeReshape=bert/bert/encoder/layer_shared_3/attention/self/query/BiasAdd=bert/bert/encoder/layer_shared_3/attention/self/Reshape/shape*
T0*/
_output_shapes
:?????????
?
>bert/bert/encoder/layer_shared_3/attention/self/transpose/permConst*%
valueB"             *
dtype0*
_output_shapes
:
?
9bert/bert/encoder/layer_shared_3/attention/self/transpose	Transpose7bert/bert/encoder/layer_shared_3/attention/self/Reshape>bert/bert/encoder/layer_shared_3/attention/self/transpose/perm*
T0*/
_output_shapes
:?????????
?
Abert/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
?
Abert/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/2Const*
value	B :*
dtype0*
_output_shapes
: 
?
Abert/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/3Const*
value	B :*
_output_shapes
: *
dtype0
?
?bert/bert/encoder/layer_shared_3/attention/self/Reshape_1/shapePack!bert/bert/encoder/strided_slice_2Abert/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/1Abert/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/2Abert/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/3*
_output_shapes
:*
N*
T0
?
9bert/bert/encoder/layer_shared_3/attention/self/Reshape_1Reshape;bert/bert/encoder/layer_shared_3/attention/self/key/BiasAdd?bert/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape*/
_output_shapes
:?????????*
T0
?
@bert/bert/encoder/layer_shared_3/attention/self/transpose_1/permConst*%
valueB"             *
_output_shapes
:*
dtype0
?
;bert/bert/encoder/layer_shared_3/attention/self/transpose_1	Transpose9bert/bert/encoder/layer_shared_3/attention/self/Reshape_1@bert/bert/encoder/layer_shared_3/attention/self/transpose_1/perm*/
_output_shapes
:?????????*
T0
?
6bert/bert/encoder/layer_shared_3/attention/self/MatMulBatchMatMul9bert/bert/encoder/layer_shared_3/attention/self/transpose;bert/bert/encoder/layer_shared_3/attention/self/transpose_1*
adj_y(*
T0*/
_output_shapes
:?????????
z
5bert/bert/encoder/layer_shared_3/attention/self/Mul/yConst*
dtype0*
_output_shapes
: *
valueB
 *??H>
?
3bert/bert/encoder/layer_shared_3/attention/self/MulMul6bert/bert/encoder/layer_shared_3/attention/self/MatMul5bert/bert/encoder/layer_shared_3/attention/self/Mul/y*
T0*/
_output_shapes
:?????????
?
>bert/bert/encoder/layer_shared_3/attention/self/ExpandDims/dimConst*
_output_shapes
:*
dtype0*
valueB:
?
:bert/bert/encoder/layer_shared_3/attention/self/ExpandDims
ExpandDimsbert/bert/encoder/mul>bert/bert/encoder/layer_shared_3/attention/self/ExpandDims/dim*/
_output_shapes
:?????????*
T0
z
5bert/bert/encoder/layer_shared_3/attention/self/sub/xConst*
dtype0*
_output_shapes
: *
valueB
 *  ??
?
3bert/bert/encoder/layer_shared_3/attention/self/subSub5bert/bert/encoder/layer_shared_3/attention/self/sub/x:bert/bert/encoder/layer_shared_3/attention/self/ExpandDims*
T0*/
_output_shapes
:?????????
|
7bert/bert/encoder/layer_shared_3/attention/self/mul_1/yConst*
dtype0*
_output_shapes
: *
valueB
 * @?
?
5bert/bert/encoder/layer_shared_3/attention/self/mul_1Mul3bert/bert/encoder/layer_shared_3/attention/self/sub7bert/bert/encoder/layer_shared_3/attention/self/mul_1/y*
T0*/
_output_shapes
:?????????
?
3bert/bert/encoder/layer_shared_3/attention/self/addAdd3bert/bert/encoder/layer_shared_3/attention/self/Mul5bert/bert/encoder/layer_shared_3/attention/self/mul_1*/
_output_shapes
:?????????*
T0
?
7bert/bert/encoder/layer_shared_3/attention/self/SoftmaxSoftmax3bert/bert/encoder/layer_shared_3/attention/self/add*
T0*/
_output_shapes
:?????????
?
Abert/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
?
Abert/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B :
?
Abert/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/3Const*
dtype0*
value	B :*
_output_shapes
: 
?
?bert/bert/encoder/layer_shared_3/attention/self/Reshape_2/shapePack!bert/bert/encoder/strided_slice_2Abert/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/1Abert/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/2Abert/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/3*
T0*
_output_shapes
:*
N
?
9bert/bert/encoder/layer_shared_3/attention/self/Reshape_2Reshape=bert/bert/encoder/layer_shared_3/attention/self/value/BiasAdd?bert/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape*/
_output_shapes
:?????????*
T0
?
@bert/bert/encoder/layer_shared_3/attention/self/transpose_2/permConst*
dtype0*%
valueB"             *
_output_shapes
:
?
;bert/bert/encoder/layer_shared_3/attention/self/transpose_2	Transpose9bert/bert/encoder/layer_shared_3/attention/self/Reshape_2@bert/bert/encoder/layer_shared_3/attention/self/transpose_2/perm*
T0*/
_output_shapes
:?????????
?
8bert/bert/encoder/layer_shared_3/attention/self/MatMul_1BatchMatMul7bert/bert/encoder/layer_shared_3/attention/self/Softmax;bert/bert/encoder/layer_shared_3/attention/self/transpose_2*/
_output_shapes
:?????????*
T0
?
@bert/bert/encoder/layer_shared_3/attention/self/transpose_3/permConst*
_output_shapes
:*%
valueB"             *
dtype0
?
;bert/bert/encoder/layer_shared_3/attention/self/transpose_3	Transpose8bert/bert/encoder/layer_shared_3/attention/self/MatMul_1@bert/bert/encoder/layer_shared_3/attention/self/transpose_3/perm*
T0*/
_output_shapes
:?????????
y
7bert/bert/encoder/layer_shared_3/attention/self/mul_2/yConst*
_output_shapes
: *
dtype0*
value	B :
?
5bert/bert/encoder/layer_shared_3/attention/self/mul_2Mul!bert/bert/encoder/strided_slice_27bert/bert/encoder/layer_shared_3/attention/self/mul_2/y*
_output_shapes
: *
T0
?
Abert/bert/encoder/layer_shared_3/attention/self/Reshape_3/shape/1Const*
value
B :?*
_output_shapes
: *
dtype0
?
?bert/bert/encoder/layer_shared_3/attention/self/Reshape_3/shapePack5bert/bert/encoder/layer_shared_3/attention/self/mul_2Abert/bert/encoder/layer_shared_3/attention/self/Reshape_3/shape/1*
T0*
N*
_output_shapes
:
?
9bert/bert/encoder/layer_shared_3/attention/self/Reshape_3Reshape;bert/bert/encoder/layer_shared_3/attention/self/transpose_3?bert/bert/encoder/layer_shared_3/attention/self/Reshape_3/shape*
T0*(
_output_shapes
:??????????
?
>bert/bert/encoder/layer_shared_3/attention/output/dense/MatMulMatMul9bert/bert/encoder/layer_shared_3/attention/self/Reshape_3<bert/encoder/layer_shared/attention/output/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
?bert/bert/encoder/layer_shared_3/attention/output/dense/BiasAddBiasAdd>bert/bert/encoder/layer_shared_3/attention/output/dense/MatMul:bert/encoder/layer_shared/attention/output/dense/bias/read*
T0*(
_output_shapes
:??????????
?
5bert/bert/encoder/layer_shared_3/attention/output/addAdd?bert/bert/encoder/layer_shared_3/attention/output/dense/BiasAdd-bert/bert/encoder/layer_shared_2/output/add_2*(
_output_shapes
:??????????*
T0
?
Zbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/mean/reduction_indicesConst*
valueB:*
_output_shapes
:*
dtype0
?
Hbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/meanMean5bert/bert/encoder/layer_shared_3/attention/output/addZbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/mean/reduction_indices*
T0*
	keep_dims(*'
_output_shapes
:?????????
?
Pbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/StopGradientStopGradientHbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/mean*'
_output_shapes
:?????????*
T0
?
Ubert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/SquaredDifferenceSquaredDifference5bert/bert/encoder/layer_shared_3/attention/output/addPbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/StopGradient*(
_output_shapes
:??????????*
T0
?
^bert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/variance/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
?
Lbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/varianceMeanUbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/SquaredDifference^bert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/variance/reduction_indices*
	keep_dims(*'
_output_shapes
:?????????*
T0
?
Kbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add/yConst*
dtype0*
valueB
 *̼?+*
_output_shapes
: 
?
Ibert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/addAddLbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/varianceKbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add/y*'
_output_shapes
:?????????*
T0
?
Kbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/RsqrtRsqrtIbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add*
T0*'
_output_shapes
:?????????
?
Ibert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mulMulKbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/Rsqrt?bert/encoder/layer_shared/attention/output/LayerNorm/gamma/read*(
_output_shapes
:??????????*
T0
?
Kbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul_1Mul5bert/bert/encoder/layer_shared_3/attention/output/addIbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Kbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul_2MulHbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/meanIbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Ibert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/subSub>bert/encoder/layer_shared/attention/output/LayerNorm/beta/readKbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul_2*
T0*(
_output_shapes
:??????????
?
Kbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add_1AddKbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul_1Ibert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/sub*(
_output_shapes
:??????????*
T0
?
:bert/bert/encoder/layer_shared_3/intermediate/dense/MatMulMatMulKbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add_18bert/encoder/layer_shared/intermediate/dense/kernel/read*(
_output_shapes
:??????????	*
T0
?
;bert/bert/encoder/layer_shared_3/intermediate/dense/BiasAddBiasAdd:bert/bert/encoder/layer_shared_3/intermediate/dense/MatMul6bert/encoder/layer_shared/intermediate/dense/bias/read*(
_output_shapes
:??????????	*
T0
~
9bert/bert/encoder/layer_shared_3/intermediate/dense/Pow/yConst*
_output_shapes
: *
valueB
 *  @@*
dtype0
?
7bert/bert/encoder/layer_shared_3/intermediate/dense/PowPow;bert/bert/encoder/layer_shared_3/intermediate/dense/BiasAdd9bert/bert/encoder/layer_shared_3/intermediate/dense/Pow/y*
T0*(
_output_shapes
:??????????	
~
9bert/bert/encoder/layer_shared_3/intermediate/dense/mul/xConst*
dtype0*
_output_shapes
: *
valueB
 *'7=
?
7bert/bert/encoder/layer_shared_3/intermediate/dense/mulMul9bert/bert/encoder/layer_shared_3/intermediate/dense/mul/x7bert/bert/encoder/layer_shared_3/intermediate/dense/Pow*(
_output_shapes
:??????????	*
T0
?
7bert/bert/encoder/layer_shared_3/intermediate/dense/addAdd;bert/bert/encoder/layer_shared_3/intermediate/dense/BiasAdd7bert/bert/encoder/layer_shared_3/intermediate/dense/mul*
T0*(
_output_shapes
:??????????	
?
;bert/bert/encoder/layer_shared_3/intermediate/dense/mul_1/xConst*
dtype0*
valueB
 **BL?*
_output_shapes
: 
?
9bert/bert/encoder/layer_shared_3/intermediate/dense/mul_1Mul;bert/bert/encoder/layer_shared_3/intermediate/dense/mul_1/x7bert/bert/encoder/layer_shared_3/intermediate/dense/add*(
_output_shapes
:??????????	*
T0
?
8bert/bert/encoder/layer_shared_3/intermediate/dense/TanhTanh9bert/bert/encoder/layer_shared_3/intermediate/dense/mul_1*(
_output_shapes
:??????????	*
T0
?
;bert/bert/encoder/layer_shared_3/intermediate/dense/add_1/xConst*
valueB
 *  ??*
_output_shapes
: *
dtype0
?
9bert/bert/encoder/layer_shared_3/intermediate/dense/add_1Add;bert/bert/encoder/layer_shared_3/intermediate/dense/add_1/x8bert/bert/encoder/layer_shared_3/intermediate/dense/Tanh*
T0*(
_output_shapes
:??????????	
?
;bert/bert/encoder/layer_shared_3/intermediate/dense/mul_2/xConst*
dtype0*
valueB
 *   ?*
_output_shapes
: 
?
9bert/bert/encoder/layer_shared_3/intermediate/dense/mul_2Mul;bert/bert/encoder/layer_shared_3/intermediate/dense/mul_2/x9bert/bert/encoder/layer_shared_3/intermediate/dense/add_1*
T0*(
_output_shapes
:??????????	
?
9bert/bert/encoder/layer_shared_3/intermediate/dense/mul_3Mul;bert/bert/encoder/layer_shared_3/intermediate/dense/BiasAdd9bert/bert/encoder/layer_shared_3/intermediate/dense/mul_2*(
_output_shapes
:??????????	*
T0
?
4bert/bert/encoder/layer_shared_3/output/dense/MatMulMatMul9bert/bert/encoder/layer_shared_3/intermediate/dense/mul_32bert/encoder/layer_shared/output/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
5bert/bert/encoder/layer_shared_3/output/dense/BiasAddBiasAdd4bert/bert/encoder/layer_shared_3/output/dense/MatMul0bert/encoder/layer_shared/output/dense/bias/read*(
_output_shapes
:??????????*
T0
?
+bert/bert/encoder/layer_shared_3/output/addAdd5bert/bert/encoder/layer_shared_3/output/dense/BiasAddKbert/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add_1*(
_output_shapes
:??????????*
T0
?
Pbert/bert/encoder/layer_shared_3/output/LayerNorm/moments/mean/reduction_indicesConst*
valueB:*
_output_shapes
:*
dtype0
?
>bert/bert/encoder/layer_shared_3/output/LayerNorm/moments/meanMean+bert/bert/encoder/layer_shared_3/output/addPbert/bert/encoder/layer_shared_3/output/LayerNorm/moments/mean/reduction_indices*'
_output_shapes
:?????????*
T0*
	keep_dims(
?
Fbert/bert/encoder/layer_shared_3/output/LayerNorm/moments/StopGradientStopGradient>bert/bert/encoder/layer_shared_3/output/LayerNorm/moments/mean*'
_output_shapes
:?????????*
T0
?
Kbert/bert/encoder/layer_shared_3/output/LayerNorm/moments/SquaredDifferenceSquaredDifference+bert/bert/encoder/layer_shared_3/output/addFbert/bert/encoder/layer_shared_3/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
Tbert/bert/encoder/layer_shared_3/output/LayerNorm/moments/variance/reduction_indicesConst*
valueB:*
_output_shapes
:*
dtype0
?
Bbert/bert/encoder/layer_shared_3/output/LayerNorm/moments/varianceMeanKbert/bert/encoder/layer_shared_3/output/LayerNorm/moments/SquaredDifferenceTbert/bert/encoder/layer_shared_3/output/LayerNorm/moments/variance/reduction_indices*'
_output_shapes
:?????????*
	keep_dims(*
T0
?
Abert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/add/yConst*
dtype0*
valueB
 *̼?+*
_output_shapes
: 
?
?bert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/addAddBbert/bert/encoder/layer_shared_3/output/LayerNorm/moments/varianceAbert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/add/y*'
_output_shapes
:?????????*
T0
?
Abert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/RsqrtRsqrt?bert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/add*'
_output_shapes
:?????????*
T0
?
?bert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mulMulAbert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/Rsqrt5bert/encoder/layer_shared/output/LayerNorm/gamma/read*
T0*(
_output_shapes
:??????????
?
Abert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul_1Mul+bert/bert/encoder/layer_shared_3/output/add?bert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Abert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul_2Mul>bert/bert/encoder/layer_shared_3/output/LayerNorm/moments/mean?bert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
?bert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/subSub4bert/encoder/layer_shared/output/LayerNorm/beta/readAbert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul_2*(
_output_shapes
:??????????*
T0
?
Abert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/add_1AddAbert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul_1?bert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/sub*(
_output_shapes
:??????????*
T0
?
-bert/bert/encoder/layer_shared_3/output/add_1AddAbert/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/add_1?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
T0*(
_output_shapes
:??????????
?
-bert/bert/encoder/layer_shared_3/output/add_2Add-bert/bert/encoder/layer_shared_3/output/add_1-bert/bert/encoder/layer_shared_1/output/add_1*
T0*(
_output_shapes
:??????????
?
-bert/bert/encoder/layer_shared_3/output/add_3Add-bert/bert/encoder/layer_shared_3/output/add_2-bert/bert/encoder/layer_shared_2/output/add_2*
T0*(
_output_shapes
:??????????
?
bert/bert/encoder/Shape_3Shape?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
T0*
_output_shapes
:
q
'bert/bert/encoder/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB: 
s
)bert/bert/encoder/strided_slice_3/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
s
)bert/bert/encoder/strided_slice_3/stack_2Const*
valueB:*
_output_shapes
:*
dtype0
?
!bert/bert/encoder/strided_slice_3StridedSlicebert/bert/encoder/Shape_3'bert/bert/encoder/strided_slice_3/stack)bert/bert/encoder/strided_slice_3/stack_1)bert/bert/encoder/strided_slice_3/stack_2*
T0*
Index0*
shrink_axis_mask*
_output_shapes
: 
e
#bert/bert/encoder/Reshape_2/shape/1Const*
_output_shapes
: *
value	B :*
dtype0
f
#bert/bert/encoder/Reshape_2/shape/2Const*
_output_shapes
: *
value
B :?*
dtype0
?
!bert/bert/encoder/Reshape_2/shapePack!bert/bert/encoder/strided_slice_2#bert/bert/encoder/Reshape_2/shape/1#bert/bert/encoder/Reshape_2/shape/2*
_output_shapes
:*
N*
T0
?
bert/bert/encoder/Reshape_2Reshape?bert/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1!bert/bert/encoder/Reshape_2/shape*,
_output_shapes
:??????????*
T0
v
bert/bert/encoder/Shape_4Shape-bert/bert/encoder/layer_shared_1/output/add_1*
T0*
_output_shapes
:
q
'bert/bert/encoder/strided_slice_4/stackConst*
valueB: *
_output_shapes
:*
dtype0
s
)bert/bert/encoder/strided_slice_4/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
s
)bert/bert/encoder/strided_slice_4/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
!bert/bert/encoder/strided_slice_4StridedSlicebert/bert/encoder/Shape_4'bert/bert/encoder/strided_slice_4/stack)bert/bert/encoder/strided_slice_4/stack_1)bert/bert/encoder/strided_slice_4/stack_2*
_output_shapes
: *
T0*
shrink_axis_mask*
Index0
e
#bert/bert/encoder/Reshape_3/shape/1Const*
value	B :*
_output_shapes
: *
dtype0
f
#bert/bert/encoder/Reshape_3/shape/2Const*
_output_shapes
: *
value
B :?*
dtype0
?
!bert/bert/encoder/Reshape_3/shapePack!bert/bert/encoder/strided_slice_2#bert/bert/encoder/Reshape_3/shape/1#bert/bert/encoder/Reshape_3/shape/2*
T0*
N*
_output_shapes
:
?
bert/bert/encoder/Reshape_3Reshape-bert/bert/encoder/layer_shared_1/output/add_1!bert/bert/encoder/Reshape_3/shape*,
_output_shapes
:??????????*
T0
v
bert/bert/encoder/Shape_5Shape-bert/bert/encoder/layer_shared_2/output/add_2*
_output_shapes
:*
T0
q
'bert/bert/encoder/strided_slice_5/stackConst*
valueB: *
_output_shapes
:*
dtype0
s
)bert/bert/encoder/strided_slice_5/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
s
)bert/bert/encoder/strided_slice_5/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
!bert/bert/encoder/strided_slice_5StridedSlicebert/bert/encoder/Shape_5'bert/bert/encoder/strided_slice_5/stack)bert/bert/encoder/strided_slice_5/stack_1)bert/bert/encoder/strided_slice_5/stack_2*
_output_shapes
: *
shrink_axis_mask*
Index0*
T0
e
#bert/bert/encoder/Reshape_4/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
f
#bert/bert/encoder/Reshape_4/shape/2Const*
value
B :?*
dtype0*
_output_shapes
: 
?
!bert/bert/encoder/Reshape_4/shapePack!bert/bert/encoder/strided_slice_2#bert/bert/encoder/Reshape_4/shape/1#bert/bert/encoder/Reshape_4/shape/2*
N*
_output_shapes
:*
T0
?
bert/bert/encoder/Reshape_4Reshape-bert/bert/encoder/layer_shared_2/output/add_2!bert/bert/encoder/Reshape_4/shape*,
_output_shapes
:??????????*
T0
v
bert/bert/encoder/Shape_6Shape-bert/bert/encoder/layer_shared_3/output/add_3*
_output_shapes
:*
T0
q
'bert/bert/encoder/strided_slice_6/stackConst*
dtype0*
valueB: *
_output_shapes
:
s
)bert/bert/encoder/strided_slice_6/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
s
)bert/bert/encoder/strided_slice_6/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
!bert/bert/encoder/strided_slice_6StridedSlicebert/bert/encoder/Shape_6'bert/bert/encoder/strided_slice_6/stack)bert/bert/encoder/strided_slice_6/stack_1)bert/bert/encoder/strided_slice_6/stack_2*
T0*
_output_shapes
: *
shrink_axis_mask*
Index0
e
#bert/bert/encoder/Reshape_5/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
f
#bert/bert/encoder/Reshape_5/shape/2Const*
_output_shapes
: *
dtype0*
value
B :?
?
!bert/bert/encoder/Reshape_5/shapePack!bert/bert/encoder/strided_slice_2#bert/bert/encoder/Reshape_5/shape/1#bert/bert/encoder/Reshape_5/shape/2*
T0*
N*
_output_shapes
:
?
bert/bert/encoder/Reshape_5Reshape-bert/bert/encoder/layer_shared_3/output/add_3!bert/bert/encoder/Reshape_5/shape*,
_output_shapes
:??????????*
T0
y
$bert/bert/pooler/strided_slice/stackConst*
_output_shapes
:*
dtype0*!
valueB"            
{
&bert/bert/pooler/strided_slice/stack_1Const*
_output_shapes
:*!
valueB"           *
dtype0
{
&bert/bert/pooler/strided_slice/stack_2Const*
dtype0*!
valueB"         *
_output_shapes
:
?
bert/bert/pooler/strided_sliceStridedSlicebert/bert/encoder/Reshape_5$bert/bert/pooler/strided_slice/stack&bert/bert/pooler/strided_slice/stack_1&bert/bert/pooler/strided_slice/stack_2*
T0*
end_mask*,
_output_shapes
:??????????*
Index0*

begin_mask
?
bert/bert/pooler/SqueezeSqueezebert/bert/pooler/strided_slice*(
_output_shapes
:??????????*
T0*
squeeze_dims

?
;bert/pooler/dense/kernel/Initializer/truncated_normal/shapeConst*
valueB"8  8  *
_output_shapes
:*+
_class!
loc:@bert/pooler/dense/kernel*
dtype0
?
:bert/pooler/dense/kernel/Initializer/truncated_normal/meanConst*
dtype0*+
_class!
loc:@bert/pooler/dense/kernel*
valueB
 *    *
_output_shapes
: 
?
<bert/pooler/dense/kernel/Initializer/truncated_normal/stddevConst*+
_class!
loc:@bert/pooler/dense/kernel*
dtype0*
valueB
 *
ף<*
_output_shapes
: 
?
Ebert/pooler/dense/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal;bert/pooler/dense/kernel/Initializer/truncated_normal/shape*
T0*+
_class!
loc:@bert/pooler/dense/kernel*
dtype0* 
_output_shapes
:
??
?
9bert/pooler/dense/kernel/Initializer/truncated_normal/mulMulEbert/pooler/dense/kernel/Initializer/truncated_normal/TruncatedNormal<bert/pooler/dense/kernel/Initializer/truncated_normal/stddev* 
_output_shapes
:
??*+
_class!
loc:@bert/pooler/dense/kernel*
T0
?
5bert/pooler/dense/kernel/Initializer/truncated_normalAdd9bert/pooler/dense/kernel/Initializer/truncated_normal/mul:bert/pooler/dense/kernel/Initializer/truncated_normal/mean*+
_class!
loc:@bert/pooler/dense/kernel*
T0* 
_output_shapes
:
??
?
bert/pooler/dense/kernel
VariableV2* 
_output_shapes
:
??*
dtype0*+
_class!
loc:@bert/pooler/dense/kernel*
shape:
??
?
bert/pooler/dense/kernel/AssignAssignbert/pooler/dense/kernel5bert/pooler/dense/kernel/Initializer/truncated_normal*+
_class!
loc:@bert/pooler/dense/kernel* 
_output_shapes
:
??*
T0
?
bert/pooler/dense/kernel/readIdentitybert/pooler/dense/kernel* 
_output_shapes
:
??*+
_class!
loc:@bert/pooler/dense/kernel*
T0
?
(bert/pooler/dense/bias/Initializer/zerosConst*
dtype0*
valueB?*    *
_output_shapes	
:?*)
_class
loc:@bert/pooler/dense/bias
?
bert/pooler/dense/bias
VariableV2*
_output_shapes	
:?*
dtype0*
shape:?*)
_class
loc:@bert/pooler/dense/bias
?
bert/pooler/dense/bias/AssignAssignbert/pooler/dense/bias(bert/pooler/dense/bias/Initializer/zeros*)
_class
loc:@bert/pooler/dense/bias*
_output_shapes	
:?*
T0
?
bert/pooler/dense/bias/readIdentitybert/pooler/dense/bias*
T0*)
_class
loc:@bert/pooler/dense/bias*
_output_shapes	
:?
?
bert/bert/pooler/dense/MatMulMatMulbert/bert/pooler/Squeezebert/pooler/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
bert/bert/pooler/dense/BiasAddBiasAddbert/bert/pooler/dense/MatMulbert/pooler/dense/bias/read*
T0*(
_output_shapes
:??????????
v
bert/bert/pooler/dense/TanhTanhbert/bert/pooler/dense/BiasAdd*(
_output_shapes
:??????????*
T0
I
bert_1/ShapeShapeinput_ids_b_1*
T0*
_output_shapes
:
d
bert_1/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
f
bert_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
f
bert_1/strided_slice/stack_2Const*
valueB:*
_output_shapes
:*
dtype0
?
bert_1/strided_sliceStridedSlicebert_1/Shapebert_1/strided_slice/stackbert_1/strided_slice/stack_1bert_1/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
x
%bert_1/bert/embeddings/ExpandDims/dimConst*
_output_shapes
:*
dtype0*
valueB:
?????????
?
!bert_1/bert/embeddings/ExpandDims
ExpandDimsinput_ids_b_1%bert_1/bert/embeddings/ExpandDims/dim*
T0*+
_output_shapes
:?????????
w
$bert_1/bert/embeddings/Reshape/shapeConst*
valueB:
?????????*
dtype0*
_output_shapes
:
?
bert_1/bert/embeddings/ReshapeReshape!bert_1/bert/embeddings/ExpandDims$bert_1/bert/embeddings/Reshape/shape*
T0*#
_output_shapes
:?????????
f
$bert_1/bert/embeddings/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
?
bert_1/bert/embeddings/GatherV2GatherV2$bert/embeddings/word_embeddings/readbert_1/bert/embeddings/Reshape$bert_1/bert/embeddings/GatherV2/axis*(
_output_shapes
:??????????*
Tparams0*
Tindices0*
Taxis0
?
bert_1/bert/embeddings/MatMulMatMulbert_1/bert/embeddings/GatherV2&bert/embeddings/word_embeddings_2/read*(
_output_shapes
:??????????*
T0
m
bert_1/bert/embeddings/ShapeShape!bert_1/bert/embeddings/ExpandDims*
T0*
_output_shapes
:
t
*bert_1/bert/embeddings/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
v
,bert_1/bert/embeddings/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
v
,bert_1/bert/embeddings/strided_slice/stack_2Const*
valueB:*
_output_shapes
:*
dtype0
?
$bert_1/bert/embeddings/strided_sliceStridedSlicebert_1/bert/embeddings/Shape*bert_1/bert/embeddings/strided_slice/stack,bert_1/bert/embeddings/strided_slice/stack_1,bert_1/bert/embeddings/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
j
(bert_1/bert/embeddings/Reshape_1/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
k
(bert_1/bert/embeddings/Reshape_1/shape/2Const*
dtype0*
_output_shapes
: *
value
B :?
?
&bert_1/bert/embeddings/Reshape_1/shapePack$bert_1/bert/embeddings/strided_slice(bert_1/bert/embeddings/Reshape_1/shape/1(bert_1/bert/embeddings/Reshape_1/shape/2*
T0*
_output_shapes
:*
N
?
 bert_1/bert/embeddings/Reshape_1Reshapebert_1/bert/embeddings/MatMul&bert_1/bert/embeddings/Reshape_1/shape*
T0*,
_output_shapes
:??????????
n
bert_1/bert/embeddings/Shape_1Shape bert_1/bert/embeddings/Reshape_1*
T0*
_output_shapes
:
v
,bert_1/bert/embeddings/strided_slice_1/stackConst*
_output_shapes
:*
valueB: *
dtype0
x
.bert_1/bert/embeddings/strided_slice_1/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
x
.bert_1/bert/embeddings/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
?
&bert_1/bert/embeddings/strided_slice_1StridedSlicebert_1/bert/embeddings/Shape_1,bert_1/bert/embeddings/strided_slice_1/stack.bert_1/bert/embeddings/strided_slice_1/stack_1.bert_1/bert/embeddings/strided_slice_1/stack_2*
T0*
_output_shapes
: *
shrink_axis_mask*
Index0
y
&bert_1/bert/embeddings/Reshape_2/shapeConst*
dtype0*
_output_shapes
:*
valueB:
?????????
?
 bert_1/bert/embeddings/Reshape_2Reshapesegment_ids_b_1&bert_1/bert/embeddings/Reshape_2/shape*
T0*#
_output_shapes
:?????????
l
'bert_1/bert/embeddings/one_hot/on_valueConst*
_output_shapes
: *
dtype0*
valueB
 *  ??
m
(bert_1/bert/embeddings/one_hot/off_valueConst*
dtype0*
_output_shapes
: *
valueB
 *    
f
$bert_1/bert/embeddings/one_hot/depthConst*
value	B :*
_output_shapes
: *
dtype0
?
bert_1/bert/embeddings/one_hotOneHot bert_1/bert/embeddings/Reshape_2$bert_1/bert/embeddings/one_hot/depth'bert_1/bert/embeddings/one_hot/on_value(bert_1/bert/embeddings/one_hot/off_value*
T0*'
_output_shapes
:?????????*
TI0
?
bert_1/bert/embeddings/MatMul_1MatMulbert_1/bert/embeddings/one_hot*bert/embeddings/token_type_embeddings/read*(
_output_shapes
:??????????*
T0
j
(bert_1/bert/embeddings/Reshape_3/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
k
(bert_1/bert/embeddings/Reshape_3/shape/2Const*
value
B :?*
dtype0*
_output_shapes
: 
?
&bert_1/bert/embeddings/Reshape_3/shapePack&bert_1/bert/embeddings/strided_slice_1(bert_1/bert/embeddings/Reshape_3/shape/1(bert_1/bert/embeddings/Reshape_3/shape/2*
N*
_output_shapes
:*
T0
?
 bert_1/bert/embeddings/Reshape_3Reshapebert_1/bert/embeddings/MatMul_1&bert_1/bert/embeddings/Reshape_3/shape*
T0*,
_output_shapes
:??????????
?
bert_1/bert/embeddings/addAdd bert_1/bert/embeddings/Reshape_1 bert_1/bert/embeddings/Reshape_3*
T0*,
_output_shapes
:??????????
l
*bert_1/bert/embeddings/assert_less_equal/xConst*
dtype0*
value	B :*
_output_shapes
: 
m
*bert_1/bert/embeddings/assert_less_equal/yConst*
dtype0*
value
B :?*
_output_shapes
: 
?
2bert_1/bert/embeddings/assert_less_equal/LessEqual	LessEqual*bert_1/bert/embeddings/assert_less_equal/x*bert_1/bert/embeddings/assert_less_equal/y*
T0*
_output_shapes
: 
q
.bert_1/bert/embeddings/assert_less_equal/ConstConst*
_output_shapes
: *
dtype0*
valueB 
?
,bert_1/bert/embeddings/assert_less_equal/AllAll2bert_1/bert/embeddings/assert_less_equal/LessEqual.bert_1/bert/embeddings/assert_less_equal/Const*
_output_shapes
: 
v
5bert_1/bert/embeddings/assert_less_equal/Assert/ConstConst*
dtype0*
_output_shapes
: *
valueB B 
?
7bert_1/bert/embeddings/assert_less_equal/Assert/Const_1Const*
_output_shapes
: *
dtype0*o
valuefBd B^Condition x <= y did not hold element-wise:x (bert_1/bert/embeddings/assert_less_equal/x:0) = 
?
7bert_1/bert/embeddings/assert_less_equal/Assert/Const_2Const*
dtype0*D
value;B9 B3y (bert_1/bert/embeddings/assert_less_equal/y:0) = *
_output_shapes
: 
~
=bert_1/bert/embeddings/assert_less_equal/Assert/Assert/data_0Const*
valueB B *
_output_shapes
: *
dtype0
?
=bert_1/bert/embeddings/assert_less_equal/Assert/Assert/data_1Const*o
valuefBd B^Condition x <= y did not hold element-wise:x (bert_1/bert/embeddings/assert_less_equal/x:0) = *
_output_shapes
: *
dtype0
?
=bert_1/bert/embeddings/assert_less_equal/Assert/Assert/data_3Const*
_output_shapes
: *D
value;B9 B3y (bert_1/bert/embeddings/assert_less_equal/y:0) = *
dtype0
?
6bert_1/bert/embeddings/assert_less_equal/Assert/AssertAssert,bert_1/bert/embeddings/assert_less_equal/All=bert_1/bert/embeddings/assert_less_equal/Assert/Assert/data_0=bert_1/bert/embeddings/assert_less_equal/Assert/Assert/data_1*bert_1/bert/embeddings/assert_less_equal/x=bert_1/bert/embeddings/assert_less_equal/Assert/Assert/data_3*bert_1/bert/embeddings/assert_less_equal/y*
T	
2
?
"bert_1/bert/embeddings/Slice/beginConst7^bert_1/bert/embeddings/assert_less_equal/Assert/Assert*
dtype0*
_output_shapes
:*
valueB"        
?
!bert_1/bert/embeddings/Slice/sizeConst7^bert_1/bert/embeddings/assert_less_equal/Assert/Assert*
valueB"   ????*
_output_shapes
:*
dtype0
?
bert_1/bert/embeddings/SliceSlice(bert/embeddings/position_embeddings/read"bert_1/bert/embeddings/Slice/begin!bert_1/bert/embeddings/Slice/size*
_output_shapes
:	?*
Index0*
T0
?
&bert_1/bert/embeddings/Reshape_4/shapeConst7^bert_1/bert/embeddings/assert_less_equal/Assert/Assert*
dtype0*
_output_shapes
:*!
valueB"      8  
?
 bert_1/bert/embeddings/Reshape_4Reshapebert_1/bert/embeddings/Slice&bert_1/bert/embeddings/Reshape_4/shape*#
_output_shapes
:?*
T0
?
bert_1/bert/embeddings/add_1Addbert_1/bert/embeddings/add bert_1/bert/embeddings/Reshape_4*,
_output_shapes
:??????????*
T0
?
?bert_1/bert/embeddings/LayerNorm/moments/mean/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
?
-bert_1/bert/embeddings/LayerNorm/moments/meanMeanbert_1/bert/embeddings/add_1?bert_1/bert/embeddings/LayerNorm/moments/mean/reduction_indices*+
_output_shapes
:?????????*
	keep_dims(*
T0
?
5bert_1/bert/embeddings/LayerNorm/moments/StopGradientStopGradient-bert_1/bert/embeddings/LayerNorm/moments/mean*
T0*+
_output_shapes
:?????????
?
:bert_1/bert/embeddings/LayerNorm/moments/SquaredDifferenceSquaredDifferencebert_1/bert/embeddings/add_15bert_1/bert/embeddings/LayerNorm/moments/StopGradient*,
_output_shapes
:??????????*
T0
?
Cbert_1/bert/embeddings/LayerNorm/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
?
1bert_1/bert/embeddings/LayerNorm/moments/varianceMean:bert_1/bert/embeddings/LayerNorm/moments/SquaredDifferenceCbert_1/bert/embeddings/LayerNorm/moments/variance/reduction_indices*+
_output_shapes
:?????????*
T0*
	keep_dims(
u
0bert_1/bert/embeddings/LayerNorm/batchnorm/add/yConst*
valueB
 *̼?+*
_output_shapes
: *
dtype0
?
.bert_1/bert/embeddings/LayerNorm/batchnorm/addAdd1bert_1/bert/embeddings/LayerNorm/moments/variance0bert_1/bert/embeddings/LayerNorm/batchnorm/add/y*
T0*+
_output_shapes
:?????????
?
0bert_1/bert/embeddings/LayerNorm/batchnorm/RsqrtRsqrt.bert_1/bert/embeddings/LayerNorm/batchnorm/add*
T0*+
_output_shapes
:?????????
?
.bert_1/bert/embeddings/LayerNorm/batchnorm/mulMul0bert_1/bert/embeddings/LayerNorm/batchnorm/Rsqrt$bert/embeddings/LayerNorm/gamma/read*,
_output_shapes
:??????????*
T0
?
0bert_1/bert/embeddings/LayerNorm/batchnorm/mul_1Mulbert_1/bert/embeddings/add_1.bert_1/bert/embeddings/LayerNorm/batchnorm/mul*
T0*,
_output_shapes
:??????????
?
0bert_1/bert/embeddings/LayerNorm/batchnorm/mul_2Mul-bert_1/bert/embeddings/LayerNorm/moments/mean.bert_1/bert/embeddings/LayerNorm/batchnorm/mul*,
_output_shapes
:??????????*
T0
?
.bert_1/bert/embeddings/LayerNorm/batchnorm/subSub#bert/embeddings/LayerNorm/beta/read0bert_1/bert/embeddings/LayerNorm/batchnorm/mul_2*
T0*,
_output_shapes
:??????????
?
0bert_1/bert/embeddings/LayerNorm/batchnorm/add_1Add0bert_1/bert/embeddings/LayerNorm/batchnorm/mul_1.bert_1/bert/embeddings/LayerNorm/batchnorm/sub*
T0*,
_output_shapes
:??????????
V
bert_1/bert/encoder/ShapeShapeinput_ids_b_1*
T0*
_output_shapes
:
q
'bert_1/bert/encoder/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
s
)bert_1/bert/encoder/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
s
)bert_1/bert/encoder/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
?
!bert_1/bert/encoder/strided_sliceStridedSlicebert_1/bert/encoder/Shape'bert_1/bert/encoder/strided_slice/stack)bert_1/bert/encoder/strided_slice/stack_1)bert_1/bert/encoder/strided_slice/stack_2*
T0*
_output_shapes
: *
shrink_axis_mask*
Index0
Y
bert_1/bert/encoder/Shape_1Shapeinput_mask_b_1*
T0*
_output_shapes
:
s
)bert_1/bert/encoder/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 
u
+bert_1/bert/encoder/strided_slice_1/stack_1Const*
valueB:*
_output_shapes
:*
dtype0
u
+bert_1/bert/encoder/strided_slice_1/stack_2Const*
valueB:*
_output_shapes
:*
dtype0
?
#bert_1/bert/encoder/strided_slice_1StridedSlicebert_1/bert/encoder/Shape_1)bert_1/bert/encoder/strided_slice_1/stack+bert_1/bert/encoder/strided_slice_1/stack_1+bert_1/bert/encoder/strided_slice_1/stack_2*
Index0*
_output_shapes
: *
shrink_axis_mask*
T0
e
#bert_1/bert/encoder/Reshape/shape/1Const*
_output_shapes
: *
value	B :*
dtype0
e
#bert_1/bert/encoder/Reshape/shape/2Const*
_output_shapes
: *
value	B :*
dtype0
?
!bert_1/bert/encoder/Reshape/shapePack!bert_1/bert/encoder/strided_slice#bert_1/bert/encoder/Reshape/shape/1#bert_1/bert/encoder/Reshape/shape/2*
_output_shapes
:*
N*
T0
?
bert_1/bert/encoder/ReshapeReshapeinput_mask_b_1!bert_1/bert/encoder/Reshape/shape*
T0*+
_output_shapes
:?????????
?
bert_1/bert/encoder/CastCastbert_1/bert/encoder/Reshape*+
_output_shapes
:?????????*

DstT0*

SrcT0
`
bert_1/bert/encoder/ones/mul/yConst*
value	B :*
_output_shapes
: *
dtype0
?
bert_1/bert/encoder/ones/mulMul!bert_1/bert/encoder/strided_slicebert_1/bert/encoder/ones/mul/y*
_output_shapes
: *
T0
b
 bert_1/bert/encoder/ones/mul_1/yConst*
value	B :*
_output_shapes
: *
dtype0
?
bert_1/bert/encoder/ones/mul_1Mulbert_1/bert/encoder/ones/mul bert_1/bert/encoder/ones/mul_1/y*
T0*
_output_shapes
: 
b
bert_1/bert/encoder/ones/Less/yConst*
_output_shapes
: *
value
B :?*
dtype0
?
bert_1/bert/encoder/ones/LessLessbert_1/bert/encoder/ones/mul_1bert_1/bert/encoder/ones/Less/y*
T0*
_output_shapes
: 
c
!bert_1/bert/encoder/ones/packed/1Const*
_output_shapes
: *
dtype0*
value	B :
c
!bert_1/bert/encoder/ones/packed/2Const*
dtype0*
value	B :*
_output_shapes
: 
?
bert_1/bert/encoder/ones/packedPack!bert_1/bert/encoder/strided_slice!bert_1/bert/encoder/ones/packed/1!bert_1/bert/encoder/ones/packed/2*
_output_shapes
:*
T0*
N
c
bert_1/bert/encoder/ones/ConstConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
bert_1/bert/encoder/onesFillbert_1/bert/encoder/ones/packedbert_1/bert/encoder/ones/Const*+
_output_shapes
:?????????*
T0
?
bert_1/bert/encoder/mulMulbert_1/bert/encoder/onesbert_1/bert/encoder/Cast*+
_output_shapes
:?????????*
T0
{
bert_1/bert/encoder/Shape_2Shape0bert_1/bert/embeddings/LayerNorm/batchnorm/add_1*
_output_shapes
:*
T0
s
)bert_1/bert/encoder/strided_slice_2/stackConst*
dtype0*
_output_shapes
:*
valueB: 
u
+bert_1/bert/encoder/strided_slice_2/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
u
+bert_1/bert/encoder/strided_slice_2/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
#bert_1/bert/encoder/strided_slice_2StridedSlicebert_1/bert/encoder/Shape_2)bert_1/bert/encoder/strided_slice_2/stack+bert_1/bert/encoder/strided_slice_2/stack_1+bert_1/bert/encoder/strided_slice_2/stack_2*
shrink_axis_mask*
T0*
Index0*
_output_shapes
: 
t
#bert_1/bert/encoder/Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"????8  
?
bert_1/bert/encoder/Reshape_1Reshape0bert_1/bert/embeddings/LayerNorm/batchnorm/add_1#bert_1/bert/encoder/Reshape_1/shape*
T0*(
_output_shapes
:??????????
?
5bert_1/bert/encoder/layer_shared/attention/self/ShapeShapebert_1/bert/encoder/Reshape_1*
_output_shapes
:*
T0
?
Cbert_1/bert/encoder/layer_shared/attention/self/strided_slice/stackConst*
_output_shapes
:*
valueB: *
dtype0
?
Ebert_1/bert/encoder/layer_shared/attention/self/strided_slice/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
?
Ebert_1/bert/encoder/layer_shared/attention/self/strided_slice/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
?
=bert_1/bert/encoder/layer_shared/attention/self/strided_sliceStridedSlice5bert_1/bert/encoder/layer_shared/attention/self/ShapeCbert_1/bert/encoder/layer_shared/attention/self/strided_slice/stackEbert_1/bert/encoder/layer_shared/attention/self/strided_slice/stack_1Ebert_1/bert/encoder/layer_shared/attention/self/strided_slice/stack_2*
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
?
7bert_1/bert/encoder/layer_shared/attention/self/Shape_1Shapebert_1/bert/encoder/Reshape_1*
_output_shapes
:*
T0
?
Ebert_1/bert/encoder/layer_shared/attention/self/strided_slice_1/stackConst*
dtype0*
valueB: *
_output_shapes
:
?
Gbert_1/bert/encoder/layer_shared/attention/self/strided_slice_1/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
?
Gbert_1/bert/encoder/layer_shared/attention/self/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
?
?bert_1/bert/encoder/layer_shared/attention/self/strided_slice_1StridedSlice7bert_1/bert/encoder/layer_shared/attention/self/Shape_1Ebert_1/bert/encoder/layer_shared/attention/self/strided_slice_1/stackGbert_1/bert/encoder/layer_shared/attention/self/strided_slice_1/stack_1Gbert_1/bert/encoder/layer_shared/attention/self/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
?
<bert_1/bert/encoder/layer_shared/attention/self/query/MatMulMatMulbert_1/bert/encoder/Reshape_1:bert/encoder/layer_shared/attention/self/query/kernel/read*(
_output_shapes
:??????????*
T0
?
=bert_1/bert/encoder/layer_shared/attention/self/query/BiasAddBiasAdd<bert_1/bert/encoder/layer_shared/attention/self/query/MatMul8bert/encoder/layer_shared/attention/self/query/bias/read*
T0*(
_output_shapes
:??????????
?
:bert_1/bert/encoder/layer_shared/attention/self/key/MatMulMatMulbert_1/bert/encoder/Reshape_18bert/encoder/layer_shared/attention/self/key/kernel/read*(
_output_shapes
:??????????*
T0
?
;bert_1/bert/encoder/layer_shared/attention/self/key/BiasAddBiasAdd:bert_1/bert/encoder/layer_shared/attention/self/key/MatMul6bert/encoder/layer_shared/attention/self/key/bias/read*
T0*(
_output_shapes
:??????????
?
<bert_1/bert/encoder/layer_shared/attention/self/value/MatMulMatMulbert_1/bert/encoder/Reshape_1:bert/encoder/layer_shared/attention/self/value/kernel/read*(
_output_shapes
:??????????*
T0
?
=bert_1/bert/encoder/layer_shared/attention/self/value/BiasAddBiasAdd<bert_1/bert/encoder/layer_shared/attention/self/value/MatMul8bert/encoder/layer_shared/attention/self/value/bias/read*
T0*(
_output_shapes
:??????????
?
?bert_1/bert/encoder/layer_shared/attention/self/Reshape/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
?
?bert_1/bert/encoder/layer_shared/attention/self/Reshape/shape/2Const*
dtype0*
_output_shapes
: *
value	B :
?
?bert_1/bert/encoder/layer_shared/attention/self/Reshape/shape/3Const*
_output_shapes
: *
value	B :*
dtype0
?
=bert_1/bert/encoder/layer_shared/attention/self/Reshape/shapePack#bert_1/bert/encoder/strided_slice_2?bert_1/bert/encoder/layer_shared/attention/self/Reshape/shape/1?bert_1/bert/encoder/layer_shared/attention/self/Reshape/shape/2?bert_1/bert/encoder/layer_shared/attention/self/Reshape/shape/3*
T0*
_output_shapes
:*
N
?
7bert_1/bert/encoder/layer_shared/attention/self/ReshapeReshape=bert_1/bert/encoder/layer_shared/attention/self/query/BiasAdd=bert_1/bert/encoder/layer_shared/attention/self/Reshape/shape*/
_output_shapes
:?????????*
T0
?
>bert_1/bert/encoder/layer_shared/attention/self/transpose/permConst*
dtype0*%
valueB"             *
_output_shapes
:
?
9bert_1/bert/encoder/layer_shared/attention/self/transpose	Transpose7bert_1/bert/encoder/layer_shared/attention/self/Reshape>bert_1/bert/encoder/layer_shared/attention/self/transpose/perm*/
_output_shapes
:?????????*
T0
?
Abert_1/bert/encoder/layer_shared/attention/self/Reshape_1/shape/1Const*
value	B :*
_output_shapes
: *
dtype0
?
Abert_1/bert/encoder/layer_shared/attention/self/Reshape_1/shape/2Const*
value	B :*
_output_shapes
: *
dtype0
?
Abert_1/bert/encoder/layer_shared/attention/self/Reshape_1/shape/3Const*
dtype0*
_output_shapes
: *
value	B :
?
?bert_1/bert/encoder/layer_shared/attention/self/Reshape_1/shapePack#bert_1/bert/encoder/strided_slice_2Abert_1/bert/encoder/layer_shared/attention/self/Reshape_1/shape/1Abert_1/bert/encoder/layer_shared/attention/self/Reshape_1/shape/2Abert_1/bert/encoder/layer_shared/attention/self/Reshape_1/shape/3*
T0*
N*
_output_shapes
:
?
9bert_1/bert/encoder/layer_shared/attention/self/Reshape_1Reshape;bert_1/bert/encoder/layer_shared/attention/self/key/BiasAdd?bert_1/bert/encoder/layer_shared/attention/self/Reshape_1/shape*
T0*/
_output_shapes
:?????????
?
@bert_1/bert/encoder/layer_shared/attention/self/transpose_1/permConst*%
valueB"             *
_output_shapes
:*
dtype0
?
;bert_1/bert/encoder/layer_shared/attention/self/transpose_1	Transpose9bert_1/bert/encoder/layer_shared/attention/self/Reshape_1@bert_1/bert/encoder/layer_shared/attention/self/transpose_1/perm*/
_output_shapes
:?????????*
T0
?
6bert_1/bert/encoder/layer_shared/attention/self/MatMulBatchMatMul9bert_1/bert/encoder/layer_shared/attention/self/transpose;bert_1/bert/encoder/layer_shared/attention/self/transpose_1*
T0*
adj_y(*/
_output_shapes
:?????????
z
5bert_1/bert/encoder/layer_shared/attention/self/Mul/yConst*
_output_shapes
: *
valueB
 *??H>*
dtype0
?
3bert_1/bert/encoder/layer_shared/attention/self/MulMul6bert_1/bert/encoder/layer_shared/attention/self/MatMul5bert_1/bert/encoder/layer_shared/attention/self/Mul/y*/
_output_shapes
:?????????*
T0
?
>bert_1/bert/encoder/layer_shared/attention/self/ExpandDims/dimConst*
_output_shapes
:*
valueB:*
dtype0
?
:bert_1/bert/encoder/layer_shared/attention/self/ExpandDims
ExpandDimsbert_1/bert/encoder/mul>bert_1/bert/encoder/layer_shared/attention/self/ExpandDims/dim*/
_output_shapes
:?????????*
T0
z
5bert_1/bert/encoder/layer_shared/attention/self/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ??
?
3bert_1/bert/encoder/layer_shared/attention/self/subSub5bert_1/bert/encoder/layer_shared/attention/self/sub/x:bert_1/bert/encoder/layer_shared/attention/self/ExpandDims*/
_output_shapes
:?????????*
T0
|
7bert_1/bert/encoder/layer_shared/attention/self/mul_1/yConst*
valueB
 * @?*
_output_shapes
: *
dtype0
?
5bert_1/bert/encoder/layer_shared/attention/self/mul_1Mul3bert_1/bert/encoder/layer_shared/attention/self/sub7bert_1/bert/encoder/layer_shared/attention/self/mul_1/y*/
_output_shapes
:?????????*
T0
?
3bert_1/bert/encoder/layer_shared/attention/self/addAdd3bert_1/bert/encoder/layer_shared/attention/self/Mul5bert_1/bert/encoder/layer_shared/attention/self/mul_1*/
_output_shapes
:?????????*
T0
?
7bert_1/bert/encoder/layer_shared/attention/self/SoftmaxSoftmax3bert_1/bert/encoder/layer_shared/attention/self/add*
T0*/
_output_shapes
:?????????
?
Abert_1/bert/encoder/layer_shared/attention/self/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
?
Abert_1/bert/encoder/layer_shared/attention/self/Reshape_2/shape/2Const*
value	B :*
_output_shapes
: *
dtype0
?
Abert_1/bert/encoder/layer_shared/attention/self/Reshape_2/shape/3Const*
dtype0*
_output_shapes
: *
value	B :
?
?bert_1/bert/encoder/layer_shared/attention/self/Reshape_2/shapePack#bert_1/bert/encoder/strided_slice_2Abert_1/bert/encoder/layer_shared/attention/self/Reshape_2/shape/1Abert_1/bert/encoder/layer_shared/attention/self/Reshape_2/shape/2Abert_1/bert/encoder/layer_shared/attention/self/Reshape_2/shape/3*
T0*
_output_shapes
:*
N
?
9bert_1/bert/encoder/layer_shared/attention/self/Reshape_2Reshape=bert_1/bert/encoder/layer_shared/attention/self/value/BiasAdd?bert_1/bert/encoder/layer_shared/attention/self/Reshape_2/shape*
T0*/
_output_shapes
:?????????
?
@bert_1/bert/encoder/layer_shared/attention/self/transpose_2/permConst*%
valueB"             *
dtype0*
_output_shapes
:
?
;bert_1/bert/encoder/layer_shared/attention/self/transpose_2	Transpose9bert_1/bert/encoder/layer_shared/attention/self/Reshape_2@bert_1/bert/encoder/layer_shared/attention/self/transpose_2/perm*/
_output_shapes
:?????????*
T0
?
8bert_1/bert/encoder/layer_shared/attention/self/MatMul_1BatchMatMul7bert_1/bert/encoder/layer_shared/attention/self/Softmax;bert_1/bert/encoder/layer_shared/attention/self/transpose_2*/
_output_shapes
:?????????*
T0
?
@bert_1/bert/encoder/layer_shared/attention/self/transpose_3/permConst*%
valueB"             *
dtype0*
_output_shapes
:
?
;bert_1/bert/encoder/layer_shared/attention/self/transpose_3	Transpose8bert_1/bert/encoder/layer_shared/attention/self/MatMul_1@bert_1/bert/encoder/layer_shared/attention/self/transpose_3/perm*/
_output_shapes
:?????????*
T0
y
7bert_1/bert/encoder/layer_shared/attention/self/mul_2/yConst*
value	B :*
_output_shapes
: *
dtype0
?
5bert_1/bert/encoder/layer_shared/attention/self/mul_2Mul#bert_1/bert/encoder/strided_slice_27bert_1/bert/encoder/layer_shared/attention/self/mul_2/y*
_output_shapes
: *
T0
?
Abert_1/bert/encoder/layer_shared/attention/self/Reshape_3/shape/1Const*
value
B :?*
_output_shapes
: *
dtype0
?
?bert_1/bert/encoder/layer_shared/attention/self/Reshape_3/shapePack5bert_1/bert/encoder/layer_shared/attention/self/mul_2Abert_1/bert/encoder/layer_shared/attention/self/Reshape_3/shape/1*
N*
T0*
_output_shapes
:
?
9bert_1/bert/encoder/layer_shared/attention/self/Reshape_3Reshape;bert_1/bert/encoder/layer_shared/attention/self/transpose_3?bert_1/bert/encoder/layer_shared/attention/self/Reshape_3/shape*(
_output_shapes
:??????????*
T0
?
>bert_1/bert/encoder/layer_shared/attention/output/dense/MatMulMatMul9bert_1/bert/encoder/layer_shared/attention/self/Reshape_3<bert/encoder/layer_shared/attention/output/dense/kernel/read*(
_output_shapes
:??????????*
T0
?
?bert_1/bert/encoder/layer_shared/attention/output/dense/BiasAddBiasAdd>bert_1/bert/encoder/layer_shared/attention/output/dense/MatMul:bert/encoder/layer_shared/attention/output/dense/bias/read*
T0*(
_output_shapes
:??????????
?
5bert_1/bert/encoder/layer_shared/attention/output/addAdd?bert_1/bert/encoder/layer_shared/attention/output/dense/BiasAddbert_1/bert/encoder/Reshape_1*
T0*(
_output_shapes
:??????????
?
Zbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/mean/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
?
Hbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/meanMean5bert_1/bert/encoder/layer_shared/attention/output/addZbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/mean/reduction_indices*
T0*'
_output_shapes
:?????????*
	keep_dims(
?
Pbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/StopGradientStopGradientHbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/mean*'
_output_shapes
:?????????*
T0
?
Ubert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/SquaredDifferenceSquaredDifference5bert_1/bert/encoder/layer_shared/attention/output/addPbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/StopGradient*(
_output_shapes
:??????????*
T0
?
^bert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
?
Lbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/varianceMeanUbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/SquaredDifference^bert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/variance/reduction_indices*
	keep_dims(*
T0*'
_output_shapes
:?????????
?
Kbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add/yConst*
dtype0*
valueB
 *̼?+*
_output_shapes
: 
?
Ibert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/addAddLbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/varianceKbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add/y*'
_output_shapes
:?????????*
T0
?
Kbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/RsqrtRsqrtIbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add*'
_output_shapes
:?????????*
T0
?
Ibert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mulMulKbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/Rsqrt?bert/encoder/layer_shared/attention/output/LayerNorm/gamma/read*(
_output_shapes
:??????????*
T0
?
Kbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul_1Mul5bert_1/bert/encoder/layer_shared/attention/output/addIbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Kbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul_2MulHbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/moments/meanIbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Ibert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/subSub>bert/encoder/layer_shared/attention/output/LayerNorm/beta/readKbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul_2*
T0*(
_output_shapes
:??????????
?
Kbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add_1AddKbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/mul_1Ibert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/sub*
T0*(
_output_shapes
:??????????
?
:bert_1/bert/encoder/layer_shared/intermediate/dense/MatMulMatMulKbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add_18bert/encoder/layer_shared/intermediate/dense/kernel/read*(
_output_shapes
:??????????	*
T0
?
;bert_1/bert/encoder/layer_shared/intermediate/dense/BiasAddBiasAdd:bert_1/bert/encoder/layer_shared/intermediate/dense/MatMul6bert/encoder/layer_shared/intermediate/dense/bias/read*(
_output_shapes
:??????????	*
T0
~
9bert_1/bert/encoder/layer_shared/intermediate/dense/Pow/yConst*
valueB
 *  @@*
dtype0*
_output_shapes
: 
?
7bert_1/bert/encoder/layer_shared/intermediate/dense/PowPow;bert_1/bert/encoder/layer_shared/intermediate/dense/BiasAdd9bert_1/bert/encoder/layer_shared/intermediate/dense/Pow/y*
T0*(
_output_shapes
:??????????	
~
9bert_1/bert/encoder/layer_shared/intermediate/dense/mul/xConst*
valueB
 *'7=*
_output_shapes
: *
dtype0
?
7bert_1/bert/encoder/layer_shared/intermediate/dense/mulMul9bert_1/bert/encoder/layer_shared/intermediate/dense/mul/x7bert_1/bert/encoder/layer_shared/intermediate/dense/Pow*
T0*(
_output_shapes
:??????????	
?
7bert_1/bert/encoder/layer_shared/intermediate/dense/addAdd;bert_1/bert/encoder/layer_shared/intermediate/dense/BiasAdd7bert_1/bert/encoder/layer_shared/intermediate/dense/mul*(
_output_shapes
:??????????	*
T0
?
;bert_1/bert/encoder/layer_shared/intermediate/dense/mul_1/xConst*
_output_shapes
: *
valueB
 **BL?*
dtype0
?
9bert_1/bert/encoder/layer_shared/intermediate/dense/mul_1Mul;bert_1/bert/encoder/layer_shared/intermediate/dense/mul_1/x7bert_1/bert/encoder/layer_shared/intermediate/dense/add*
T0*(
_output_shapes
:??????????	
?
8bert_1/bert/encoder/layer_shared/intermediate/dense/TanhTanh9bert_1/bert/encoder/layer_shared/intermediate/dense/mul_1*
T0*(
_output_shapes
:??????????	
?
;bert_1/bert/encoder/layer_shared/intermediate/dense/add_1/xConst*
valueB
 *  ??*
_output_shapes
: *
dtype0
?
9bert_1/bert/encoder/layer_shared/intermediate/dense/add_1Add;bert_1/bert/encoder/layer_shared/intermediate/dense/add_1/x8bert_1/bert/encoder/layer_shared/intermediate/dense/Tanh*
T0*(
_output_shapes
:??????????	
?
;bert_1/bert/encoder/layer_shared/intermediate/dense/mul_2/xConst*
valueB
 *   ?*
_output_shapes
: *
dtype0
?
9bert_1/bert/encoder/layer_shared/intermediate/dense/mul_2Mul;bert_1/bert/encoder/layer_shared/intermediate/dense/mul_2/x9bert_1/bert/encoder/layer_shared/intermediate/dense/add_1*
T0*(
_output_shapes
:??????????	
?
9bert_1/bert/encoder/layer_shared/intermediate/dense/mul_3Mul;bert_1/bert/encoder/layer_shared/intermediate/dense/BiasAdd9bert_1/bert/encoder/layer_shared/intermediate/dense/mul_2*(
_output_shapes
:??????????	*
T0
?
4bert_1/bert/encoder/layer_shared/output/dense/MatMulMatMul9bert_1/bert/encoder/layer_shared/intermediate/dense/mul_32bert/encoder/layer_shared/output/dense/kernel/read*(
_output_shapes
:??????????*
T0
?
5bert_1/bert/encoder/layer_shared/output/dense/BiasAddBiasAdd4bert_1/bert/encoder/layer_shared/output/dense/MatMul0bert/encoder/layer_shared/output/dense/bias/read*
T0*(
_output_shapes
:??????????
?
+bert_1/bert/encoder/layer_shared/output/addAdd5bert_1/bert/encoder/layer_shared/output/dense/BiasAddKbert_1/bert/encoder/layer_shared/attention/output/LayerNorm/batchnorm/add_1*(
_output_shapes
:??????????*
T0
?
Pbert_1/bert/encoder/layer_shared/output/LayerNorm/moments/mean/reduction_indicesConst*
valueB:*
_output_shapes
:*
dtype0
?
>bert_1/bert/encoder/layer_shared/output/LayerNorm/moments/meanMean+bert_1/bert/encoder/layer_shared/output/addPbert_1/bert/encoder/layer_shared/output/LayerNorm/moments/mean/reduction_indices*'
_output_shapes
:?????????*
	keep_dims(*
T0
?
Fbert_1/bert/encoder/layer_shared/output/LayerNorm/moments/StopGradientStopGradient>bert_1/bert/encoder/layer_shared/output/LayerNorm/moments/mean*
T0*'
_output_shapes
:?????????
?
Kbert_1/bert/encoder/layer_shared/output/LayerNorm/moments/SquaredDifferenceSquaredDifference+bert_1/bert/encoder/layer_shared/output/addFbert_1/bert/encoder/layer_shared/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
Tbert_1/bert/encoder/layer_shared/output/LayerNorm/moments/variance/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
?
Bbert_1/bert/encoder/layer_shared/output/LayerNorm/moments/varianceMeanKbert_1/bert/encoder/layer_shared/output/LayerNorm/moments/SquaredDifferenceTbert_1/bert/encoder/layer_shared/output/LayerNorm/moments/variance/reduction_indices*
T0*
	keep_dims(*'
_output_shapes
:?????????
?
Abert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add/yConst*
_output_shapes
: *
valueB
 *̼?+*
dtype0
?
?bert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/addAddBbert_1/bert/encoder/layer_shared/output/LayerNorm/moments/varianceAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add/y*'
_output_shapes
:?????????*
T0
?
Abert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/RsqrtRsqrt?bert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add*
T0*'
_output_shapes
:?????????
?
?bert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mulMulAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/Rsqrt5bert/encoder/layer_shared/output/LayerNorm/gamma/read*
T0*(
_output_shapes
:??????????
?
Abert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul_1Mul+bert_1/bert/encoder/layer_shared/output/add?bert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Abert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul_2Mul>bert_1/bert/encoder/layer_shared/output/LayerNorm/moments/mean?bert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
?bert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/subSub4bert/encoder/layer_shared/output/LayerNorm/beta/readAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul_2*
T0*(
_output_shapes
:??????????
?
Abert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1AddAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/mul_1?bert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/sub*
T0*(
_output_shapes
:??????????
?
7bert_1/bert/encoder/layer_shared_1/attention/self/ShapeShapeAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
_output_shapes
:*
T0
?
Ebert_1/bert/encoder/layer_shared_1/attention/self/strided_slice/stackConst*
valueB: *
_output_shapes
:*
dtype0
?
Gbert_1/bert/encoder/layer_shared_1/attention/self/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
?
Gbert_1/bert/encoder/layer_shared_1/attention/self/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
?
?bert_1/bert/encoder/layer_shared_1/attention/self/strided_sliceStridedSlice7bert_1/bert/encoder/layer_shared_1/attention/self/ShapeEbert_1/bert/encoder/layer_shared_1/attention/self/strided_slice/stackGbert_1/bert/encoder/layer_shared_1/attention/self/strided_slice/stack_1Gbert_1/bert/encoder/layer_shared_1/attention/self/strided_slice/stack_2*
_output_shapes
: *
shrink_axis_mask*
T0*
Index0
?
9bert_1/bert/encoder/layer_shared_1/attention/self/Shape_1ShapeAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
T0*
_output_shapes
:
?
Gbert_1/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stackConst*
dtype0*
valueB: *
_output_shapes
:
?
Ibert_1/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stack_1Const*
valueB:*
_output_shapes
:*
dtype0
?
Ibert_1/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
Abert_1/bert/encoder/layer_shared_1/attention/self/strided_slice_1StridedSlice9bert_1/bert/encoder/layer_shared_1/attention/self/Shape_1Gbert_1/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stackIbert_1/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stack_1Ibert_1/bert/encoder/layer_shared_1/attention/self/strided_slice_1/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
?
>bert_1/bert/encoder/layer_shared_1/attention/self/query/MatMulMatMulAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1:bert/encoder/layer_shared/attention/self/query/kernel/read*(
_output_shapes
:??????????*
T0
?
?bert_1/bert/encoder/layer_shared_1/attention/self/query/BiasAddBiasAdd>bert_1/bert/encoder/layer_shared_1/attention/self/query/MatMul8bert/encoder/layer_shared/attention/self/query/bias/read*(
_output_shapes
:??????????*
T0
?
<bert_1/bert/encoder/layer_shared_1/attention/self/key/MatMulMatMulAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_18bert/encoder/layer_shared/attention/self/key/kernel/read*(
_output_shapes
:??????????*
T0
?
=bert_1/bert/encoder/layer_shared_1/attention/self/key/BiasAddBiasAdd<bert_1/bert/encoder/layer_shared_1/attention/self/key/MatMul6bert/encoder/layer_shared/attention/self/key/bias/read*
T0*(
_output_shapes
:??????????
?
>bert_1/bert/encoder/layer_shared_1/attention/self/value/MatMulMatMulAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1:bert/encoder/layer_shared/attention/self/value/kernel/read*
T0*(
_output_shapes
:??????????
?
?bert_1/bert/encoder/layer_shared_1/attention/self/value/BiasAddBiasAdd>bert_1/bert/encoder/layer_shared_1/attention/self/value/MatMul8bert/encoder/layer_shared/attention/self/value/bias/read*
T0*(
_output_shapes
:??????????
?
Abert_1/bert/encoder/layer_shared_1/attention/self/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Abert_1/bert/encoder/layer_shared_1/attention/self/Reshape/shape/2Const*
value	B :*
_output_shapes
: *
dtype0
?
Abert_1/bert/encoder/layer_shared_1/attention/self/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
?
?bert_1/bert/encoder/layer_shared_1/attention/self/Reshape/shapePack#bert_1/bert/encoder/strided_slice_2Abert_1/bert/encoder/layer_shared_1/attention/self/Reshape/shape/1Abert_1/bert/encoder/layer_shared_1/attention/self/Reshape/shape/2Abert_1/bert/encoder/layer_shared_1/attention/self/Reshape/shape/3*
_output_shapes
:*
N*
T0
?
9bert_1/bert/encoder/layer_shared_1/attention/self/ReshapeReshape?bert_1/bert/encoder/layer_shared_1/attention/self/query/BiasAdd?bert_1/bert/encoder/layer_shared_1/attention/self/Reshape/shape*
T0*/
_output_shapes
:?????????
?
@bert_1/bert/encoder/layer_shared_1/attention/self/transpose/permConst*
dtype0*%
valueB"             *
_output_shapes
:
?
;bert_1/bert/encoder/layer_shared_1/attention/self/transpose	Transpose9bert_1/bert/encoder/layer_shared_1/attention/self/Reshape@bert_1/bert/encoder/layer_shared_1/attention/self/transpose/perm*/
_output_shapes
:?????????*
T0
?
Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
?
Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/2Const*
value	B :*
_output_shapes
: *
dtype0
?
Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
?
Abert_1/bert/encoder/layer_shared_1/attention/self/Reshape_1/shapePack#bert_1/bert/encoder/strided_slice_2Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/1Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/2Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape/3*
N*
_output_shapes
:*
T0
?
;bert_1/bert/encoder/layer_shared_1/attention/self/Reshape_1Reshape=bert_1/bert/encoder/layer_shared_1/attention/self/key/BiasAddAbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_1/shape*/
_output_shapes
:?????????*
T0
?
Bbert_1/bert/encoder/layer_shared_1/attention/self/transpose_1/permConst*%
valueB"             *
_output_shapes
:*
dtype0
?
=bert_1/bert/encoder/layer_shared_1/attention/self/transpose_1	Transpose;bert_1/bert/encoder/layer_shared_1/attention/self/Reshape_1Bbert_1/bert/encoder/layer_shared_1/attention/self/transpose_1/perm*/
_output_shapes
:?????????*
T0
?
8bert_1/bert/encoder/layer_shared_1/attention/self/MatMulBatchMatMul;bert_1/bert/encoder/layer_shared_1/attention/self/transpose=bert_1/bert/encoder/layer_shared_1/attention/self/transpose_1*
adj_y(*/
_output_shapes
:?????????*
T0
|
7bert_1/bert/encoder/layer_shared_1/attention/self/Mul/yConst*
dtype0*
valueB
 *??H>*
_output_shapes
: 
?
5bert_1/bert/encoder/layer_shared_1/attention/self/MulMul8bert_1/bert/encoder/layer_shared_1/attention/self/MatMul7bert_1/bert/encoder/layer_shared_1/attention/self/Mul/y*/
_output_shapes
:?????????*
T0
?
@bert_1/bert/encoder/layer_shared_1/attention/self/ExpandDims/dimConst*
_output_shapes
:*
dtype0*
valueB:
?
<bert_1/bert/encoder/layer_shared_1/attention/self/ExpandDims
ExpandDimsbert_1/bert/encoder/mul@bert_1/bert/encoder/layer_shared_1/attention/self/ExpandDims/dim*
T0*/
_output_shapes
:?????????
|
7bert_1/bert/encoder/layer_shared_1/attention/self/sub/xConst*
valueB
 *  ??*
_output_shapes
: *
dtype0
?
5bert_1/bert/encoder/layer_shared_1/attention/self/subSub7bert_1/bert/encoder/layer_shared_1/attention/self/sub/x<bert_1/bert/encoder/layer_shared_1/attention/self/ExpandDims*/
_output_shapes
:?????????*
T0
~
9bert_1/bert/encoder/layer_shared_1/attention/self/mul_1/yConst*
dtype0*
_output_shapes
: *
valueB
 * @?
?
7bert_1/bert/encoder/layer_shared_1/attention/self/mul_1Mul5bert_1/bert/encoder/layer_shared_1/attention/self/sub9bert_1/bert/encoder/layer_shared_1/attention/self/mul_1/y*/
_output_shapes
:?????????*
T0
?
5bert_1/bert/encoder/layer_shared_1/attention/self/addAdd5bert_1/bert/encoder/layer_shared_1/attention/self/Mul7bert_1/bert/encoder/layer_shared_1/attention/self/mul_1*/
_output_shapes
:?????????*
T0
?
9bert_1/bert/encoder/layer_shared_1/attention/self/SoftmaxSoftmax5bert_1/bert/encoder/layer_shared_1/attention/self/add*/
_output_shapes
:?????????*
T0
?
Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/2Const*
dtype0*
value	B :*
_output_shapes
: 
?
Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/3Const*
dtype0*
_output_shapes
: *
value	B :
?
Abert_1/bert/encoder/layer_shared_1/attention/self/Reshape_2/shapePack#bert_1/bert/encoder/strided_slice_2Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/1Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/2Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape/3*
N*
_output_shapes
:*
T0
?
;bert_1/bert/encoder/layer_shared_1/attention/self/Reshape_2Reshape?bert_1/bert/encoder/layer_shared_1/attention/self/value/BiasAddAbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_2/shape*/
_output_shapes
:?????????*
T0
?
Bbert_1/bert/encoder/layer_shared_1/attention/self/transpose_2/permConst*%
valueB"             *
dtype0*
_output_shapes
:
?
=bert_1/bert/encoder/layer_shared_1/attention/self/transpose_2	Transpose;bert_1/bert/encoder/layer_shared_1/attention/self/Reshape_2Bbert_1/bert/encoder/layer_shared_1/attention/self/transpose_2/perm*
T0*/
_output_shapes
:?????????
?
:bert_1/bert/encoder/layer_shared_1/attention/self/MatMul_1BatchMatMul9bert_1/bert/encoder/layer_shared_1/attention/self/Softmax=bert_1/bert/encoder/layer_shared_1/attention/self/transpose_2*/
_output_shapes
:?????????*
T0
?
Bbert_1/bert/encoder/layer_shared_1/attention/self/transpose_3/permConst*
_output_shapes
:*
dtype0*%
valueB"             
?
=bert_1/bert/encoder/layer_shared_1/attention/self/transpose_3	Transpose:bert_1/bert/encoder/layer_shared_1/attention/self/MatMul_1Bbert_1/bert/encoder/layer_shared_1/attention/self/transpose_3/perm*
T0*/
_output_shapes
:?????????
{
9bert_1/bert/encoder/layer_shared_1/attention/self/mul_2/yConst*
value	B :*
dtype0*
_output_shapes
: 
?
7bert_1/bert/encoder/layer_shared_1/attention/self/mul_2Mul#bert_1/bert/encoder/strided_slice_29bert_1/bert/encoder/layer_shared_1/attention/self/mul_2/y*
T0*
_output_shapes
: 
?
Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_3/shape/1Const*
dtype0*
value
B :?*
_output_shapes
: 
?
Abert_1/bert/encoder/layer_shared_1/attention/self/Reshape_3/shapePack7bert_1/bert/encoder/layer_shared_1/attention/self/mul_2Cbert_1/bert/encoder/layer_shared_1/attention/self/Reshape_3/shape/1*
N*
_output_shapes
:*
T0
?
;bert_1/bert/encoder/layer_shared_1/attention/self/Reshape_3Reshape=bert_1/bert/encoder/layer_shared_1/attention/self/transpose_3Abert_1/bert/encoder/layer_shared_1/attention/self/Reshape_3/shape*(
_output_shapes
:??????????*
T0
?
@bert_1/bert/encoder/layer_shared_1/attention/output/dense/MatMulMatMul;bert_1/bert/encoder/layer_shared_1/attention/self/Reshape_3<bert/encoder/layer_shared/attention/output/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
Abert_1/bert/encoder/layer_shared_1/attention/output/dense/BiasAddBiasAdd@bert_1/bert/encoder/layer_shared_1/attention/output/dense/MatMul:bert/encoder/layer_shared/attention/output/dense/bias/read*
T0*(
_output_shapes
:??????????
?
7bert_1/bert/encoder/layer_shared_1/attention/output/addAddAbert_1/bert/encoder/layer_shared_1/attention/output/dense/BiasAddAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
T0*(
_output_shapes
:??????????
?
\bert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
?
Jbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/meanMean7bert_1/bert/encoder/layer_shared_1/attention/output/add\bert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/mean/reduction_indices*
	keep_dims(*
T0*'
_output_shapes
:?????????
?
Rbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/StopGradientStopGradientJbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/mean*
T0*'
_output_shapes
:?????????
?
Wbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/SquaredDifferenceSquaredDifference7bert_1/bert/encoder/layer_shared_1/attention/output/addRbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
`bert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/variance/reduction_indicesConst*
valueB:*
_output_shapes
:*
dtype0
?
Nbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/varianceMeanWbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/SquaredDifference`bert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/variance/reduction_indices*'
_output_shapes
:?????????*
T0*
	keep_dims(
?
Mbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add/yConst*
valueB
 *̼?+*
dtype0*
_output_shapes
: 
?
Kbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/addAddNbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/varianceMbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add/y*
T0*'
_output_shapes
:?????????
?
Mbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/RsqrtRsqrtKbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add*'
_output_shapes
:?????????*
T0
?
Kbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mulMulMbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/Rsqrt?bert/encoder/layer_shared/attention/output/LayerNorm/gamma/read*(
_output_shapes
:??????????*
T0
?
Mbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul_1Mul7bert_1/bert/encoder/layer_shared_1/attention/output/addKbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Mbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul_2MulJbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/moments/meanKbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Kbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/subSub>bert/encoder/layer_shared/attention/output/LayerNorm/beta/readMbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul_2*
T0*(
_output_shapes
:??????????
?
Mbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add_1AddMbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/mul_1Kbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/sub*(
_output_shapes
:??????????*
T0
?
<bert_1/bert/encoder/layer_shared_1/intermediate/dense/MatMulMatMulMbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add_18bert/encoder/layer_shared/intermediate/dense/kernel/read*
T0*(
_output_shapes
:??????????	
?
=bert_1/bert/encoder/layer_shared_1/intermediate/dense/BiasAddBiasAdd<bert_1/bert/encoder/layer_shared_1/intermediate/dense/MatMul6bert/encoder/layer_shared/intermediate/dense/bias/read*(
_output_shapes
:??????????	*
T0
?
;bert_1/bert/encoder/layer_shared_1/intermediate/dense/Pow/yConst*
_output_shapes
: *
valueB
 *  @@*
dtype0
?
9bert_1/bert/encoder/layer_shared_1/intermediate/dense/PowPow=bert_1/bert/encoder/layer_shared_1/intermediate/dense/BiasAdd;bert_1/bert/encoder/layer_shared_1/intermediate/dense/Pow/y*
T0*(
_output_shapes
:??????????	
?
;bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul/xConst*
dtype0*
_output_shapes
: *
valueB
 *'7=
?
9bert_1/bert/encoder/layer_shared_1/intermediate/dense/mulMul;bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul/x9bert_1/bert/encoder/layer_shared_1/intermediate/dense/Pow*
T0*(
_output_shapes
:??????????	
?
9bert_1/bert/encoder/layer_shared_1/intermediate/dense/addAdd=bert_1/bert/encoder/layer_shared_1/intermediate/dense/BiasAdd9bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul*
T0*(
_output_shapes
:??????????	
?
=bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul_1/xConst*
dtype0*
valueB
 **BL?*
_output_shapes
: 
?
;bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul_1Mul=bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul_1/x9bert_1/bert/encoder/layer_shared_1/intermediate/dense/add*
T0*(
_output_shapes
:??????????	
?
:bert_1/bert/encoder/layer_shared_1/intermediate/dense/TanhTanh;bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul_1*
T0*(
_output_shapes
:??????????	
?
=bert_1/bert/encoder/layer_shared_1/intermediate/dense/add_1/xConst*
valueB
 *  ??*
_output_shapes
: *
dtype0
?
;bert_1/bert/encoder/layer_shared_1/intermediate/dense/add_1Add=bert_1/bert/encoder/layer_shared_1/intermediate/dense/add_1/x:bert_1/bert/encoder/layer_shared_1/intermediate/dense/Tanh*
T0*(
_output_shapes
:??????????	
?
=bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul_2/xConst*
valueB
 *   ?*
dtype0*
_output_shapes
: 
?
;bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul_2Mul=bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul_2/x;bert_1/bert/encoder/layer_shared_1/intermediate/dense/add_1*(
_output_shapes
:??????????	*
T0
?
;bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul_3Mul=bert_1/bert/encoder/layer_shared_1/intermediate/dense/BiasAdd;bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul_2*
T0*(
_output_shapes
:??????????	
?
6bert_1/bert/encoder/layer_shared_1/output/dense/MatMulMatMul;bert_1/bert/encoder/layer_shared_1/intermediate/dense/mul_32bert/encoder/layer_shared/output/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
7bert_1/bert/encoder/layer_shared_1/output/dense/BiasAddBiasAdd6bert_1/bert/encoder/layer_shared_1/output/dense/MatMul0bert/encoder/layer_shared/output/dense/bias/read*
T0*(
_output_shapes
:??????????
?
-bert_1/bert/encoder/layer_shared_1/output/addAdd7bert_1/bert/encoder/layer_shared_1/output/dense/BiasAddMbert_1/bert/encoder/layer_shared_1/attention/output/LayerNorm/batchnorm/add_1*
T0*(
_output_shapes
:??????????
?
Rbert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
?
@bert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/meanMean-bert_1/bert/encoder/layer_shared_1/output/addRbert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/mean/reduction_indices*
T0*'
_output_shapes
:?????????*
	keep_dims(
?
Hbert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/StopGradientStopGradient@bert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/mean*'
_output_shapes
:?????????*
T0
?
Mbert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/SquaredDifferenceSquaredDifference-bert_1/bert/encoder/layer_shared_1/output/addHbert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
Vbert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/variance/reduction_indicesConst*
_output_shapes
:*
valueB:*
dtype0
?
Dbert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/varianceMeanMbert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/SquaredDifferenceVbert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/variance/reduction_indices*'
_output_shapes
:?????????*
T0*
	keep_dims(
?
Cbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/add/yConst*
_output_shapes
: *
valueB
 *̼?+*
dtype0
?
Abert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/addAddDbert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/varianceCbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/add/y*'
_output_shapes
:?????????*
T0
?
Cbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/RsqrtRsqrtAbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/add*
T0*'
_output_shapes
:?????????
?
Abert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mulMulCbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/Rsqrt5bert/encoder/layer_shared/output/LayerNorm/gamma/read*(
_output_shapes
:??????????*
T0
?
Cbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul_1Mul-bert_1/bert/encoder/layer_shared_1/output/addAbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Cbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul_2Mul@bert_1/bert/encoder/layer_shared_1/output/LayerNorm/moments/meanAbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Abert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/subSub4bert/encoder/layer_shared/output/LayerNorm/beta/readCbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul_2*
T0*(
_output_shapes
:??????????
?
Cbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/add_1AddCbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/mul_1Abert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/sub*
T0*(
_output_shapes
:??????????
?
/bert_1/bert/encoder/layer_shared_1/output/add_1AddCbert_1/bert/encoder/layer_shared_1/output/LayerNorm/batchnorm/add_1Abert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
T0*(
_output_shapes
:??????????
?
7bert_1/bert/encoder/layer_shared_2/attention/self/ShapeShape/bert_1/bert/encoder/layer_shared_1/output/add_1*
_output_shapes
:*
T0
?
Ebert_1/bert/encoder/layer_shared_2/attention/self/strided_slice/stackConst*
dtype0*
_output_shapes
:*
valueB: 
?
Gbert_1/bert/encoder/layer_shared_2/attention/self/strided_slice/stack_1Const*
dtype0*
valueB:*
_output_shapes
:
?
Gbert_1/bert/encoder/layer_shared_2/attention/self/strided_slice/stack_2Const*
valueB:*
_output_shapes
:*
dtype0
?
?bert_1/bert/encoder/layer_shared_2/attention/self/strided_sliceStridedSlice7bert_1/bert/encoder/layer_shared_2/attention/self/ShapeEbert_1/bert/encoder/layer_shared_2/attention/self/strided_slice/stackGbert_1/bert/encoder/layer_shared_2/attention/self/strided_slice/stack_1Gbert_1/bert/encoder/layer_shared_2/attention/self/strided_slice/stack_2*
shrink_axis_mask*
_output_shapes
: *
Index0*
T0
?
9bert_1/bert/encoder/layer_shared_2/attention/self/Shape_1Shape/bert_1/bert/encoder/layer_shared_1/output/add_1*
T0*
_output_shapes
:
?
Gbert_1/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 
?
Ibert_1/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stack_1Const*
valueB:*
_output_shapes
:*
dtype0
?
Ibert_1/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
?
Abert_1/bert/encoder/layer_shared_2/attention/self/strided_slice_1StridedSlice9bert_1/bert/encoder/layer_shared_2/attention/self/Shape_1Gbert_1/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stackIbert_1/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stack_1Ibert_1/bert/encoder/layer_shared_2/attention/self/strided_slice_1/stack_2*
_output_shapes
: *
Index0*
T0*
shrink_axis_mask
?
>bert_1/bert/encoder/layer_shared_2/attention/self/query/MatMulMatMul/bert_1/bert/encoder/layer_shared_1/output/add_1:bert/encoder/layer_shared/attention/self/query/kernel/read*(
_output_shapes
:??????????*
T0
?
?bert_1/bert/encoder/layer_shared_2/attention/self/query/BiasAddBiasAdd>bert_1/bert/encoder/layer_shared_2/attention/self/query/MatMul8bert/encoder/layer_shared/attention/self/query/bias/read*(
_output_shapes
:??????????*
T0
?
<bert_1/bert/encoder/layer_shared_2/attention/self/key/MatMulMatMul/bert_1/bert/encoder/layer_shared_1/output/add_18bert/encoder/layer_shared/attention/self/key/kernel/read*(
_output_shapes
:??????????*
T0
?
=bert_1/bert/encoder/layer_shared_2/attention/self/key/BiasAddBiasAdd<bert_1/bert/encoder/layer_shared_2/attention/self/key/MatMul6bert/encoder/layer_shared/attention/self/key/bias/read*(
_output_shapes
:??????????*
T0
?
>bert_1/bert/encoder/layer_shared_2/attention/self/value/MatMulMatMul/bert_1/bert/encoder/layer_shared_1/output/add_1:bert/encoder/layer_shared/attention/self/value/kernel/read*
T0*(
_output_shapes
:??????????
?
?bert_1/bert/encoder/layer_shared_2/attention/self/value/BiasAddBiasAdd>bert_1/bert/encoder/layer_shared_2/attention/self/value/MatMul8bert/encoder/layer_shared/attention/self/value/bias/read*
T0*(
_output_shapes
:??????????
?
Abert_1/bert/encoder/layer_shared_2/attention/self/Reshape/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Abert_1/bert/encoder/layer_shared_2/attention/self/Reshape/shape/2Const*
_output_shapes
: *
value	B :*
dtype0
?
Abert_1/bert/encoder/layer_shared_2/attention/self/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :
?
?bert_1/bert/encoder/layer_shared_2/attention/self/Reshape/shapePack#bert_1/bert/encoder/strided_slice_2Abert_1/bert/encoder/layer_shared_2/attention/self/Reshape/shape/1Abert_1/bert/encoder/layer_shared_2/attention/self/Reshape/shape/2Abert_1/bert/encoder/layer_shared_2/attention/self/Reshape/shape/3*
T0*
N*
_output_shapes
:
?
9bert_1/bert/encoder/layer_shared_2/attention/self/ReshapeReshape?bert_1/bert/encoder/layer_shared_2/attention/self/query/BiasAdd?bert_1/bert/encoder/layer_shared_2/attention/self/Reshape/shape*
T0*/
_output_shapes
:?????????
?
@bert_1/bert/encoder/layer_shared_2/attention/self/transpose/permConst*%
valueB"             *
dtype0*
_output_shapes
:
?
;bert_1/bert/encoder/layer_shared_2/attention/self/transpose	Transpose9bert_1/bert/encoder/layer_shared_2/attention/self/Reshape@bert_1/bert/encoder/layer_shared_2/attention/self/transpose/perm*/
_output_shapes
:?????????*
T0
?
Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/1Const*
_output_shapes
: *
value	B :*
dtype0
?
Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value	B :
?
Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/3Const*
dtype0*
_output_shapes
: *
value	B :
?
Abert_1/bert/encoder/layer_shared_2/attention/self/Reshape_1/shapePack#bert_1/bert/encoder/strided_slice_2Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/1Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/2Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape/3*
N*
T0*
_output_shapes
:
?
;bert_1/bert/encoder/layer_shared_2/attention/self/Reshape_1Reshape=bert_1/bert/encoder/layer_shared_2/attention/self/key/BiasAddAbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_1/shape*/
_output_shapes
:?????????*
T0
?
Bbert_1/bert/encoder/layer_shared_2/attention/self/transpose_1/permConst*%
valueB"             *
dtype0*
_output_shapes
:
?
=bert_1/bert/encoder/layer_shared_2/attention/self/transpose_1	Transpose;bert_1/bert/encoder/layer_shared_2/attention/self/Reshape_1Bbert_1/bert/encoder/layer_shared_2/attention/self/transpose_1/perm*
T0*/
_output_shapes
:?????????
?
8bert_1/bert/encoder/layer_shared_2/attention/self/MatMulBatchMatMul;bert_1/bert/encoder/layer_shared_2/attention/self/transpose=bert_1/bert/encoder/layer_shared_2/attention/self/transpose_1*/
_output_shapes
:?????????*
T0*
adj_y(
|
7bert_1/bert/encoder/layer_shared_2/attention/self/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *??H>
?
5bert_1/bert/encoder/layer_shared_2/attention/self/MulMul8bert_1/bert/encoder/layer_shared_2/attention/self/MatMul7bert_1/bert/encoder/layer_shared_2/attention/self/Mul/y*
T0*/
_output_shapes
:?????????
?
@bert_1/bert/encoder/layer_shared_2/attention/self/ExpandDims/dimConst*
dtype0*
valueB:*
_output_shapes
:
?
<bert_1/bert/encoder/layer_shared_2/attention/self/ExpandDims
ExpandDimsbert_1/bert/encoder/mul@bert_1/bert/encoder/layer_shared_2/attention/self/ExpandDims/dim*
T0*/
_output_shapes
:?????????
|
7bert_1/bert/encoder/layer_shared_2/attention/self/sub/xConst*
_output_shapes
: *
valueB
 *  ??*
dtype0
?
5bert_1/bert/encoder/layer_shared_2/attention/self/subSub7bert_1/bert/encoder/layer_shared_2/attention/self/sub/x<bert_1/bert/encoder/layer_shared_2/attention/self/ExpandDims*/
_output_shapes
:?????????*
T0
~
9bert_1/bert/encoder/layer_shared_2/attention/self/mul_1/yConst*
_output_shapes
: *
valueB
 * @?*
dtype0
?
7bert_1/bert/encoder/layer_shared_2/attention/self/mul_1Mul5bert_1/bert/encoder/layer_shared_2/attention/self/sub9bert_1/bert/encoder/layer_shared_2/attention/self/mul_1/y*/
_output_shapes
:?????????*
T0
?
5bert_1/bert/encoder/layer_shared_2/attention/self/addAdd5bert_1/bert/encoder/layer_shared_2/attention/self/Mul7bert_1/bert/encoder/layer_shared_2/attention/self/mul_1*/
_output_shapes
:?????????*
T0
?
9bert_1/bert/encoder/layer_shared_2/attention/self/SoftmaxSoftmax5bert_1/bert/encoder/layer_shared_2/attention/self/add*/
_output_shapes
:?????????*
T0
?
Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
?
Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/2Const*
dtype0*
value	B :*
_output_shapes
: 
?
Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/3Const*
dtype0*
value	B :*
_output_shapes
: 
?
Abert_1/bert/encoder/layer_shared_2/attention/self/Reshape_2/shapePack#bert_1/bert/encoder/strided_slice_2Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/1Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/2Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape/3*
N*
T0*
_output_shapes
:
?
;bert_1/bert/encoder/layer_shared_2/attention/self/Reshape_2Reshape?bert_1/bert/encoder/layer_shared_2/attention/self/value/BiasAddAbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_2/shape*/
_output_shapes
:?????????*
T0
?
Bbert_1/bert/encoder/layer_shared_2/attention/self/transpose_2/permConst*
_output_shapes
:*
dtype0*%
valueB"             
?
=bert_1/bert/encoder/layer_shared_2/attention/self/transpose_2	Transpose;bert_1/bert/encoder/layer_shared_2/attention/self/Reshape_2Bbert_1/bert/encoder/layer_shared_2/attention/self/transpose_2/perm*/
_output_shapes
:?????????*
T0
?
:bert_1/bert/encoder/layer_shared_2/attention/self/MatMul_1BatchMatMul9bert_1/bert/encoder/layer_shared_2/attention/self/Softmax=bert_1/bert/encoder/layer_shared_2/attention/self/transpose_2*
T0*/
_output_shapes
:?????????
?
Bbert_1/bert/encoder/layer_shared_2/attention/self/transpose_3/permConst*
_output_shapes
:*%
valueB"             *
dtype0
?
=bert_1/bert/encoder/layer_shared_2/attention/self/transpose_3	Transpose:bert_1/bert/encoder/layer_shared_2/attention/self/MatMul_1Bbert_1/bert/encoder/layer_shared_2/attention/self/transpose_3/perm*
T0*/
_output_shapes
:?????????
{
9bert_1/bert/encoder/layer_shared_2/attention/self/mul_2/yConst*
value	B :*
dtype0*
_output_shapes
: 
?
7bert_1/bert/encoder/layer_shared_2/attention/self/mul_2Mul#bert_1/bert/encoder/strided_slice_29bert_1/bert/encoder/layer_shared_2/attention/self/mul_2/y*
T0*
_output_shapes
: 
?
Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_3/shape/1Const*
value
B :?*
dtype0*
_output_shapes
: 
?
Abert_1/bert/encoder/layer_shared_2/attention/self/Reshape_3/shapePack7bert_1/bert/encoder/layer_shared_2/attention/self/mul_2Cbert_1/bert/encoder/layer_shared_2/attention/self/Reshape_3/shape/1*
_output_shapes
:*
N*
T0
?
;bert_1/bert/encoder/layer_shared_2/attention/self/Reshape_3Reshape=bert_1/bert/encoder/layer_shared_2/attention/self/transpose_3Abert_1/bert/encoder/layer_shared_2/attention/self/Reshape_3/shape*(
_output_shapes
:??????????*
T0
?
@bert_1/bert/encoder/layer_shared_2/attention/output/dense/MatMulMatMul;bert_1/bert/encoder/layer_shared_2/attention/self/Reshape_3<bert/encoder/layer_shared/attention/output/dense/kernel/read*(
_output_shapes
:??????????*
T0
?
Abert_1/bert/encoder/layer_shared_2/attention/output/dense/BiasAddBiasAdd@bert_1/bert/encoder/layer_shared_2/attention/output/dense/MatMul:bert/encoder/layer_shared/attention/output/dense/bias/read*
T0*(
_output_shapes
:??????????
?
7bert_1/bert/encoder/layer_shared_2/attention/output/addAddAbert_1/bert/encoder/layer_shared_2/attention/output/dense/BiasAdd/bert_1/bert/encoder/layer_shared_1/output/add_1*
T0*(
_output_shapes
:??????????
?
\bert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/mean/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
?
Jbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/meanMean7bert_1/bert/encoder/layer_shared_2/attention/output/add\bert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/mean/reduction_indices*
T0*'
_output_shapes
:?????????*
	keep_dims(
?
Rbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/StopGradientStopGradientJbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/mean*'
_output_shapes
:?????????*
T0
?
Wbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/SquaredDifferenceSquaredDifference7bert_1/bert/encoder/layer_shared_2/attention/output/addRbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/StopGradient*(
_output_shapes
:??????????*
T0
?
`bert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/variance/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
?
Nbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/varianceMeanWbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/SquaredDifference`bert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/variance/reduction_indices*
	keep_dims(*
T0*'
_output_shapes
:?????????
?
Mbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add/yConst*
valueB
 *̼?+*
_output_shapes
: *
dtype0
?
Kbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/addAddNbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/varianceMbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add/y*'
_output_shapes
:?????????*
T0
?
Mbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/RsqrtRsqrtKbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add*'
_output_shapes
:?????????*
T0
?
Kbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mulMulMbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/Rsqrt?bert/encoder/layer_shared/attention/output/LayerNorm/gamma/read*
T0*(
_output_shapes
:??????????
?
Mbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul_1Mul7bert_1/bert/encoder/layer_shared_2/attention/output/addKbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Mbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul_2MulJbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/moments/meanKbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Kbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/subSub>bert/encoder/layer_shared/attention/output/LayerNorm/beta/readMbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul_2*
T0*(
_output_shapes
:??????????
?
Mbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add_1AddMbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/mul_1Kbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/sub*
T0*(
_output_shapes
:??????????
?
<bert_1/bert/encoder/layer_shared_2/intermediate/dense/MatMulMatMulMbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add_18bert/encoder/layer_shared/intermediate/dense/kernel/read*(
_output_shapes
:??????????	*
T0
?
=bert_1/bert/encoder/layer_shared_2/intermediate/dense/BiasAddBiasAdd<bert_1/bert/encoder/layer_shared_2/intermediate/dense/MatMul6bert/encoder/layer_shared/intermediate/dense/bias/read*(
_output_shapes
:??????????	*
T0
?
;bert_1/bert/encoder/layer_shared_2/intermediate/dense/Pow/yConst*
valueB
 *  @@*
_output_shapes
: *
dtype0
?
9bert_1/bert/encoder/layer_shared_2/intermediate/dense/PowPow=bert_1/bert/encoder/layer_shared_2/intermediate/dense/BiasAdd;bert_1/bert/encoder/layer_shared_2/intermediate/dense/Pow/y*(
_output_shapes
:??????????	*
T0
?
;bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul/xConst*
valueB
 *'7=*
_output_shapes
: *
dtype0
?
9bert_1/bert/encoder/layer_shared_2/intermediate/dense/mulMul;bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul/x9bert_1/bert/encoder/layer_shared_2/intermediate/dense/Pow*(
_output_shapes
:??????????	*
T0
?
9bert_1/bert/encoder/layer_shared_2/intermediate/dense/addAdd=bert_1/bert/encoder/layer_shared_2/intermediate/dense/BiasAdd9bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul*(
_output_shapes
:??????????	*
T0
?
=bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul_1/xConst*
_output_shapes
: *
dtype0*
valueB
 **BL?
?
;bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul_1Mul=bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul_1/x9bert_1/bert/encoder/layer_shared_2/intermediate/dense/add*(
_output_shapes
:??????????	*
T0
?
:bert_1/bert/encoder/layer_shared_2/intermediate/dense/TanhTanh;bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul_1*(
_output_shapes
:??????????	*
T0
?
=bert_1/bert/encoder/layer_shared_2/intermediate/dense/add_1/xConst*
valueB
 *  ??*
dtype0*
_output_shapes
: 
?
;bert_1/bert/encoder/layer_shared_2/intermediate/dense/add_1Add=bert_1/bert/encoder/layer_shared_2/intermediate/dense/add_1/x:bert_1/bert/encoder/layer_shared_2/intermediate/dense/Tanh*(
_output_shapes
:??????????	*
T0
?
=bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul_2/xConst*
valueB
 *   ?*
_output_shapes
: *
dtype0
?
;bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul_2Mul=bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul_2/x;bert_1/bert/encoder/layer_shared_2/intermediate/dense/add_1*(
_output_shapes
:??????????	*
T0
?
;bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul_3Mul=bert_1/bert/encoder/layer_shared_2/intermediate/dense/BiasAdd;bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul_2*(
_output_shapes
:??????????	*
T0
?
6bert_1/bert/encoder/layer_shared_2/output/dense/MatMulMatMul;bert_1/bert/encoder/layer_shared_2/intermediate/dense/mul_32bert/encoder/layer_shared/output/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
7bert_1/bert/encoder/layer_shared_2/output/dense/BiasAddBiasAdd6bert_1/bert/encoder/layer_shared_2/output/dense/MatMul0bert/encoder/layer_shared/output/dense/bias/read*
T0*(
_output_shapes
:??????????
?
-bert_1/bert/encoder/layer_shared_2/output/addAdd7bert_1/bert/encoder/layer_shared_2/output/dense/BiasAddMbert_1/bert/encoder/layer_shared_2/attention/output/LayerNorm/batchnorm/add_1*
T0*(
_output_shapes
:??????????
?
Rbert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/mean/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
?
@bert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/meanMean-bert_1/bert/encoder/layer_shared_2/output/addRbert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/mean/reduction_indices*
T0*'
_output_shapes
:?????????*
	keep_dims(
?
Hbert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/StopGradientStopGradient@bert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/mean*'
_output_shapes
:?????????*
T0
?
Mbert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/SquaredDifferenceSquaredDifference-bert_1/bert/encoder/layer_shared_2/output/addHbert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
Vbert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/variance/reduction_indicesConst*
_output_shapes
:*
valueB:*
dtype0
?
Dbert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/varianceMeanMbert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/SquaredDifferenceVbert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/variance/reduction_indices*
T0*
	keep_dims(*'
_output_shapes
:?????????
?
Cbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/add/yConst*
valueB
 *̼?+*
dtype0*
_output_shapes
: 
?
Abert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/addAddDbert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/varianceCbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/add/y*'
_output_shapes
:?????????*
T0
?
Cbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/RsqrtRsqrtAbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/add*'
_output_shapes
:?????????*
T0
?
Abert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mulMulCbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/Rsqrt5bert/encoder/layer_shared/output/LayerNorm/gamma/read*(
_output_shapes
:??????????*
T0
?
Cbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul_1Mul-bert_1/bert/encoder/layer_shared_2/output/addAbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Cbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul_2Mul@bert_1/bert/encoder/layer_shared_2/output/LayerNorm/moments/meanAbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Abert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/subSub4bert/encoder/layer_shared/output/LayerNorm/beta/readCbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul_2*
T0*(
_output_shapes
:??????????
?
Cbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/add_1AddCbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/mul_1Abert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/sub*
T0*(
_output_shapes
:??????????
?
/bert_1/bert/encoder/layer_shared_2/output/add_1AddCbert_1/bert/encoder/layer_shared_2/output/LayerNorm/batchnorm/add_1Abert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
T0*(
_output_shapes
:??????????
?
/bert_1/bert/encoder/layer_shared_2/output/add_2Add/bert_1/bert/encoder/layer_shared_2/output/add_1/bert_1/bert/encoder/layer_shared_1/output/add_1*(
_output_shapes
:??????????*
T0
?
7bert_1/bert/encoder/layer_shared_3/attention/self/ShapeShape/bert_1/bert/encoder/layer_shared_2/output/add_2*
T0*
_output_shapes
:
?
Ebert_1/bert/encoder/layer_shared_3/attention/self/strided_slice/stackConst*
dtype0*
valueB: *
_output_shapes
:
?
Gbert_1/bert/encoder/layer_shared_3/attention/self/strided_slice/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
?
Gbert_1/bert/encoder/layer_shared_3/attention/self/strided_slice/stack_2Const*
valueB:*
_output_shapes
:*
dtype0
?
?bert_1/bert/encoder/layer_shared_3/attention/self/strided_sliceStridedSlice7bert_1/bert/encoder/layer_shared_3/attention/self/ShapeEbert_1/bert/encoder/layer_shared_3/attention/self/strided_slice/stackGbert_1/bert/encoder/layer_shared_3/attention/self/strided_slice/stack_1Gbert_1/bert/encoder/layer_shared_3/attention/self/strided_slice/stack_2*
shrink_axis_mask*
_output_shapes
: *
T0*
Index0
?
9bert_1/bert/encoder/layer_shared_3/attention/self/Shape_1Shape/bert_1/bert/encoder/layer_shared_2/output/add_2*
_output_shapes
:*
T0
?
Gbert_1/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stackConst*
valueB: *
_output_shapes
:*
dtype0
?
Ibert_1/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stack_1Const*
valueB:*
_output_shapes
:*
dtype0
?
Ibert_1/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
Abert_1/bert/encoder/layer_shared_3/attention/self/strided_slice_1StridedSlice9bert_1/bert/encoder/layer_shared_3/attention/self/Shape_1Gbert_1/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stackIbert_1/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stack_1Ibert_1/bert/encoder/layer_shared_3/attention/self/strided_slice_1/stack_2*
_output_shapes
: *
T0*
shrink_axis_mask*
Index0
?
>bert_1/bert/encoder/layer_shared_3/attention/self/query/MatMulMatMul/bert_1/bert/encoder/layer_shared_2/output/add_2:bert/encoder/layer_shared/attention/self/query/kernel/read*(
_output_shapes
:??????????*
T0
?
?bert_1/bert/encoder/layer_shared_3/attention/self/query/BiasAddBiasAdd>bert_1/bert/encoder/layer_shared_3/attention/self/query/MatMul8bert/encoder/layer_shared/attention/self/query/bias/read*
T0*(
_output_shapes
:??????????
?
<bert_1/bert/encoder/layer_shared_3/attention/self/key/MatMulMatMul/bert_1/bert/encoder/layer_shared_2/output/add_28bert/encoder/layer_shared/attention/self/key/kernel/read*
T0*(
_output_shapes
:??????????
?
=bert_1/bert/encoder/layer_shared_3/attention/self/key/BiasAddBiasAdd<bert_1/bert/encoder/layer_shared_3/attention/self/key/MatMul6bert/encoder/layer_shared/attention/self/key/bias/read*(
_output_shapes
:??????????*
T0
?
>bert_1/bert/encoder/layer_shared_3/attention/self/value/MatMulMatMul/bert_1/bert/encoder/layer_shared_2/output/add_2:bert/encoder/layer_shared/attention/self/value/kernel/read*
T0*(
_output_shapes
:??????????
?
?bert_1/bert/encoder/layer_shared_3/attention/self/value/BiasAddBiasAdd>bert_1/bert/encoder/layer_shared_3/attention/self/value/MatMul8bert/encoder/layer_shared/attention/self/value/bias/read*(
_output_shapes
:??????????*
T0
?
Abert_1/bert/encoder/layer_shared_3/attention/self/Reshape/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Abert_1/bert/encoder/layer_shared_3/attention/self/Reshape/shape/2Const*
dtype0*
_output_shapes
: *
value	B :
?
Abert_1/bert/encoder/layer_shared_3/attention/self/Reshape/shape/3Const*
dtype0*
_output_shapes
: *
value	B :
?
?bert_1/bert/encoder/layer_shared_3/attention/self/Reshape/shapePack#bert_1/bert/encoder/strided_slice_2Abert_1/bert/encoder/layer_shared_3/attention/self/Reshape/shape/1Abert_1/bert/encoder/layer_shared_3/attention/self/Reshape/shape/2Abert_1/bert/encoder/layer_shared_3/attention/self/Reshape/shape/3*
T0*
N*
_output_shapes
:
?
9bert_1/bert/encoder/layer_shared_3/attention/self/ReshapeReshape?bert_1/bert/encoder/layer_shared_3/attention/self/query/BiasAdd?bert_1/bert/encoder/layer_shared_3/attention/self/Reshape/shape*
T0*/
_output_shapes
:?????????
?
@bert_1/bert/encoder/layer_shared_3/attention/self/transpose/permConst*
dtype0*%
valueB"             *
_output_shapes
:
?
;bert_1/bert/encoder/layer_shared_3/attention/self/transpose	Transpose9bert_1/bert/encoder/layer_shared_3/attention/self/Reshape@bert_1/bert/encoder/layer_shared_3/attention/self/transpose/perm*
T0*/
_output_shapes
:?????????
?
Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
?
Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/2Const*
_output_shapes
: *
value	B :*
dtype0
?
Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/3Const*
value	B :*
dtype0*
_output_shapes
: 
?
Abert_1/bert/encoder/layer_shared_3/attention/self/Reshape_1/shapePack#bert_1/bert/encoder/strided_slice_2Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/1Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/2Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape/3*
_output_shapes
:*
T0*
N
?
;bert_1/bert/encoder/layer_shared_3/attention/self/Reshape_1Reshape=bert_1/bert/encoder/layer_shared_3/attention/self/key/BiasAddAbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_1/shape*/
_output_shapes
:?????????*
T0
?
Bbert_1/bert/encoder/layer_shared_3/attention/self/transpose_1/permConst*%
valueB"             *
_output_shapes
:*
dtype0
?
=bert_1/bert/encoder/layer_shared_3/attention/self/transpose_1	Transpose;bert_1/bert/encoder/layer_shared_3/attention/self/Reshape_1Bbert_1/bert/encoder/layer_shared_3/attention/self/transpose_1/perm*
T0*/
_output_shapes
:?????????
?
8bert_1/bert/encoder/layer_shared_3/attention/self/MatMulBatchMatMul;bert_1/bert/encoder/layer_shared_3/attention/self/transpose=bert_1/bert/encoder/layer_shared_3/attention/self/transpose_1*
adj_y(*
T0*/
_output_shapes
:?????????
|
7bert_1/bert/encoder/layer_shared_3/attention/self/Mul/yConst*
dtype0*
valueB
 *??H>*
_output_shapes
: 
?
5bert_1/bert/encoder/layer_shared_3/attention/self/MulMul8bert_1/bert/encoder/layer_shared_3/attention/self/MatMul7bert_1/bert/encoder/layer_shared_3/attention/self/Mul/y*/
_output_shapes
:?????????*
T0
?
@bert_1/bert/encoder/layer_shared_3/attention/self/ExpandDims/dimConst*
_output_shapes
:*
dtype0*
valueB:
?
<bert_1/bert/encoder/layer_shared_3/attention/self/ExpandDims
ExpandDimsbert_1/bert/encoder/mul@bert_1/bert/encoder/layer_shared_3/attention/self/ExpandDims/dim*
T0*/
_output_shapes
:?????????
|
7bert_1/bert/encoder/layer_shared_3/attention/self/sub/xConst*
_output_shapes
: *
valueB
 *  ??*
dtype0
?
5bert_1/bert/encoder/layer_shared_3/attention/self/subSub7bert_1/bert/encoder/layer_shared_3/attention/self/sub/x<bert_1/bert/encoder/layer_shared_3/attention/self/ExpandDims*/
_output_shapes
:?????????*
T0
~
9bert_1/bert/encoder/layer_shared_3/attention/self/mul_1/yConst*
dtype0*
_output_shapes
: *
valueB
 * @?
?
7bert_1/bert/encoder/layer_shared_3/attention/self/mul_1Mul5bert_1/bert/encoder/layer_shared_3/attention/self/sub9bert_1/bert/encoder/layer_shared_3/attention/self/mul_1/y*/
_output_shapes
:?????????*
T0
?
5bert_1/bert/encoder/layer_shared_3/attention/self/addAdd5bert_1/bert/encoder/layer_shared_3/attention/self/Mul7bert_1/bert/encoder/layer_shared_3/attention/self/mul_1*
T0*/
_output_shapes
:?????????
?
9bert_1/bert/encoder/layer_shared_3/attention/self/SoftmaxSoftmax5bert_1/bert/encoder/layer_shared_3/attention/self/add*
T0*/
_output_shapes
:?????????
?
Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
?
Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/2Const*
_output_shapes
: *
dtype0*
value	B :
?
Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/3Const*
dtype0*
_output_shapes
: *
value	B :
?
Abert_1/bert/encoder/layer_shared_3/attention/self/Reshape_2/shapePack#bert_1/bert/encoder/strided_slice_2Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/1Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/2Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape/3*
N*
T0*
_output_shapes
:
?
;bert_1/bert/encoder/layer_shared_3/attention/self/Reshape_2Reshape?bert_1/bert/encoder/layer_shared_3/attention/self/value/BiasAddAbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_2/shape*/
_output_shapes
:?????????*
T0
?
Bbert_1/bert/encoder/layer_shared_3/attention/self/transpose_2/permConst*%
valueB"             *
dtype0*
_output_shapes
:
?
=bert_1/bert/encoder/layer_shared_3/attention/self/transpose_2	Transpose;bert_1/bert/encoder/layer_shared_3/attention/self/Reshape_2Bbert_1/bert/encoder/layer_shared_3/attention/self/transpose_2/perm*/
_output_shapes
:?????????*
T0
?
:bert_1/bert/encoder/layer_shared_3/attention/self/MatMul_1BatchMatMul9bert_1/bert/encoder/layer_shared_3/attention/self/Softmax=bert_1/bert/encoder/layer_shared_3/attention/self/transpose_2*
T0*/
_output_shapes
:?????????
?
Bbert_1/bert/encoder/layer_shared_3/attention/self/transpose_3/permConst*
_output_shapes
:*%
valueB"             *
dtype0
?
=bert_1/bert/encoder/layer_shared_3/attention/self/transpose_3	Transpose:bert_1/bert/encoder/layer_shared_3/attention/self/MatMul_1Bbert_1/bert/encoder/layer_shared_3/attention/self/transpose_3/perm*/
_output_shapes
:?????????*
T0
{
9bert_1/bert/encoder/layer_shared_3/attention/self/mul_2/yConst*
_output_shapes
: *
dtype0*
value	B :
?
7bert_1/bert/encoder/layer_shared_3/attention/self/mul_2Mul#bert_1/bert/encoder/strided_slice_29bert_1/bert/encoder/layer_shared_3/attention/self/mul_2/y*
_output_shapes
: *
T0
?
Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_3/shape/1Const*
dtype0*
value
B :?*
_output_shapes
: 
?
Abert_1/bert/encoder/layer_shared_3/attention/self/Reshape_3/shapePack7bert_1/bert/encoder/layer_shared_3/attention/self/mul_2Cbert_1/bert/encoder/layer_shared_3/attention/self/Reshape_3/shape/1*
N*
_output_shapes
:*
T0
?
;bert_1/bert/encoder/layer_shared_3/attention/self/Reshape_3Reshape=bert_1/bert/encoder/layer_shared_3/attention/self/transpose_3Abert_1/bert/encoder/layer_shared_3/attention/self/Reshape_3/shape*(
_output_shapes
:??????????*
T0
?
@bert_1/bert/encoder/layer_shared_3/attention/output/dense/MatMulMatMul;bert_1/bert/encoder/layer_shared_3/attention/self/Reshape_3<bert/encoder/layer_shared/attention/output/dense/kernel/read*(
_output_shapes
:??????????*
T0
?
Abert_1/bert/encoder/layer_shared_3/attention/output/dense/BiasAddBiasAdd@bert_1/bert/encoder/layer_shared_3/attention/output/dense/MatMul:bert/encoder/layer_shared/attention/output/dense/bias/read*
T0*(
_output_shapes
:??????????
?
7bert_1/bert/encoder/layer_shared_3/attention/output/addAddAbert_1/bert/encoder/layer_shared_3/attention/output/dense/BiasAdd/bert_1/bert/encoder/layer_shared_2/output/add_2*
T0*(
_output_shapes
:??????????
?
\bert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/mean/reduction_indicesConst*
dtype0*
_output_shapes
:*
valueB:
?
Jbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/meanMean7bert_1/bert/encoder/layer_shared_3/attention/output/add\bert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/mean/reduction_indices*'
_output_shapes
:?????????*
T0*
	keep_dims(
?
Rbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/StopGradientStopGradientJbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/mean*
T0*'
_output_shapes
:?????????
?
Wbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/SquaredDifferenceSquaredDifference7bert_1/bert/encoder/layer_shared_3/attention/output/addRbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
`bert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/variance/reduction_indicesConst*
dtype0*
valueB:*
_output_shapes
:
?
Nbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/varianceMeanWbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/SquaredDifference`bert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/variance/reduction_indices*'
_output_shapes
:?????????*
	keep_dims(*
T0
?
Mbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add/yConst*
valueB
 *̼?+*
_output_shapes
: *
dtype0
?
Kbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/addAddNbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/varianceMbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add/y*'
_output_shapes
:?????????*
T0
?
Mbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/RsqrtRsqrtKbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add*
T0*'
_output_shapes
:?????????
?
Kbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mulMulMbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/Rsqrt?bert/encoder/layer_shared/attention/output/LayerNorm/gamma/read*(
_output_shapes
:??????????*
T0
?
Mbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul_1Mul7bert_1/bert/encoder/layer_shared_3/attention/output/addKbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Mbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul_2MulJbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/moments/meanKbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Kbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/subSub>bert/encoder/layer_shared/attention/output/LayerNorm/beta/readMbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul_2*
T0*(
_output_shapes
:??????????
?
Mbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add_1AddMbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/mul_1Kbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/sub*(
_output_shapes
:??????????*
T0
?
<bert_1/bert/encoder/layer_shared_3/intermediate/dense/MatMulMatMulMbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add_18bert/encoder/layer_shared/intermediate/dense/kernel/read*(
_output_shapes
:??????????	*
T0
?
=bert_1/bert/encoder/layer_shared_3/intermediate/dense/BiasAddBiasAdd<bert_1/bert/encoder/layer_shared_3/intermediate/dense/MatMul6bert/encoder/layer_shared/intermediate/dense/bias/read*
T0*(
_output_shapes
:??????????	
?
;bert_1/bert/encoder/layer_shared_3/intermediate/dense/Pow/yConst*
_output_shapes
: *
dtype0*
valueB
 *  @@
?
9bert_1/bert/encoder/layer_shared_3/intermediate/dense/PowPow=bert_1/bert/encoder/layer_shared_3/intermediate/dense/BiasAdd;bert_1/bert/encoder/layer_shared_3/intermediate/dense/Pow/y*(
_output_shapes
:??????????	*
T0
?
;bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul/xConst*
dtype0*
_output_shapes
: *
valueB
 *'7=
?
9bert_1/bert/encoder/layer_shared_3/intermediate/dense/mulMul;bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul/x9bert_1/bert/encoder/layer_shared_3/intermediate/dense/Pow*(
_output_shapes
:??????????	*
T0
?
9bert_1/bert/encoder/layer_shared_3/intermediate/dense/addAdd=bert_1/bert/encoder/layer_shared_3/intermediate/dense/BiasAdd9bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul*
T0*(
_output_shapes
:??????????	
?
=bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul_1/xConst*
valueB
 **BL?*
dtype0*
_output_shapes
: 
?
;bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul_1Mul=bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul_1/x9bert_1/bert/encoder/layer_shared_3/intermediate/dense/add*(
_output_shapes
:??????????	*
T0
?
:bert_1/bert/encoder/layer_shared_3/intermediate/dense/TanhTanh;bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul_1*(
_output_shapes
:??????????	*
T0
?
=bert_1/bert/encoder/layer_shared_3/intermediate/dense/add_1/xConst*
_output_shapes
: *
valueB
 *  ??*
dtype0
?
;bert_1/bert/encoder/layer_shared_3/intermediate/dense/add_1Add=bert_1/bert/encoder/layer_shared_3/intermediate/dense/add_1/x:bert_1/bert/encoder/layer_shared_3/intermediate/dense/Tanh*(
_output_shapes
:??????????	*
T0
?
=bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul_2/xConst*
dtype0*
_output_shapes
: *
valueB
 *   ?
?
;bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul_2Mul=bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul_2/x;bert_1/bert/encoder/layer_shared_3/intermediate/dense/add_1*(
_output_shapes
:??????????	*
T0
?
;bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul_3Mul=bert_1/bert/encoder/layer_shared_3/intermediate/dense/BiasAdd;bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul_2*(
_output_shapes
:??????????	*
T0
?
6bert_1/bert/encoder/layer_shared_3/output/dense/MatMulMatMul;bert_1/bert/encoder/layer_shared_3/intermediate/dense/mul_32bert/encoder/layer_shared/output/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
7bert_1/bert/encoder/layer_shared_3/output/dense/BiasAddBiasAdd6bert_1/bert/encoder/layer_shared_3/output/dense/MatMul0bert/encoder/layer_shared/output/dense/bias/read*(
_output_shapes
:??????????*
T0
?
-bert_1/bert/encoder/layer_shared_3/output/addAdd7bert_1/bert/encoder/layer_shared_3/output/dense/BiasAddMbert_1/bert/encoder/layer_shared_3/attention/output/LayerNorm/batchnorm/add_1*(
_output_shapes
:??????????*
T0
?
Rbert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/mean/reduction_indicesConst*
_output_shapes
:*
valueB:*
dtype0
?
@bert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/meanMean-bert_1/bert/encoder/layer_shared_3/output/addRbert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/mean/reduction_indices*
T0*'
_output_shapes
:?????????*
	keep_dims(
?
Hbert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/StopGradientStopGradient@bert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/mean*'
_output_shapes
:?????????*
T0
?
Mbert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/SquaredDifferenceSquaredDifference-bert_1/bert/encoder/layer_shared_3/output/addHbert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/StopGradient*
T0*(
_output_shapes
:??????????
?
Vbert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/variance/reduction_indicesConst*
valueB:*
dtype0*
_output_shapes
:
?
Dbert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/varianceMeanMbert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/SquaredDifferenceVbert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/variance/reduction_indices*'
_output_shapes
:?????????*
	keep_dims(*
T0
?
Cbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/add/yConst*
valueB
 *̼?+*
_output_shapes
: *
dtype0
?
Abert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/addAddDbert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/varianceCbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/add/y*
T0*'
_output_shapes
:?????????
?
Cbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/RsqrtRsqrtAbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/add*
T0*'
_output_shapes
:?????????
?
Abert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mulMulCbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/Rsqrt5bert/encoder/layer_shared/output/LayerNorm/gamma/read*
T0*(
_output_shapes
:??????????
?
Cbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul_1Mul-bert_1/bert/encoder/layer_shared_3/output/addAbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul*(
_output_shapes
:??????????*
T0
?
Cbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul_2Mul@bert_1/bert/encoder/layer_shared_3/output/LayerNorm/moments/meanAbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul*
T0*(
_output_shapes
:??????????
?
Abert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/subSub4bert/encoder/layer_shared/output/LayerNorm/beta/readCbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul_2*
T0*(
_output_shapes
:??????????
?
Cbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/add_1AddCbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/mul_1Abert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/sub*(
_output_shapes
:??????????*
T0
?
/bert_1/bert/encoder/layer_shared_3/output/add_1AddCbert_1/bert/encoder/layer_shared_3/output/LayerNorm/batchnorm/add_1Abert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
T0*(
_output_shapes
:??????????
?
/bert_1/bert/encoder/layer_shared_3/output/add_2Add/bert_1/bert/encoder/layer_shared_3/output/add_1/bert_1/bert/encoder/layer_shared_1/output/add_1*
T0*(
_output_shapes
:??????????
?
/bert_1/bert/encoder/layer_shared_3/output/add_3Add/bert_1/bert/encoder/layer_shared_3/output/add_2/bert_1/bert/encoder/layer_shared_2/output/add_2*(
_output_shapes
:??????????*
T0
?
bert_1/bert/encoder/Shape_3ShapeAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1*
T0*
_output_shapes
:
s
)bert_1/bert/encoder/strided_slice_3/stackConst*
dtype0*
valueB: *
_output_shapes
:
u
+bert_1/bert/encoder/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
u
+bert_1/bert/encoder/strided_slice_3/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
?
#bert_1/bert/encoder/strided_slice_3StridedSlicebert_1/bert/encoder/Shape_3)bert_1/bert/encoder/strided_slice_3/stack+bert_1/bert/encoder/strided_slice_3/stack_1+bert_1/bert/encoder/strided_slice_3/stack_2*
T0*
Index0*
_output_shapes
: *
shrink_axis_mask
g
%bert_1/bert/encoder/Reshape_2/shape/1Const*
dtype0*
value	B :*
_output_shapes
: 
h
%bert_1/bert/encoder/Reshape_2/shape/2Const*
value
B :?*
_output_shapes
: *
dtype0
?
#bert_1/bert/encoder/Reshape_2/shapePack#bert_1/bert/encoder/strided_slice_2%bert_1/bert/encoder/Reshape_2/shape/1%bert_1/bert/encoder/Reshape_2/shape/2*
T0*
N*
_output_shapes
:
?
bert_1/bert/encoder/Reshape_2ReshapeAbert_1/bert/encoder/layer_shared/output/LayerNorm/batchnorm/add_1#bert_1/bert/encoder/Reshape_2/shape*,
_output_shapes
:??????????*
T0
z
bert_1/bert/encoder/Shape_4Shape/bert_1/bert/encoder/layer_shared_1/output/add_1*
T0*
_output_shapes
:
s
)bert_1/bert/encoder/strided_slice_4/stackConst*
_output_shapes
:*
valueB: *
dtype0
u
+bert_1/bert/encoder/strided_slice_4/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
u
+bert_1/bert/encoder/strided_slice_4/stack_2Const*
dtype0*
valueB:*
_output_shapes
:
?
#bert_1/bert/encoder/strided_slice_4StridedSlicebert_1/bert/encoder/Shape_4)bert_1/bert/encoder/strided_slice_4/stack+bert_1/bert/encoder/strided_slice_4/stack_1+bert_1/bert/encoder/strided_slice_4/stack_2*
T0*
shrink_axis_mask*
Index0*
_output_shapes
: 
g
%bert_1/bert/encoder/Reshape_3/shape/1Const*
_output_shapes
: *
dtype0*
value	B :
h
%bert_1/bert/encoder/Reshape_3/shape/2Const*
_output_shapes
: *
value
B :?*
dtype0
?
#bert_1/bert/encoder/Reshape_3/shapePack#bert_1/bert/encoder/strided_slice_2%bert_1/bert/encoder/Reshape_3/shape/1%bert_1/bert/encoder/Reshape_3/shape/2*
T0*
_output_shapes
:*
N
?
bert_1/bert/encoder/Reshape_3Reshape/bert_1/bert/encoder/layer_shared_1/output/add_1#bert_1/bert/encoder/Reshape_3/shape*
T0*,
_output_shapes
:??????????
z
bert_1/bert/encoder/Shape_5Shape/bert_1/bert/encoder/layer_shared_2/output/add_2*
_output_shapes
:*
T0
s
)bert_1/bert/encoder/strided_slice_5/stackConst*
dtype0*
_output_shapes
:*
valueB: 
u
+bert_1/bert/encoder/strided_slice_5/stack_1Const*
dtype0*
_output_shapes
:*
valueB:
u
+bert_1/bert/encoder/strided_slice_5/stack_2Const*
_output_shapes
:*
valueB:*
dtype0
?
#bert_1/bert/encoder/strided_slice_5StridedSlicebert_1/bert/encoder/Shape_5)bert_1/bert/encoder/strided_slice_5/stack+bert_1/bert/encoder/strided_slice_5/stack_1+bert_1/bert/encoder/strided_slice_5/stack_2*
T0*
shrink_axis_mask*
_output_shapes
: *
Index0
g
%bert_1/bert/encoder/Reshape_4/shape/1Const*
value	B :*
dtype0*
_output_shapes
: 
h
%bert_1/bert/encoder/Reshape_4/shape/2Const*
value
B :?*
dtype0*
_output_shapes
: 
?
#bert_1/bert/encoder/Reshape_4/shapePack#bert_1/bert/encoder/strided_slice_2%bert_1/bert/encoder/Reshape_4/shape/1%bert_1/bert/encoder/Reshape_4/shape/2*
_output_shapes
:*
N*
T0
?
bert_1/bert/encoder/Reshape_4Reshape/bert_1/bert/encoder/layer_shared_2/output/add_2#bert_1/bert/encoder/Reshape_4/shape*,
_output_shapes
:??????????*
T0
z
bert_1/bert/encoder/Shape_6Shape/bert_1/bert/encoder/layer_shared_3/output/add_3*
_output_shapes
:*
T0
s
)bert_1/bert/encoder/strided_slice_6/stackConst*
_output_shapes
:*
valueB: *
dtype0
u
+bert_1/bert/encoder/strided_slice_6/stack_1Const*
_output_shapes
:*
valueB:*
dtype0
u
+bert_1/bert/encoder/strided_slice_6/stack_2Const*
dtype0*
_output_shapes
:*
valueB:
?
#bert_1/bert/encoder/strided_slice_6StridedSlicebert_1/bert/encoder/Shape_6)bert_1/bert/encoder/strided_slice_6/stack+bert_1/bert/encoder/strided_slice_6/stack_1+bert_1/bert/encoder/strided_slice_6/stack_2*
_output_shapes
: *
Index0*
shrink_axis_mask*
T0
g
%bert_1/bert/encoder/Reshape_5/shape/1Const*
dtype0*
_output_shapes
: *
value	B :
h
%bert_1/bert/encoder/Reshape_5/shape/2Const*
dtype0*
_output_shapes
: *
value
B :?
?
#bert_1/bert/encoder/Reshape_5/shapePack#bert_1/bert/encoder/strided_slice_2%bert_1/bert/encoder/Reshape_5/shape/1%bert_1/bert/encoder/Reshape_5/shape/2*
_output_shapes
:*
N*
T0
?
bert_1/bert/encoder/Reshape_5Reshape/bert_1/bert/encoder/layer_shared_3/output/add_3#bert_1/bert/encoder/Reshape_5/shape*,
_output_shapes
:??????????*
T0
{
&bert_1/bert/pooler/strided_slice/stackConst*
dtype0*
_output_shapes
:*!
valueB"            
}
(bert_1/bert/pooler/strided_slice/stack_1Const*
_output_shapes
:*!
valueB"           *
dtype0
}
(bert_1/bert/pooler/strided_slice/stack_2Const*
dtype0*
_output_shapes
:*!
valueB"         
?
 bert_1/bert/pooler/strided_sliceStridedSlicebert_1/bert/encoder/Reshape_5&bert_1/bert/pooler/strided_slice/stack(bert_1/bert/pooler/strided_slice/stack_1(bert_1/bert/pooler/strided_slice/stack_2*
end_mask*

begin_mask*,
_output_shapes
:??????????*
Index0*
T0
?
bert_1/bert/pooler/SqueezeSqueeze bert_1/bert/pooler/strided_slice*
T0*(
_output_shapes
:??????????*
squeeze_dims

?
bert_1/bert/pooler/dense/MatMulMatMulbert_1/bert/pooler/Squeezebert/pooler/dense/kernel/read*
T0*(
_output_shapes
:??????????
?
 bert_1/bert/pooler/dense/BiasAddBiasAddbert_1/bert/pooler/dense/MatMulbert/pooler/dense/bias/read*
T0*(
_output_shapes
:??????????
z
bert_1/bert/pooler/dense/TanhTanh bert_1/bert/pooler/dense/BiasAdd*(
_output_shapes
:??????????*
T0
r
loss/l2_normalize/SquareSquarebert/bert/pooler/dense/Tanh*(
_output_shapes
:??????????*
T0
r
'loss/l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
?????????
?
loss/l2_normalize/SumSumloss/l2_normalize/Square'loss/l2_normalize/Sum/reduction_indices*'
_output_shapes
:?????????*
T0*
	keep_dims(
`
loss/l2_normalize/Maximum/yConst*
dtype0*
valueB
 *̼?+*
_output_shapes
: 
?
loss/l2_normalize/MaximumMaximumloss/l2_normalize/Sumloss/l2_normalize/Maximum/y*'
_output_shapes
:?????????*
T0
m
loss/l2_normalize/RsqrtRsqrtloss/l2_normalize/Maximum*
T0*'
_output_shapes
:?????????
?
loss/l2_normalizeMulbert/bert/pooler/dense/Tanhloss/l2_normalize/Rsqrt*(
_output_shapes
:??????????*
T0
v
loss/l2_normalize_1/SquareSquarebert_1/bert/pooler/dense/Tanh*
T0*(
_output_shapes
:??????????
t
)loss/l2_normalize_1/Sum/reduction_indicesConst*
_output_shapes
: *
valueB :
?????????*
dtype0
?
loss/l2_normalize_1/SumSumloss/l2_normalize_1/Square)loss/l2_normalize_1/Sum/reduction_indices*
T0*
	keep_dims(*'
_output_shapes
:?????????
b
loss/l2_normalize_1/Maximum/yConst*
dtype0*
_output_shapes
: *
valueB
 *̼?+
?
loss/l2_normalize_1/MaximumMaximumloss/l2_normalize_1/Sumloss/l2_normalize_1/Maximum/y*
T0*'
_output_shapes
:?????????
q
loss/l2_normalize_1/RsqrtRsqrtloss/l2_normalize_1/Maximum*
T0*'
_output_shapes
:?????????
?
loss/l2_normalize_1Mulbert_1/bert/pooler/dense/Tanhloss/l2_normalize_1/Rsqrt*(
_output_shapes
:??????????*
T0
j
loss/mulMulloss/l2_normalizeloss/l2_normalize_1*
T0*(
_output_shapes
:??????????
e
loss/Sum/reduction_indicesConst*
valueB :
?????????*
_output_shapes
: *
dtype0
c
loss/SumSumloss/mulloss/Sum/reduction_indices*
T0*#
_output_shapes
:?????????
c
loss/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"????
   
g
loss/ReshapeReshapeloss/Sumloss/Reshape/shape*'
_output_shapes
:?????????
*
T0
[
	loss/CastCastlabel_ids_1*

SrcT0*

DstT0*#
_output_shapes
:?????????
e
loss/Reshape_1/shapeConst*
_output_shapes
:*
valueB"????
   *
dtype0
l
loss/Reshape_1Reshape	loss/Castloss/Reshape_1/shape*'
_output_shapes
:?????????
*
T0
S
loss/truediv/yConst*
_output_shapes
: *
dtype0*
valueB
 *???=
g
loss/truedivRealDivloss/Reshapeloss/truediv/y*'
_output_shapes
:?????????
*
T0
]
loss/LogSoftmax
LogSoftmaxloss/truediv*'
_output_shapes
:?????????
*
T0
d

loss/mul_1Mulloss/Reshape_1loss/LogSoftmax*
T0*'
_output_shapes
:?????????

g
loss/Sum_1/reduction_indicesConst*
dtype0*
valueB :
?????????*
_output_shapes
: 
i

loss/Sum_1Sum
loss/mul_1loss/Sum_1/reduction_indices*#
_output_shapes
:?????????*
T0
I
loss/NegNeg
loss/Sum_1*
T0*#
_output_shapes
:?????????
O

loss/sub/xConst*
dtype0*
_output_shapes
: *
valueB
 *)\O?
[
loss/subSub
loss/sub/xloss/Reshape*'
_output_shapes
:?????????
*
T0
M
	loss/ReluReluloss/sub*'
_output_shapes
:?????????
*
T0
^

loss/mul_2Mulloss/Reshape_1	loss/Relu*'
_output_shapes
:?????????
*
T0
Q
loss/sub_1/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ??
a

loss/sub_1Subloss/sub_1/xloss/Reshape_1*'
_output_shapes
:?????????
*
T0
Q
loss/sub_2/yConst*
_output_shapes
: *
dtype0*
valueB
 *q=J?
_

loss/sub_2Subloss/Reshapeloss/sub_2/y*
T0*'
_output_shapes
:?????????

Q
loss/Relu_1Relu
loss/sub_2*'
_output_shapes
:?????????
*
T0
\

loss/mul_3Mul
loss/sub_1loss/Relu_1*
T0*'
_output_shapes
:?????????

Y
loss/addAdd
loss/mul_2
loss/mul_3*
T0*'
_output_shapes
:?????????

g
loss/Sum_2/reduction_indicesConst*
valueB :
?????????*
dtype0*
_output_shapes
: 
g

loss/Sum_2Sumloss/addloss/Sum_2/reduction_indices*
T0*#
_output_shapes
:?????????
U

loss/add_1Addloss/Neg
loss/Sum_2*#
_output_shapes
:?????????*
T0
`
loss/ArgMax/dimensionConst*
_output_shapes
: *
valueB :
?????????*
dtype0
{
loss/ArgMaxArgMaxloss/Reshapeloss/ArgMax/dimension*#
_output_shapes
:?????????*
output_type0*
T0
T

loss/ConstConst*
valueB: *
_output_shapes
:*
dtype0
J
	loss/MeanMean
loss/add_1
loss/Const*
_output_shapes
: *
T0

initNoOp

init_all_tablesNoOp

init_1NoOp
4

group_depsNoOp^init^init_1^init_all_tables
Y
save/filename/inputConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
n
save/filenamePlaceholderWithDefaultsave/filename/input*
_output_shapes
: *
dtype0*
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
shape: *
dtype0*
_output_shapes
: 
?
save/StringJoin/inputs_1Const*
_output_shapes
: *<
value3B1 B+_temp_1c0dc90ef5f84cadbc6b399e023233ef/part*
dtype0
d
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: 
Q
save/num_shardsConst*
_output_shapes
: *
dtype0*
value	B :
k
save/ShardedFilename/shardConst"/device:CPU:0*
dtype0*
_output_shapes
: *
value	B : 
?
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
?	
save/SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?Bbert/embeddings/LayerNorm/betaBbert/embeddings/LayerNorm/gammaB#bert/embeddings/position_embeddingsB%bert/embeddings/token_type_embeddingsBbert/embeddings/word_embeddingsB!bert/embeddings/word_embeddings_2B9bert/encoder/layer_shared/attention/output/LayerNorm/betaB:bert/encoder/layer_shared/attention/output/LayerNorm/gammaB5bert/encoder/layer_shared/attention/output/dense/biasB7bert/encoder/layer_shared/attention/output/dense/kernelB1bert/encoder/layer_shared/attention/self/key/biasB3bert/encoder/layer_shared/attention/self/key/kernelB3bert/encoder/layer_shared/attention/self/query/biasB5bert/encoder/layer_shared/attention/self/query/kernelB3bert/encoder/layer_shared/attention/self/value/biasB5bert/encoder/layer_shared/attention/self/value/kernelB1bert/encoder/layer_shared/intermediate/dense/biasB3bert/encoder/layer_shared/intermediate/dense/kernelB/bert/encoder/layer_shared/output/LayerNorm/betaB0bert/encoder/layer_shared/output/LayerNorm/gammaB+bert/encoder/layer_shared/output/dense/biasB-bert/encoder/layer_shared/output/dense/kernelBbert/pooler/dense/biasBbert/pooler/dense/kernelBglobal_step
?
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*E
value<B:B B B B B B B B B B B B B B B B B B B B B B B B B 
?	
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesbert/embeddings/LayerNorm/betabert/embeddings/LayerNorm/gamma#bert/embeddings/position_embeddings%bert/embeddings/token_type_embeddingsbert/embeddings/word_embeddings!bert/embeddings/word_embeddings_29bert/encoder/layer_shared/attention/output/LayerNorm/beta:bert/encoder/layer_shared/attention/output/LayerNorm/gamma5bert/encoder/layer_shared/attention/output/dense/bias7bert/encoder/layer_shared/attention/output/dense/kernel1bert/encoder/layer_shared/attention/self/key/bias3bert/encoder/layer_shared/attention/self/key/kernel3bert/encoder/layer_shared/attention/self/query/bias5bert/encoder/layer_shared/attention/self/query/kernel3bert/encoder/layer_shared/attention/self/value/bias5bert/encoder/layer_shared/attention/self/value/kernel1bert/encoder/layer_shared/intermediate/dense/bias3bert/encoder/layer_shared/intermediate/dense/kernel/bert/encoder/layer_shared/output/LayerNorm/beta0bert/encoder/layer_shared/output/LayerNorm/gamma+bert/encoder/layer_shared/output/dense/bias-bert/encoder/layer_shared/output/dense/kernelbert/pooler/dense/biasbert/pooler/dense/kernelglobal_step"/device:CPU:0*'
dtypes
2	
?
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
?
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
:*
N
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0
?
save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
_output_shapes
: *
T0
?	
save/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:*?
value?B?Bbert/embeddings/LayerNorm/betaBbert/embeddings/LayerNorm/gammaB#bert/embeddings/position_embeddingsB%bert/embeddings/token_type_embeddingsBbert/embeddings/word_embeddingsB!bert/embeddings/word_embeddings_2B9bert/encoder/layer_shared/attention/output/LayerNorm/betaB:bert/encoder/layer_shared/attention/output/LayerNorm/gammaB5bert/encoder/layer_shared/attention/output/dense/biasB7bert/encoder/layer_shared/attention/output/dense/kernelB1bert/encoder/layer_shared/attention/self/key/biasB3bert/encoder/layer_shared/attention/self/key/kernelB3bert/encoder/layer_shared/attention/self/query/biasB5bert/encoder/layer_shared/attention/self/query/kernelB3bert/encoder/layer_shared/attention/self/value/biasB5bert/encoder/layer_shared/attention/self/value/kernelB1bert/encoder/layer_shared/intermediate/dense/biasB3bert/encoder/layer_shared/intermediate/dense/kernelB/bert/encoder/layer_shared/output/LayerNorm/betaB0bert/encoder/layer_shared/output/LayerNorm/gammaB+bert/encoder/layer_shared/output/dense/biasB-bert/encoder/layer_shared/output/dense/kernelBbert/pooler/dense/biasBbert/pooler/dense/kernelBglobal_step
?
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:*E
value<B:B B B B B B B B B B B B B B B B B B B B B B B B B 
?
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*'
dtypes
2	*x
_output_shapesf
d:::::::::::::::::::::::::
?
save/AssignAssignbert/embeddings/LayerNorm/betasave/RestoreV2*
T0*1
_class'
%#loc:@bert/embeddings/LayerNorm/beta*
_output_shapes	
:?
?
save/Assign_1Assignbert/embeddings/LayerNorm/gammasave/RestoreV2:1*
T0*
_output_shapes	
:?*2
_class(
&$loc:@bert/embeddings/LayerNorm/gamma
?
save/Assign_2Assign#bert/embeddings/position_embeddingssave/RestoreV2:2* 
_output_shapes
:
??*6
_class,
*(loc:@bert/embeddings/position_embeddings*
T0
?
save/Assign_3Assign%bert/embeddings/token_type_embeddingssave/RestoreV2:3*
T0*8
_class.
,*loc:@bert/embeddings/token_type_embeddings*
_output_shapes
:	?
?
save/Assign_4Assignbert/embeddings/word_embeddingssave/RestoreV2:4*
T0*!
_output_shapes
:̾?*2
_class(
&$loc:@bert/embeddings/word_embeddings
?
save/Assign_5Assign!bert/embeddings/word_embeddings_2save/RestoreV2:5*
T0*4
_class*
(&loc:@bert/embeddings/word_embeddings_2* 
_output_shapes
:
??
?
save/Assign_6Assign9bert/encoder/layer_shared/attention/output/LayerNorm/betasave/RestoreV2:6*
_output_shapes	
:?*
T0*L
_classB
@>loc:@bert/encoder/layer_shared/attention/output/LayerNorm/beta
?
save/Assign_7Assign:bert/encoder/layer_shared/attention/output/LayerNorm/gammasave/RestoreV2:7*M
_classC
A?loc:@bert/encoder/layer_shared/attention/output/LayerNorm/gamma*
T0*
_output_shapes	
:?
?
save/Assign_8Assign5bert/encoder/layer_shared/attention/output/dense/biassave/RestoreV2:8*
_output_shapes	
:?*H
_class>
<:loc:@bert/encoder/layer_shared/attention/output/dense/bias*
T0
?
save/Assign_9Assign7bert/encoder/layer_shared/attention/output/dense/kernelsave/RestoreV2:9* 
_output_shapes
:
??*J
_class@
><loc:@bert/encoder/layer_shared/attention/output/dense/kernel*
T0
?
save/Assign_10Assign1bert/encoder/layer_shared/attention/self/key/biassave/RestoreV2:10*
T0*D
_class:
86loc:@bert/encoder/layer_shared/attention/self/key/bias*
_output_shapes	
:?
?
save/Assign_11Assign3bert/encoder/layer_shared/attention/self/key/kernelsave/RestoreV2:11* 
_output_shapes
:
??*
T0*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/key/kernel
?
save/Assign_12Assign3bert/encoder/layer_shared/attention/self/query/biassave/RestoreV2:12*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/query/bias*
T0*
_output_shapes	
:?
?
save/Assign_13Assign5bert/encoder/layer_shared/attention/self/query/kernelsave/RestoreV2:13* 
_output_shapes
:
??*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/query/kernel*
T0
?
save/Assign_14Assign3bert/encoder/layer_shared/attention/self/value/biassave/RestoreV2:14*
T0*
_output_shapes	
:?*F
_class<
:8loc:@bert/encoder/layer_shared/attention/self/value/bias
?
save/Assign_15Assign5bert/encoder/layer_shared/attention/self/value/kernelsave/RestoreV2:15*H
_class>
<:loc:@bert/encoder/layer_shared/attention/self/value/kernel* 
_output_shapes
:
??*
T0
?
save/Assign_16Assign1bert/encoder/layer_shared/intermediate/dense/biassave/RestoreV2:16*D
_class:
86loc:@bert/encoder/layer_shared/intermediate/dense/bias*
_output_shapes	
:?	*
T0
?
save/Assign_17Assign3bert/encoder/layer_shared/intermediate/dense/kernelsave/RestoreV2:17*F
_class<
:8loc:@bert/encoder/layer_shared/intermediate/dense/kernel*
T0* 
_output_shapes
:
??	
?
save/Assign_18Assign/bert/encoder/layer_shared/output/LayerNorm/betasave/RestoreV2:18*B
_class8
64loc:@bert/encoder/layer_shared/output/LayerNorm/beta*
_output_shapes	
:?*
T0
?
save/Assign_19Assign0bert/encoder/layer_shared/output/LayerNorm/gammasave/RestoreV2:19*
_output_shapes	
:?*
T0*C
_class9
75loc:@bert/encoder/layer_shared/output/LayerNorm/gamma
?
save/Assign_20Assign+bert/encoder/layer_shared/output/dense/biassave/RestoreV2:20*
T0*
_output_shapes	
:?*>
_class4
20loc:@bert/encoder/layer_shared/output/dense/bias
?
save/Assign_21Assign-bert/encoder/layer_shared/output/dense/kernelsave/RestoreV2:21*
T0* 
_output_shapes
:
?	?*@
_class6
42loc:@bert/encoder/layer_shared/output/dense/kernel
?
save/Assign_22Assignbert/pooler/dense/biassave/RestoreV2:22*)
_class
loc:@bert/pooler/dense/bias*
_output_shapes	
:?*
T0
?
save/Assign_23Assignbert/pooler/dense/kernelsave/RestoreV2:23*
T0*+
_class!
loc:@bert/pooler/dense/kernel* 
_output_shapes
:
??
y
save/Assign_24Assignglobal_stepsave/RestoreV2:24*
_output_shapes
: *
_class
loc:@global_step*
T0	
?
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_2^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"?+
trainable_variables?+?+
?
!bert/embeddings/word_embeddings:0&bert/embeddings/word_embeddings/Assign&bert/embeddings/word_embeddings/read:02>bert/embeddings/word_embeddings/Initializer/truncated_normal:08
?
#bert/embeddings/word_embeddings_2:0(bert/embeddings/word_embeddings_2/Assign(bert/embeddings/word_embeddings_2/read:02@bert/embeddings/word_embeddings_2/Initializer/truncated_normal:08
?
'bert/embeddings/token_type_embeddings:0,bert/embeddings/token_type_embeddings/Assign,bert/embeddings/token_type_embeddings/read:02Dbert/embeddings/token_type_embeddings/Initializer/truncated_normal:08
?
%bert/embeddings/position_embeddings:0*bert/embeddings/position_embeddings/Assign*bert/embeddings/position_embeddings/read:02Bbert/embeddings/position_embeddings/Initializer/truncated_normal:08
?
 bert/embeddings/LayerNorm/beta:0%bert/embeddings/LayerNorm/beta/Assign%bert/embeddings/LayerNorm/beta/read:022bert/embeddings/LayerNorm/beta/Initializer/zeros:08
?
!bert/embeddings/LayerNorm/gamma:0&bert/embeddings/LayerNorm/gamma/Assign&bert/embeddings/LayerNorm/gamma/read:022bert/embeddings/LayerNorm/gamma/Initializer/ones:08
?
7bert/encoder/layer_shared/attention/self/query/kernel:0<bert/encoder/layer_shared/attention/self/query/kernel/Assign<bert/encoder/layer_shared/attention/self/query/kernel/read:02Tbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal:08
?
5bert/encoder/layer_shared/attention/self/query/bias:0:bert/encoder/layer_shared/attention/self/query/bias/Assign:bert/encoder/layer_shared/attention/self/query/bias/read:02Gbert/encoder/layer_shared/attention/self/query/bias/Initializer/zeros:08
?
5bert/encoder/layer_shared/attention/self/key/kernel:0:bert/encoder/layer_shared/attention/self/key/kernel/Assign:bert/encoder/layer_shared/attention/self/key/kernel/read:02Rbert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal:08
?
3bert/encoder/layer_shared/attention/self/key/bias:08bert/encoder/layer_shared/attention/self/key/bias/Assign8bert/encoder/layer_shared/attention/self/key/bias/read:02Ebert/encoder/layer_shared/attention/self/key/bias/Initializer/zeros:08
?
7bert/encoder/layer_shared/attention/self/value/kernel:0<bert/encoder/layer_shared/attention/self/value/kernel/Assign<bert/encoder/layer_shared/attention/self/value/kernel/read:02Tbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal:08
?
5bert/encoder/layer_shared/attention/self/value/bias:0:bert/encoder/layer_shared/attention/self/value/bias/Assign:bert/encoder/layer_shared/attention/self/value/bias/read:02Gbert/encoder/layer_shared/attention/self/value/bias/Initializer/zeros:08
?
9bert/encoder/layer_shared/attention/output/dense/kernel:0>bert/encoder/layer_shared/attention/output/dense/kernel/Assign>bert/encoder/layer_shared/attention/output/dense/kernel/read:02Vbert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal:08
?
7bert/encoder/layer_shared/attention/output/dense/bias:0<bert/encoder/layer_shared/attention/output/dense/bias/Assign<bert/encoder/layer_shared/attention/output/dense/bias/read:02Ibert/encoder/layer_shared/attention/output/dense/bias/Initializer/zeros:08
?
;bert/encoder/layer_shared/attention/output/LayerNorm/beta:0@bert/encoder/layer_shared/attention/output/LayerNorm/beta/Assign@bert/encoder/layer_shared/attention/output/LayerNorm/beta/read:02Mbert/encoder/layer_shared/attention/output/LayerNorm/beta/Initializer/zeros:08
?
<bert/encoder/layer_shared/attention/output/LayerNorm/gamma:0Abert/encoder/layer_shared/attention/output/LayerNorm/gamma/AssignAbert/encoder/layer_shared/attention/output/LayerNorm/gamma/read:02Mbert/encoder/layer_shared/attention/output/LayerNorm/gamma/Initializer/ones:08
?
5bert/encoder/layer_shared/intermediate/dense/kernel:0:bert/encoder/layer_shared/intermediate/dense/kernel/Assign:bert/encoder/layer_shared/intermediate/dense/kernel/read:02Rbert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal:08
?
3bert/encoder/layer_shared/intermediate/dense/bias:08bert/encoder/layer_shared/intermediate/dense/bias/Assign8bert/encoder/layer_shared/intermediate/dense/bias/read:02Ebert/encoder/layer_shared/intermediate/dense/bias/Initializer/zeros:08
?
/bert/encoder/layer_shared/output/dense/kernel:04bert/encoder/layer_shared/output/dense/kernel/Assign4bert/encoder/layer_shared/output/dense/kernel/read:02Lbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal:08
?
-bert/encoder/layer_shared/output/dense/bias:02bert/encoder/layer_shared/output/dense/bias/Assign2bert/encoder/layer_shared/output/dense/bias/read:02?bert/encoder/layer_shared/output/dense/bias/Initializer/zeros:08
?
1bert/encoder/layer_shared/output/LayerNorm/beta:06bert/encoder/layer_shared/output/LayerNorm/beta/Assign6bert/encoder/layer_shared/output/LayerNorm/beta/read:02Cbert/encoder/layer_shared/output/LayerNorm/beta/Initializer/zeros:08
?
2bert/encoder/layer_shared/output/LayerNorm/gamma:07bert/encoder/layer_shared/output/LayerNorm/gamma/Assign7bert/encoder/layer_shared/output/LayerNorm/gamma/read:02Cbert/encoder/layer_shared/output/LayerNorm/gamma/Initializer/ones:08
?
bert/pooler/dense/kernel:0bert/pooler/dense/kernel/Assignbert/pooler/dense/kernel/read:027bert/pooler/dense/kernel/Initializer/truncated_normal:08
?
bert/pooler/dense/bias:0bert/pooler/dense/bias/Assignbert/pooler/dense/bias/read:02*bert/pooler/dense/bias/Initializer/zeros:08"%
saved_model_main_op


group_deps"k
global_step\Z
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0"?

model_variables?
?

?
 bert/embeddings/LayerNorm/beta:0%bert/embeddings/LayerNorm/beta/Assign%bert/embeddings/LayerNorm/beta/read:022bert/embeddings/LayerNorm/beta/Initializer/zeros:08
?
!bert/embeddings/LayerNorm/gamma:0&bert/embeddings/LayerNorm/gamma/Assign&bert/embeddings/LayerNorm/gamma/read:022bert/embeddings/LayerNorm/gamma/Initializer/ones:08
?
;bert/encoder/layer_shared/attention/output/LayerNorm/beta:0@bert/encoder/layer_shared/attention/output/LayerNorm/beta/Assign@bert/encoder/layer_shared/attention/output/LayerNorm/beta/read:02Mbert/encoder/layer_shared/attention/output/LayerNorm/beta/Initializer/zeros:08
?
<bert/encoder/layer_shared/attention/output/LayerNorm/gamma:0Abert/encoder/layer_shared/attention/output/LayerNorm/gamma/AssignAbert/encoder/layer_shared/attention/output/LayerNorm/gamma/read:02Mbert/encoder/layer_shared/attention/output/LayerNorm/gamma/Initializer/ones:08
?
1bert/encoder/layer_shared/output/LayerNorm/beta:06bert/encoder/layer_shared/output/LayerNorm/beta/Assign6bert/encoder/layer_shared/output/LayerNorm/beta/read:02Cbert/encoder/layer_shared/output/LayerNorm/beta/Initializer/zeros:08
?
2bert/encoder/layer_shared/output/LayerNorm/gamma:07bert/encoder/layer_shared/output/LayerNorm/gamma/Assign7bert/encoder/layer_shared/output/LayerNorm/gamma/read:02Cbert/encoder/layer_shared/output/LayerNorm/gamma/Initializer/ones:08"?+
	variables?+?+
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0
?
!bert/embeddings/word_embeddings:0&bert/embeddings/word_embeddings/Assign&bert/embeddings/word_embeddings/read:02>bert/embeddings/word_embeddings/Initializer/truncated_normal:08
?
#bert/embeddings/word_embeddings_2:0(bert/embeddings/word_embeddings_2/Assign(bert/embeddings/word_embeddings_2/read:02@bert/embeddings/word_embeddings_2/Initializer/truncated_normal:08
?
'bert/embeddings/token_type_embeddings:0,bert/embeddings/token_type_embeddings/Assign,bert/embeddings/token_type_embeddings/read:02Dbert/embeddings/token_type_embeddings/Initializer/truncated_normal:08
?
%bert/embeddings/position_embeddings:0*bert/embeddings/position_embeddings/Assign*bert/embeddings/position_embeddings/read:02Bbert/embeddings/position_embeddings/Initializer/truncated_normal:08
?
 bert/embeddings/LayerNorm/beta:0%bert/embeddings/LayerNorm/beta/Assign%bert/embeddings/LayerNorm/beta/read:022bert/embeddings/LayerNorm/beta/Initializer/zeros:08
?
!bert/embeddings/LayerNorm/gamma:0&bert/embeddings/LayerNorm/gamma/Assign&bert/embeddings/LayerNorm/gamma/read:022bert/embeddings/LayerNorm/gamma/Initializer/ones:08
?
7bert/encoder/layer_shared/attention/self/query/kernel:0<bert/encoder/layer_shared/attention/self/query/kernel/Assign<bert/encoder/layer_shared/attention/self/query/kernel/read:02Tbert/encoder/layer_shared/attention/self/query/kernel/Initializer/truncated_normal:08
?
5bert/encoder/layer_shared/attention/self/query/bias:0:bert/encoder/layer_shared/attention/self/query/bias/Assign:bert/encoder/layer_shared/attention/self/query/bias/read:02Gbert/encoder/layer_shared/attention/self/query/bias/Initializer/zeros:08
?
5bert/encoder/layer_shared/attention/self/key/kernel:0:bert/encoder/layer_shared/attention/self/key/kernel/Assign:bert/encoder/layer_shared/attention/self/key/kernel/read:02Rbert/encoder/layer_shared/attention/self/key/kernel/Initializer/truncated_normal:08
?
3bert/encoder/layer_shared/attention/self/key/bias:08bert/encoder/layer_shared/attention/self/key/bias/Assign8bert/encoder/layer_shared/attention/self/key/bias/read:02Ebert/encoder/layer_shared/attention/self/key/bias/Initializer/zeros:08
?
7bert/encoder/layer_shared/attention/self/value/kernel:0<bert/encoder/layer_shared/attention/self/value/kernel/Assign<bert/encoder/layer_shared/attention/self/value/kernel/read:02Tbert/encoder/layer_shared/attention/self/value/kernel/Initializer/truncated_normal:08
?
5bert/encoder/layer_shared/attention/self/value/bias:0:bert/encoder/layer_shared/attention/self/value/bias/Assign:bert/encoder/layer_shared/attention/self/value/bias/read:02Gbert/encoder/layer_shared/attention/self/value/bias/Initializer/zeros:08
?
9bert/encoder/layer_shared/attention/output/dense/kernel:0>bert/encoder/layer_shared/attention/output/dense/kernel/Assign>bert/encoder/layer_shared/attention/output/dense/kernel/read:02Vbert/encoder/layer_shared/attention/output/dense/kernel/Initializer/truncated_normal:08
?
7bert/encoder/layer_shared/attention/output/dense/bias:0<bert/encoder/layer_shared/attention/output/dense/bias/Assign<bert/encoder/layer_shared/attention/output/dense/bias/read:02Ibert/encoder/layer_shared/attention/output/dense/bias/Initializer/zeros:08
?
;bert/encoder/layer_shared/attention/output/LayerNorm/beta:0@bert/encoder/layer_shared/attention/output/LayerNorm/beta/Assign@bert/encoder/layer_shared/attention/output/LayerNorm/beta/read:02Mbert/encoder/layer_shared/attention/output/LayerNorm/beta/Initializer/zeros:08
?
<bert/encoder/layer_shared/attention/output/LayerNorm/gamma:0Abert/encoder/layer_shared/attention/output/LayerNorm/gamma/AssignAbert/encoder/layer_shared/attention/output/LayerNorm/gamma/read:02Mbert/encoder/layer_shared/attention/output/LayerNorm/gamma/Initializer/ones:08
?
5bert/encoder/layer_shared/intermediate/dense/kernel:0:bert/encoder/layer_shared/intermediate/dense/kernel/Assign:bert/encoder/layer_shared/intermediate/dense/kernel/read:02Rbert/encoder/layer_shared/intermediate/dense/kernel/Initializer/truncated_normal:08
?
3bert/encoder/layer_shared/intermediate/dense/bias:08bert/encoder/layer_shared/intermediate/dense/bias/Assign8bert/encoder/layer_shared/intermediate/dense/bias/read:02Ebert/encoder/layer_shared/intermediate/dense/bias/Initializer/zeros:08
?
/bert/encoder/layer_shared/output/dense/kernel:04bert/encoder/layer_shared/output/dense/kernel/Assign4bert/encoder/layer_shared/output/dense/kernel/read:02Lbert/encoder/layer_shared/output/dense/kernel/Initializer/truncated_normal:08
?
-bert/encoder/layer_shared/output/dense/bias:02bert/encoder/layer_shared/output/dense/bias/Assign2bert/encoder/layer_shared/output/dense/bias/read:02?bert/encoder/layer_shared/output/dense/bias/Initializer/zeros:08
?
1bert/encoder/layer_shared/output/LayerNorm/beta:06bert/encoder/layer_shared/output/LayerNorm/beta/Assign6bert/encoder/layer_shared/output/LayerNorm/beta/read:02Cbert/encoder/layer_shared/output/LayerNorm/beta/Initializer/zeros:08
?
2bert/encoder/layer_shared/output/LayerNorm/gamma:07bert/encoder/layer_shared/output/LayerNorm/gamma/Assign7bert/encoder/layer_shared/output/LayerNorm/gamma/read:02Cbert/encoder/layer_shared/output/LayerNorm/gamma/Initializer/ones:08
?
bert/pooler/dense/kernel:0bert/pooler/dense/kernel/Assignbert/pooler/dense/kernel/read:027bert/pooler/dense/kernel/Initializer/truncated_normal:08
?
bert/pooler/dense/bias:0bert/pooler/dense/bias/Assignbert/pooler/dense/bias/read:02*bert/pooler/dense/bias/Initializer/zeros:08*?
serving_default?
-
	label_ids 
label_ids_1:0?????????
5
input_ids_a&
input_ids_a_1:0?????????
5
input_ids_b&
input_ids_b_1:0?????????
9
segment_ids_a(
segment_ids_a_1:0?????????
7
input_mask_a'
input_mask_a_1:0?????????
7
input_mask_b'
input_mask_b_1:0?????????
9
segment_ids_b(
segment_ids_b_1:0?????????%
sims

loss/Sum:0?????????tensorflow/serving/predict