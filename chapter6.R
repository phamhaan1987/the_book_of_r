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
class(num.vec1)     # integer: for integer number
class(num.vec2)     # numeric: for decimal numbers (floating-point numbers)
class(char.vec)     # character
class(logic.vec)    # logical
class(fac.vec)      # factor

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
class(char.mat)     # "matrix" "array"
class(logic.mat)    # "matrix" "array"
