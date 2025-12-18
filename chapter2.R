# Arithmetic
# In R, standard mathematical rules apply throughout and follow the usual
# left-to-right order of operations: parentheses, exponents, multiplication,
# division, addition, subtraction (PEMDAS)

2 + 3
14 / 6
14/6 + 5
14 / (6+5)
3 ^ 2
2 ^ 3

sqrt(9)
sqrt(x=9)
sqrt(x=5.311)

10^2 + 3*60/8 - 3
5^3*(6-2) / (61-3+4)
2^(2+1) - 4 + 64^((-2)^(2.25-1/4))
(0.44*(1-.044)/34)^(1/2)

# Logarithms and Exponentials
log(x=243, base=3)
log(243, 3)
exp(3)      # e^3: Euler's number
log(20.08554)   # 3, natural log
log(20.08554, base=exp(1))  # 3, default value of base is e

# E-Notation
# When R prints large or small numbers beyond a certain threshold of significant figures,
# set at 7 by default, the numbers are displayed using the classic scientific e-notation
2342151012900   # 2.342151e+12: form x * 10^y
0.0000002533    # 2.533e-07
3.141592e-03    # 0.003141592

# Exercise
(6*2.3+42) / 3^(4.2-3.62)
sqrt((25.2 + 15 + 16.44 + 15.3 + 18.6) / 5 / 2)
log(0.3)    # log(x=3, base=exp(1))
exp(0.3)
-0.00000000423546322    # -4.235463e-09

# Assigning Objects
x <- -5
x
x = x + 1
x
mynumber = 45.2
y = mynumber * x
y
ls()

# Exercises
a = 3^2 * 4^(1/8)
print(a)
a = a / 2.33
print(a)
b = -8.2 * 10^(-13)
print(a * b)

# Creating a vector
myvec <- c(1,3,1,42)
myvec
foo <- 32.1
myvec2 <- c(3,-3,2,3.45,1e+03,64^0.5,2+(3-1.1)/9.44,foo)
myvec2
myvec3 <- c(myvec, myvec2)
myvec3

# Sequences, Repetition, Sorting, and Lengths
3:27    # Sequence
-4.2:5.7
27:3
-3:-27
foo <- 5.3
bar <- foo:(-47+1.5)    # Sequence
bar
# Sequences with seq
seq(from=3, to=27, by=5)
seq(from=3, to=27, length.out=40)
myseq <- seq(from=foo, to=(-47+1.5), by=-2.4)
myseq
myseq2 <- seq(from=foo, to=(-47+1.5), length.out=5)
myseq2
# Repetition with rep
rep(x=1, times=4)
rep(1, 4)
rep(x=c(3,62,8.3), times=3)
rep(x=1, times=3, each=2)
rep(x=c(3,62,8.3), times=3, each=2)
rep(x=c(3,62,8.3))  # by default, times=1 and each=1
foo <- 4
c(3, 8.3, rep(x=32, times=foo), seq(from=-2, to=1, length.out=foo+1))
# Sorting with sort
sort(x=c(2.5,-1,-10,3.44), decreasing=FALSE)
sort(c(2.5,-1,-10,3.44), decreasing=FALSE)
foo <- seq(from=4.3, to=5.5, length.out=8)
foo
bar <- sort(x=foo, decreasing=TRUE)
bar
sort(x=c(foo,bar), decreasing=FALSE)
# Finding a Vector Length with length
length(x=c(3,2,8,1))
length(x=5:13)
foo <- 4
bar <- c(3, 8.3, rep(x=32, times=foo), seq(from=-2, to=1, length.out=foo+1))
length(x=bar)

# Exercises
a_vector <- seq(from=5, to=-11, by=-0.3)
a_vector
a_vector <- seq(from=-11, to=5, by=0.3)
a_vector
c_vector <- rep(x=c(-1,3,-5,7,-9), times=2, each=10)
c_vector
sort(x=c_vector, decreasing=TRUE)
d_vector = c(6:12, rep(x=5.3, times=3), -3, seq(from=102, to=length(c_vector), length.out=9))
length(d_vector)

# Subsetting and Element Extraction
myvec <- c(5,-2.3,4,4,4,6,8,10,40221,-8)
length(x=myvec)
myvec[1]
myvec[2]
foo <- myvec[2]
foo
myvec[length(myvec)]
myvec[length(myvec)+1]      # NA - not available
myvec[-length(myvec)-1]     # get all entries of the original vector
myvec.len = length(x=myvec)
bar <- myvec[myvec.len-1]
bar
1:myvec.len
myvec
myvec[-1]
myvec
baz <- myvec[-2]
baz
qux <- myvec[-(myvec.len-1)]
qux
c(qux[-length(qux)], bar, qux[length(qux)])
myvec[c(1,3,5)]
1:4
foo <- myvec[1:4]
foo
length(foo):2
foo[length(foo):2]
indexes <- c(4, rep(x=2, times=3), 1, 1, 2, 3:1)
indexes
foo[indexes]
-c(1,3)
foo[-c(1,3)]
foo[c(1,-3)]    # Error: mix positive and negative indexes in a single index vector
bar <- c(3,2,4,4,1,2,4,1,0,0,5)
bar[1] = 6
bar
bar[c(2,4,6)] <- c(-2,-0.5,-1)
bar
bar[7:10] <- 100
bar

# Exercises
a_vec = c(seq(from=3, to=6, length.out=5), rep(c(2,-5.1,-33), times=2), 7/42+2)
a_vec
first_value = a_vec[1]
first_value
last_value = a_vec[length(a_vec)]
last_value
c_vec = a_vec[c(-1, -length(a_vec))]
c_vec
c(first_value, c_vec, last_value)
a_vec = sort(x=a_vec, decreasing=FALSE)
a_vec
a_vec[length(a_vec):1]
sort(x=a_vec, decreasing=TRUE)
c(rep(x=c_vec[3], times=3), rep(x=c_vec[6], times=4), c_vec[length(c_vec)])
h_vec = a_vec
h_vec
h_vec[c(1, 5:7, length(h_vec))] <- 99:95
h_vec
a_vec

# Vector-Oriented Behavior
foo <- 5.5:0.5
foo
foo - c(2,4,6,8,10,12)
bar <- c(1,-1)
foo * bar
baz <- c(1,-1,0.5,-0.5)
foo * baz   # Warning message: In foo * bar: longer object length is not a multiple of shorter object length
qux <- 3
foo + qux
foo
sum(foo)
prod(foo)
foo
foo[c(1,3,5,6)] <- c(-99,99)
foo

# Exercises
a_vec = c(2,0.5,1,2,0.5,1,2,0.5,1)
a_vec
a_vec[1:length(a_vec)] <- seq(from=1, to=1, length.out=3)
a_vec
5/9 * (c(45, 77, 20, 19, 101, 120, 212)-32)     # C = 5/9 * (F-32)
c_vec = c(2,4,6) * rep(c(1,2), each=3)  # the same with c(2,4,6,4,8,12)
c_vec
c_vec[2:5] <- c(-0.1,-100)
c_vec