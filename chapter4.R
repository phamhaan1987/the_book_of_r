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

# Exercises #
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