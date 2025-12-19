# Defining a Matrix
A <- matrix(data=c(-3,2,893,0.17), nrow=2, ncol=2)
A
matrix(data=c(-3,2,893,0.17))   # by default ncol=1
matrix(data=c(-3,2,893,0.17), nrow=4, ncol=1)

# Filling Direction
matrix(data=c(1,2,3,4,5,6), nrow=2, ncol=3, byrow=FALSE)    # by default, byrow=FALSE
matrix(data=c(1,2,3,4,5,6), nrow=2, ncol=3, byrow=TRUE)

# Row and Column Bindings
rbind(1:3, 4:6)
cbind(c(1,4), c(2,5), c(3,6))

# Matrix Dimensions
mymat <- rbind(c(1,3,4), 5:3, c(100,20,90), 11:13)
mymat
dim(mymat)
nrow(mymat)
ncol(mymat)
dim(mymat)[1]
dim(mymat)[2]

# Subsetting
A <- matrix(c(0.3,4.5,55.3,91,0.1,105.5,-4.2,8.2,27.9),nrow=3,ncol=3)
A
A[3,2]

# Row, Column, and Diagonal Extractions
A[,2]
A[1,]
A[2:3,]
A[,c(3,1)]
A[c(3,1),2:3]
diag(A)
diag(x=A)

# Omitting and Overwriting
A[,-2]
A[-1,3:2]
A[-1,-2]
A[-1,-c(2,3)]
B <- A
B
B[2,] <- 1:3
B
B[c(1,3),2] <- 900
B
B[,3] <- B[3,]
B
B[c(1,3), c(1,3)] <- c(-7,7)
B
B[c(1,3), 2:1] <- c(65,-65,88,-88)
B
diag(B) <- rep(x=0, times=3)
B

# Exercises
a_matrix = matrix(c(4.3, 3.1, 8.2, 8.2, 3.2, 0.9, 1.6, 6.5), nrow=4, ncol=2, byrow=TRUE)
a_matrix
dim(a_matrix)
dim(a_matrix[-2,])
dim(a_matrix[-3,])
sort(a_matrix[,2])
a_matrix[,2] <- sort(a_matrix[,2])
a_matrix
a_matrix[-4,-1]
matrix(data=a_matrix[-4,-1])
e_matrix = a_matrix[c(3,4),]
e_matrix
dim(e_matrix)
a_matrix[4,2] <- -1/2*e_matrix[1,1]
a_matrix[1,2] <- -1/2*e_matrix[2,2]
a_matrix[4,1] <- -1/2*e_matrix[1,1]
a_matrix[1,1] <- -1/2*e_matrix[2,2]
a_matrix

# Matrix Operations and Algebra
# Matrix Transpose
A <- rbind(c(2,5,2), c(6,1,4))
A
t(A)
t(t(A))

# Identity Matrix
A <- matrix(c(1,0,0,0,1,0,0,0,1), nrow=3, ncol=3, byrow=TRUE)
A
A <- rbind(c(1,0,0), c(0,1,0), c(0,0,1))
A
A <- diag(x=3)
A

# Scalar Multiple of a Matrix
A <- rbind(c(2,5,2), c(6,1,4))
a <- 2
a * A
A * a

# Matrix Addition and Subtraction
A <- cbind(c(2,5,2), c(6,1,4))
A
B <- cbind(c(-2,3,6), c(8.1,8.2,-9.8))
B
A - B
B - A
A + B

# Matrix Multiplication
A <- rbind(c(2,5,2), c(6,1,4))
A
dim(A)
B <- cbind(c(3,-1,1), c(-3,1,5))
B
dim(B)
A %*% B
B %*% A

# Matrix Inversion
A <- matrix(data=c(3,4,1,2), nrow=2, ncol=2)
A
solve(A)
A %*% solve(A)
solve(A) %*% A

# Exercises
2/7 * (cbind(c(1,2,7), c(2,4,6)) - cbind(c(10,30,50), c(20,40,60)))
A <- matrix(c(1,2,7), nrow=3, ncol=1)
A
B <- cbind(c(3,4,8))
B
A %*% B # Error in A %*% B : non-conformable arguments
t(A) %*% B
t(B) %*% (A%*%t(A))
(A%*%t(A)) %*% t(B)     # Error
solve(B%*%t(B) + A%*%t(A) - 100*diag(x=3))
A <- diag(x=4)
A
diag(A) <- c(2,3,5,-1)
A
A <- diag(x=c(2,3,5,-1))
A
solve(A)%*%A - diag(x=4)
dim(solve(A)%*%A - diag(x=4))

# Multidimensional Arrays
# Definition
AR <- array(data=1:24, dim=c(3,4,2))
AR
BR <- array(data=rep(1:24, times=3), dim=c(3,4,2,3))
BR

# Subsets, Extractions and Replacements
AR <- array(data=1:24, dim=c(3,4,2))
AR
AR[2,,2]
AR[2,c(3,1),2]
AR[1,,]
BR[2,1,1,3]
BR[1,,,1]
BR[,,2,]
BR[3:2,4,,]
BR[2,,1,]

# Exercises
a_array = array(data=seq(from=4.8, to=0.1, length.out=48), dim=c(4,2,6))
a_array
b_array = a_array[c(4,1),2,]
b_array
c_array = array(data=rep(x=b_array[2,], times=4), dim=c(2,2,2,3))
c_array
d_array = a_array[,,-6]
d_array
d_array[c(2,4),2,c(1,3,5)] <- -99
d_array
