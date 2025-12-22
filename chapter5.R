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

## Data Frame
### Construction
mydata <- data.frame(
    person=c("Peter","Lois","Meg","Chris","Stewie"),
    age=c(42,40,17,14,1),
    sex=factor(c("M","F","F","M","M"))
)   # in a data frame, the members must all be vectors of equal length
mydata
str(mydata)
dim(mydata)
nrow(mydata)
ncol(mydata)
head(mydata, n=3)   # by default, n=6
tail(mydata, n=2)
colnames(mydata)
rownames(mydata)
dimnames(mydata)    # a list of 2 members: row names and column names

### Basic Subsets
mydata[2,2]
mydata[3:5,3]
mydata[,c(3,1)]
mydata[[2]]
mydata$age
all(mydata[[2]] == mydata$age)

### Column Insertions and Data Frame Combinations
newrecord <- data.frame(person="Brian", age=7, sex=factor("M",levels=levels(mydata$sex)))   # simply writing sex=factor("M") or even sex="M" is worked
newrecord
mydata
mydata <- rbind(mydata, newrecord)
mydata
funny <- c("High","High","Low","Med","High","Med")
funny <- factor(x=funny, levels=c("Low","Med","High"))
funny
mydata <- cbind(mydata, funny)
mydata
mydata$age.mon <- mydata$age*12
mydata
str(mydata)

### Logical Record Subsets
mydata$sex == "M"
mydata[mydata$sex=="M",]
mydata[mydata$sex=="M",-3]
mydata[mydata$sex=="M",c("person","age","funny","age.mon")]
mydata[mydata$age<10 | mydata$funny=="High",]
mydata[mydata$age>45,]

### The Explicit subset Command
mydata[mydata$age>10 | mydata$funny=="High", c("age.mon","sex")]
subset(x=mydata, subset=age>10|funny=="High", select=c("age.mon","sex"))

## Exercises ##
dframe = data.frame(
    person=c("Stan","Francine","Steve","Roger","Hayley","Klaus"),
    sex=factor(x=c("M","F","M","M","F","M"), levels=c("F","M")),
    funny=factor(x=c("High","Med","Low","High","Med","Med"), levels=c("Low","Med","High"))
)
dframe
str(dframe)
dim(dframe)
nrow(dframe)
ncol(dframe)
rownames(dframe)
colnames(dframe)
dimnames(dframe)

dframe
dframe$age <- c(41,41,15,1600,21,60)
dframe

dframe <- data.frame(person=dframe[[1]],age=dframe[[4]],sex=dframe[[2]],funny=dframe[[3]])
dframe

mydata
mydata2 <- mydata[,-5]
mydata2

mydataframe <- rbind(dframe, mydata2)
mydataframe

mydataframe[mydataframe$sex=="F"&(mydataframe$funny=="Med"|mydataframe$funny=="High"),c("person","age")]

mydataframe[substr(x=mydataframe$person,start=1,stop=1)=="S",]
subset(x=mydataframe, subset=substr(x=person,start=1,stop=1)=="S")