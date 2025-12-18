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
myvec.len = length(x=myvec)
bar <- myvec[myvec.len-1]
bar
1:myvec.len
myvec
myvec[-1]
myvec
bar <- myvec[-2]
bar
