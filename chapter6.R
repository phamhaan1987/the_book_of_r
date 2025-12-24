# SPECIAL VALUES, CLASSES, AND COERCION

## Special Values

### NA: Not Available
### a standard special term to represent missing values, NA, Not Available
foo <- c("character","a",NA,"with","string",NA)
foo
bar <- factor(c("blue",NA,NA,"blue","green","blue",NA,"red","red",NA,"green"))
bar
baz <- matrix(c(1:3,NA,5,6,NA,8,NA),nrow=3,ncol=3)
baz
qux <- c(NA,5.89,Inf,NA,9.43,-2.35,NaN,2.10,-8.53,-7.58,NA,-4.58,2.01,NaN)
qux
is.na(qux)  # NA and NaN are different entities, but numerically they’re practically the same
which(is.nan(qux))
which(is.na(qux) & !is.nan(qux))
qux
quux <- na.omit(object=qux)
quux
3 + 2.1*NA - 4      # NA for arithmetic operations
3 * c(1,2,NA,NA,NaN,6)
NA > 76         # NA for relational operations
NA < 76         # NA
NA == Inf       # NA
NA != -Inf      # NA
NA & TRUE       # NA for logical operations
NA | TRUE       # TRUE
NA & FALSE      # FALSE
NA | FALSE      # NA      
?NA

### NULL
### the null value, NULL, to explicitly define an empty entity
### NULL is quite different from specifying a missing entity with NA
### An instance of NA clearly denotes an existing position that you can access or overwrite if necessary—not so for NULL
foo <- NULL
foo     # Printing NULL object doesn’t provide a position index because there’s no position to access
bar <- NA
bar     # the NA object, prints with an index position [1] to the console
c(2, 4, NA, 8)
length(c(2, 4, NA, 8))      # 4
c(2, 4, NULL, 8)
length(c(2, 4, NULL, 8))    # 3
c(NA, NA, NA)
c(NULL, NULL, NULL)     # NULL
opt.arg <- c("string1","string2","string3")
opt.arg
is.na(opt.arg)
is.null(opt.arg)    # return one logical value: TRUE or FALSE
opt.arg <- c(NA,NA,NA)
opt.arg
is.na((opt.arg))
opt.arg <- c(NULL,NULL,NULL)
opt.arg
is.null(opt.arg)
NULL + 53       # numeric(0): an empty vector of a type determined by the nature of the attempted operation
NULL >= 53      # logical(0)
NULL | TRUE     # logical(0)
NaN-NULL+NA/Inf # numeric(0)
foo <- list(member1=c(33,1,5.2,7),member2="NA or NULL?")
foo
foo[[3]]        # Error in foo[[3]] : subscript out of bounds
foo$member3     # NULL
foo$member3 <- NA
foo
?NULL

## Exercises ##
foo <- c(4.3,2.2,NULL,2.4,NaN,3.3,3.1,NULL,3.4,NA)
foo
length(foo)
which(x=is.na(x=foo))   # NULL is not a member of the vector, so NULL has no position in the vector
is.null(x=foo)      # the function return one logical value: TRUE or FALSE
is.na(x=foo[8])+4/NULL      # numeric(0)

b_list <- list(c(7,7,NA,3,NA,1,1,5,NA))
b_list
names(b_list)
names(b_list) <- "alpha"
names(b_list)
b_list$alpha
b_list$beta
is.null(b_list$beta)
b_list$beta <- which(is.na(b_list$alpha))
names(b_list)
b_list$beta

## Types, Classes, and Coercion
### Attributes
foo <- matrix(data=1:9, nrow=3, ncol=3)
foo
attributes(foo)     # return a list of all attributes of the object
attributes(foo)$dim
attr(x=foo, which="dim")    # the same with attributes(foo)$dim
dim(foo)    # attribute-specific function, the same with attributes(foo)$dim
bar <- matrix(data=1:9, nrow=3, ncol=3, dimnames=list(c("A","B","C"),c("D","E","F")))
bar
attributes(bar)
attributes(bar)$dimnames
dimnames(bar)
dimnames(foo)
dimnames(foo) <- list(c("A","B","C"),c("D","E","F"))
dimnames(foo)

### Object Class
#### Stand-Alone Vectors
num.vec1 <- 1:4
num.vec1
num.vec2 <- seq(from=1, to=4, length=6)
num.vec2
char.vec <- c("a","few","strings","here")
char.vec
logic.vec <- c(T,F,F,F,T,F,T,T)
logic.vec
fac.vec <- factor(c("Blue","Blue","Green","Red","Green","Yellow"))
fac.vec
class(num.vec1)     # "integer" class: for integer number
class(num.vec2)     # "numeric" class: for decimal numbers (floating-point numbers)
class(char.vec)     # "character" class
class(logic.vec)    # "logical" class
class(fac.vec)      # "factor" class
typeof(num.vec1)    # integer: type of each element of the vector
typeof(num.vec2)    # double
typeof(char.vec)    # character
typeof(logic.vec)   # logical
typeof(fac.vec)     # integer

#### Other Data Structures
####  class usually reports on the nature of the data structure, rather than the type of data stored
num.mat1 <- matrix(data=num.vec1,nrow=2,ncol=2)
num.mat1
num.mat2 <- matrix(data=num.vec2,nrow=2,ncol=3)
num.mat2
char.mat <- matrix(data=char.vec,nrow=2,ncol=2)
char.mat
logic.mat <- matrix(data=logic.vec,nrow=4,ncol=2)
logic.mat
class(num.mat1)     # "matrix" "array": class reports the structure of the object itself
class(num.mat2)     # "matrix" "array": The same behavior occurs for other object structures, like higher-dimensional arrays, lists, and data frames
class(char.mat)     # "matrix" "array": "matrix class inherits array class
class(logic.mat)    # "matrix" "array"
typeof(num.mat1)    # integer
typeof(num.mat2)    # double
typeof(char.mat)    # character
typeof(logic.mat)   # logical

