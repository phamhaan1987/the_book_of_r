# NON-NUMERIC VALUES
## Logical Values

### TRUE or FALSE?
foo <- TRUE
foo
bar <- F
bar
baz <- c(T,F,F,F,T,F,T,T,T,F,T,F)
baz
qux <- matrix(data=baz, nrow=3, ncol=4, byrow=foo)
qux

### A Logical Outcome: Relational Operators
1 == 2
1 > 2
(2-1) <= 2
1 != (2+3)
foo <- c(3,2,1,4,1,2,1,-1,0,3)
bar <- c(4,1,2,1,1,0,0,3,0,4)
length(foo) == length(bar)
foo == bar  # foo and bar are the same length
foo < bar   
foo <= bar
foo <= (bar+10)
baz <- foo[c(10,3)]
baz
foo > baz   # two elements of baz are recycled and checked against the elements of foo
foo < 3
foo.mat <- matrix(data=foo, nrow=5, ncol=2)
foo.mat
bar.mat <- matrix(bar, 5, 2)
bar.mat
foo.mat <= bar.mat
foo.mat < 3
qux <- foo==bar
qux
any(qux)
all(qux)
quux <- foo<=(bar+10)
quux
any(quux)
all(quux)

## Exercises ##
a_vec <- c(6,9,7,3,6,7,9,6,3,6,6,7,1,9,1)
a_vec == 6
a_vec >= 6
a_vec < (6+2)
a_vec != 6
b_array <- array(data=a_vec[-(1:3)], dim=c(2,2,3))
b_array
b_array <= (6/2+4)
b_array+2 <= (6/2+4)
diag(x=10) == 0
any(b_array <= (6/2+4))
all(b_array <= (6/2+4))
any(b_array+2 <= (6/2+4))
all(b_array+2 <= (6/2+4))
any(diag(x=(diag(10) == 0)))

### Multiple Comparisons: Logical Operators
FALSE || ((T&&TRUE)||FALSE)     # &&, ||: single logical version
!TRUE&&T
(T&&(TRUE||F))&&FALSE
(6<4) || (3!=1)
foo <- c(T,F,F,F,T,F,T,T,T,F,T,F)
foo
bar <- c(F,T,F,T,F,F,F,F,T,T,T,T)
bar
foo & bar   # element-wise logical version
foo | bar
foo && bar  # Error
foo || bar  # Error

## Exercises ##
foo <- c(7,1,7,10,5,9,10,3,10,8)
(foo > 5) | (foo == 2)
bar <- c(8,8,4,4,5,1,5,6,6,8)
(bar <= 6) & (bar != 4)
((foo > 5) | (foo == 2)) & ((bar <= 6) & (bar != 4))
baz <- foo+bar
baz
(baz >= 14) & (baz != 15)
(baz/foo > 4) | (baz/foo <= 2)
(foo > 5) || (foo == 2)     # Error

### Logicals Are Numbers!
TRUE + TRUE # In elementary numeric operations, TRUE is treated like 1, and FALSE is treated like 0
FALSE - TRUE
T+T+F+T+F+F+T
1 && 1
1 && 0
0 && 1
0 && 0
1 || 0
0 || 1
2 && 3  # by contrast, in logical operations, number not 0 is treated by TRUE, 0 is FALSE
2 || 3
2 && 0
2 || 0
0.2 && -0.5

### Logical Subsetting and Extraction
myvec <- c(5,-2.3,4,4,4,6,8,10,40221,-8)
myvec[c(F,T,F,F,F,F,F,F,F,T)]
myvec < 0
myvec[myvec<0]
myvec[c(T,F)]
myvec[(myvec>0) & (myvec<1000)]
myvec[myvec<0] <- -200
myvec
which(x=c(T,F,F,T,T))
which(x=myvec<0)
myvec[-which(myvec<0)]
A <- matrix(c(0.3,4.5,55.3,91,0.1,105.5,-4.2,8.2,27.9),nrow=3,ncol=3)
A
A[c(T,F,F), c(F,T,T)]   # the same with A[1, 2:3]
A < 1
A[A<1]
A[A<1] <- -7
A
A > 25
which(x=A>25)
which(c(A[,1],A[,2],A[,3]) > 25)    # the same with which(x=A>25)
which(x=A>25, arr.ind=FALSE)    # by default, arr.ind=FALSE
which(x=A>25, arr.ind=T)

## Exercises ##
foo <- c(7,5,6,1,2,10,8,3,8,2)
foo
bar <- foo[foo>=5]
bar
foo[-which(foo>=5)]
baz <- matrix(data=bar, nrow=2, ncol=3, byrow=TRUE)
baz
baz[baz==8] <- baz[1,2]^2
baz
all((baz<=25) & (baz>4))
qux <- array(data=c(10,5,1,4,7,4,3,3,1,3,4,3,1,7,8,3,7,3), dim=c(3,2,3))
qux
which((qux==3) | (qux==4), arr.ind=TRUE)
qux
qux[(qux<3) | (qux==7)] <- 100
qux
foo
foo[c(F,T)]
foo[c(0,1)]

## Characters
