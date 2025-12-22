# LISTS AND DATA FRAMES

## Lists of Objects
### Creating Lists and Accessing Components
foo <- list(matrix(data=1:4,nrow=2,ncol=2), c(T,F,T,T), "hello")
foo
print(foo)
length(foo)
foo[[1]]    # retrieving a member of the list is different with accessing to one entry of the vector using indexes
foo[[3]]
foo[[1]] + 5.5
foo[1] + 5.5
foo[[1]][1,2]
foo[[1]][1,]
cat(foo[[3]], "you!")
foo[[3]]
foo[[3]] <- paste(foo[[3]], "you!")
foo[[3]]
foo
foo[[c(2,3)]]   # not presented the second and the third entry of the list
foo[c(2,3)]     # show the second and the third entry of a list, like accessing a set of elements of the vector
foo[2:3]
foo[2:3][[1]]
foo[2:3][[2]]
bar <- foo[c(2,3)]
bar[[1]]
bar[[2]]

### Naming
foo
names(foo)
names(foo) <- c("mymatrix","mylogicals","mystring")
foo
names(foo)
foo[[1]]
foo$mymatrix
foo[[1]] == foo$mymatrix
all(foo$mymatrix[,2] == foo[[1]][,2])

baz <- list(tom=c(foo[[2]],T,T,T,F), dick="g'day mate", harry=foo$mymatrix*2)
baz
names(baz)

### Nesting
foo
baz
baz$bobby <- foo
baz$bobby$mylogicals
baz$bobby$mylogicals[1:3]
baz[[4]][[2]]
baz[[4]][[2]][1:3]
baz[[4]]$mylogicals
baz[[4]]$mylogicals[1:3]

## Exercises ##
a_vector = seq(from=-4, to=4, length.out=20)
a_vector
a_matrix = matrix(data=c(F,T,T,T,F,T,T,F,F), nrow=3, ncol=3, byrow=FALSE)
a_matrix
a_string = c("don","quixote")
a_string
a_factor = factor(x=c("LOW","MED","LOW","MED","MED","HIGH"), levels=c("LOW","MED","HIGH"))
a_factor
a_list = list(a_vector, a_matrix, a_string, a_factor)
a_list
a_list[[2]][c(2,1),2:3]
a_list[[3]]
a_list[[3]][1] <- "Don"
a_list[[3]][2] <- "Quixote"
a_list[[3]]
cat("\"Windmills! ATTACK!\"\n\t-\\", a_list[[3]][1], " ", a_list[[3]][2], "/-", sep="")
a_list[[1]][a_list[[1]] > 1]
which(a_list[[4]] == "MED")

b_list = list(
    facs=a_list[[4]],
    nums=c(3,2.1,3.3,4,1.5,4.9),
    oldlist=a_list[1:3]
)
b_list
length(b_list$facs) == length(b_list$nums)
b_list$facs[b_list$nums >= 1]
b_list$flags <- rep(x=b_list$oldlist[[2]][3,], times=2)
b_list
b_list$nums[!b_list$flags]
b_list$oldlist
b_list$oldlist <- "Don Quixote"
b_list$oldlist