class(foo)          # matrix" "array"
class(attributes(bar)$dimnames)     # list

#### Multiple Classes
ordfac.vec <- factor(
    x=c("Small","Large","Large","Regular","Small"),
    levels=c("Small","Regular","Large"),
    ordered=TRUE
)
ordfac.vec
class(ordfac.vec)   # "ordered" "factor": ordered subclass inherits factor class
typeof(ordfac.vec)  # integer
?typeof
inherits(num.vec2, what="numeric")      # TRUE
inherits(logic.vec, what="logical")     # TRUE
inherits(logic.vec, what="numeric")     # FALSE
inherits(num.mat1, what="ordered")      # FALSE
inherits(ordfac.vec, what="ordered")    # TRUE

### Is-Dot Object-Checking Functions
num.vec1 <- 1:4
num.vec1
is.integer(num.vec1)    # TRUE
is.numeric(num.vec1)    # TRUE
is.matrix(num.vec1)     # FALSE
is.data.frame(num.vec1) # FALSE
is.vector(num.vec1)     # TRUE
is.logical(num.vec1)    # FALSE

### As-Dot Coercion Functions
1:4 + c(T,F,F,T)    # Implicit coercion: logical value to integer value
foo <- 34
bar <- T
paste("Definitely foo: ", foo, "; definitely bar: ", bar, ".", sep="")  # Implicit coercion

as.numeric(c(T,F,F,T))
1:4 + as.numeric(c(T,F,F,T))

foo <- 34
foo.ch <- as.character(foo)
foo.ch
bar <- T
bar.ch <- as.character(bar)
bar.ch
paste("Definitely foo: ", foo.ch, "; definitely bar: ", bar.ch, ".", sep="")

as.numeric("32.4")
as.numeric("g'day mate")    # NA
as.logical(c("1","0","1","0","0"))  # Direct character to logical coercion is not possible
as.logical(as.numeric(c("1","0","1","0","0")))
as.logical(c(0,2,-0,-3,0.0,4.5))  # FALSE  TRUE FALSE  TRUE FALSE  TRUE

baz <- factor(x=c("male","male","female","male"))
baz
as.numeric(baz)     # coerce a factor to a numeric data type: egardless of how the levels of a given factor are actually labeled, the software refers to them internally as level 1, level 2, and so on

qux <- factor(x=c(2,2,3,5))
qux
as.numeric(qux)     #  R treats the levels of qux as level 1 (even though it has a label of 2), level 2 (which has a label of 3), and level 3

foo <- matrix(data=1:4, nrow=2, ncol=2)
foo
as.vector(foo)  # Coercion between object classes and structures: conversion of matrix object to vector object by stacking the columns into a single vector

bar <- array(data=c(8,1,9,5,5,1,3,4,3,9,8,8),dim=c(2,3,2))
bar
as.matrix(bar)
as.vector(bar)

baz <- list(var1=foo,var2=c(T,F,T),var3=factor(x=c(2,3,4,4,2)))
baz
as.data.frame(baz)  # Error: the variables don’t have matching lengths

qux <- list(var1=c(3,4,5,1),var2=c(T,F,T,T),var3=factor(x=c(4,4,2,1)))
qux
as.data.frame(qux)

## Exercises ##
foo <- array(data=1:36,dim=c(3,3,4))    # explicitly defined
foo
class(foo)      # "array"
typeof(foo)     # "integer"
bar <- as.vector(foo)   # explicitly defined
bar
class(bar)      # "integer", "vector"
typeof(bar)     # "integer"
baz <- as.character(bar)
baz
class(baz)      # "character", "vector"
typeof(baz)     # "character"
qux <- as.factor(baz)
qux
class(qux)      # "factor", "vector"
typeof(qux)     # integer
quux <- bar + c(-0.1,0.1)   # implicitly defined
quux
class(quux)     # "numeric"
typeof(quux)    # "double"

sum_foo <- is.numeric(foo) + is.integer(foo)   # TRUE + TRUE ~ 1 + 1 = 2
sum_bar <- is.numeric(bar) + is.integer(bar)   # TRUE + TRUE ~ 1 + 1 = 2
sum_baz <- is.numeric(baz) + is.integer(baz)   # FALSE + FALSE ~ 0 + 0 = 0
sum_qux <- is.numeric(qux) + is.integer(qux)   # FALSE + FALSE ~ 0 + 0 = 0
sum_quux <- is.numeric(quux) + is.integer(quux) # TRUE + FALSE ~ 1 + 0 = 1
b_factor <- factor(c(sum_foo,sum_bar,sum_baz,sum_qux,sum_quux), levels=c(0,1,2))
b_factor
as.numeric(b_factor)

c_matrix = matrix(data=2:13, nrow=3, ncol=4)
as.vector(as.character(t(c_matrix)))

d_matrix <- matrix(c(34,0,1,23,1,2,33,1,1,42,0,1,41,0,2), nrow=5, ncol=3, byrow=TRUE)
d_matrix
d_data_frame <- as.data.frame(d_matrix)
d_data_frame
str(d_data_frame)
d_data_frame$V2 <- as.logical(d_data_frame$V2)
str(d_data_frame)
d_data_frame$V3 <- as.factor(d_data_frame$V3)
str(d_data_frame)