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
