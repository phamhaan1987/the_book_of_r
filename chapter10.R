# CONDITIONS AND LOOPS

## if Statements
## An if statement can check the condition of only a single logical value

### Stand-Alone Statement
### if(condition){
###    do any code in here
### }
a <- 3
mynumber <- 4
if (a <= mynumber) {
    a <- a^2
}
a

myvec <- c(2.73,5.40,2.15,5.29,1.36,2.16,1.41,6.97,7.99,9.52)
myvec
mymat <- matrix(c(2,0,1,2,3,0,3,0,1,1),5,2)
mymat
if (any((myvec-1)>9) || matrix(myvec,2,5)[2,1]<=6) {
    cat("Condition satisfied --\n")
    new.myvec <- myvec
    new.myvec[seq(1,9,2)] <- NA
    mylist <- list(aa=new.myvec,bb=mymat+0.5)
    cat("-- a list with", length(mylist), "members now exists.")
}
mylist
(myvec-1)>9
any((myvec-1)>9)
matrix(myvec,2,5)[2,1]
matrix(myvec,2,5)[2,1] <= 6

### else Statements
### if(condition){
###     do any code in here if condition is TRUE
### } else {
###     do any code in here if condition is FALSE
### }
a <- 3
mynumber <- 4
if (a <= mynumber) {
    cat("Condition was", a<=mynumber)
    a <- a^2
} else {
    cat("Condition was", a<=mynumber)
    a <- a-3.5
}
a

### Element-Wise Checks with ifelse
if(c(FALSE,TRUE,FALSE,TRUE,TRUE)){}     # Error in if: the condition has length > 1
x <- 5
y <- -5:5
y == 0
result <- ifelse(test=y==0, yes=NA, no=x/y)
result

## Exercises ##
vec1 <- c(2,1,1,3,2,1,0)
vec2 <- c(3,8,2,2,0,0,0)
if((vec1[1]+vec2[2])==10){ cat("Print me!") }
if(vec1[1]>=2&&vec2[1]>=2){ cat("Print me!") }
if(all((vec2-vec1)[c(2,6)]<7)){ cat("Print me!") }
if(!is.na(vec2[3])){ cat("Print me!") }

ifelse(test=(vec1+vec2)>3, yes=vec1*vec2, no=vec1+vec2)

mymat <- matrix(as.character(1:16),4,4)
mymat <- matrix(c("DANDELION","Hyacinthus","Gerbera","MARIGOLD","geranium","ligularia","Pachysandra","SNAPDRAGON","GLADIOLUS"),3,3)
mymat <- matrix(c("GREAT","exercises","right","here"),2,2,byrow=T)

mymat
if (any(substr(diag(mymat),1,1) == "g" | substr(diag(mymat),1,1) == "G")) {
    diag(mymat) <- ifelse(test=substr(diag(mymat),1,1)=="g"|substr(diag(mymat),1,1)=="G", yes="HERE", no=diag(mymat))
} else {
    mymat <- diag(x=nrow(mymat))
}
mymat

### Nested and Stacked Statements
a <- 6
mynumber <- 4

if (a<=mynumber) {
    cat("First condition was TRUE\n")
    a <- a^2
    if (mynumber>3) {
        cat("Second condition was TRUE")
        b <- seq(1,a,length=mynumber)
    } else {
        cat("Second condition was FALSE")
        b <- a*mynumber
    }
} else {
    cat("First condition was FALSE\n")
    a <- a-3.5
    if(mynumber>=4){
        cat("Second condition was TRUE")
        b <- a^(3-mynumber)
    } else {
        cat("Second condition was FALSE")
        b <- rep(a+mynumber,times=3)
    }
}
a
b

if (a<=mynumber && mynumber>3) {
    cat("Same as 'first condition TRUE and second TRUE'")
    a <- a^2
    b <- seq(1,a,length=mynumber)
} else if (a<=mynumber && mynumber<=3) {
    cat("Same as 'first condition TRUE and second FALSE'")
    a <- a^2
    b <- a*mynumber
} else if (mynumber>=4) {
    cat("Same as 'first condition FALSE and second TRUE'")
    a <- a-3.5
    b <- a^(3-mynumber)
} else {
    cat("Same as 'first condition FALSE and second FALSE'")
    a <- a-3.5
    b <- rep(a+mynumber,times=3)
}

### The switch Function
mystring <- "Lisa"

if (mystring=="Homer") {
    foo <- 12
} else if (mystring=="Marge") {
    foo <- 34
} else if (mystring=="Bart") {
    foo <- 56
} else if (mystring=="Lisa") {
    foo <- 78
} else if (mystring=="Maggie") {
    foo <- 90
} else {
    foo <- NA
}
foo

mystring <- "Lisa"
foo <- switch(EXPR=mystring, Homer=12,Marge=34,Bart=56,Lisa=78,Maggie=90,NA)
foo

mystring <- "Peter"
foo <- switch(EXPR=mystring, Homer=12,Marge=34,Bart=56,Lisa=78,Maggie=90,NA)
foo

mynumber <- 3
foo <- switch(mynumber,12,34,56,78,NA)
foo

mynumber <- 0
foo <- switch(mynumber,12,34,56,78,NA)
foo

## Exercises ##
mynumber <- 0
if (mynumber==1) {
    foo <- 12
} else if (mynumber==2) {
    foo <- 34
} else if (mynumber==3) {
    foo <- 56
} else if (mynumber==4) {
    foo <- 78
} else if (mynumber==5) {
    foo <- NA
} else {
    foo <- NULL
}
foo

# lowdose <- 12.5
# meddose <- 25.3
# highdose <- 58.1
# doselevel <- factor(c("Low","High","High","High","Low","Med","Med"), levels=c("Low","Med","High"))

lowdose <- 12.5
meddose <- 25.3
highdose <- 58.1
doselevel <- factor(c("Low","Low","Low","Med","Low","Med","Med"), levels=c("Low","Med","High"))

# lowdose <- 9
# meddose <- 49
# highdose <- 61
# doselevel <- factor(c("Low","Med","Med"), levels=c("Low","Med","High"))

# lowdose <- 9
# meddose <- 49
# highdose <- 61
# doselevel <- factor(c("Low","High","High","High","Low","Med","Med"), levels=c("Low","Med","High"))

if (any(doselevel=="High")) {
    if (lowdose>=10) {
        lowdose <- 10
    } else {
        lowdose <- lowdose/2
    }
    if (meddose>=26) {
        meddose <- 26
    }
    if (highdose<60) {
        highdose <- 60
    } else {
        highdose <- highdose*1.5
    }
    dosage <- rep(x=lowdose, times=length(doselevel))
    dosage[doselevel=="Med"] <- meddose
    dosage[doselevel=="High"] <- highdose
} else {
    doselevel <- droplevels(doselevel)
    levels(doselevel) <- c("Small","Large")
    if (lowdose<15&&meddose<35) {
        lowdose <- lowdose/2
        meddose <- meddose+highdose
    }
    dosage <- rep(x=lowdose, times=length(doselevel))
    dosage[doselevel=="Large"] <- meddose
}

doselevel
dosage

mynum <- 0
switch(as.character(mynum),"0"="zero","1"="one","2"="two","3"="three","4"="four","5"="five","6"="six","7"="seven","8"="eight","9"="nine")

## for Loops
## A loop is a core programming mechanism that repeats a specified section of code, typically while incrementing an index or counter. There are two main styles of looping: the for loop and the while loop.

### Definition and Basics
### The R for loop takes the following general form:
### for (loopindex in loopvector) {
###     do any code in here
### }
for (myitem in 5:7) {
    cat("--BRACED AREA BEGINS--\n")
    cat("the current item is", myitem, "\n")
    cat("--BRACED AREA ENDS--\n\n")
}

counter <- 0
for (myitem in 5:7) {
    counter <- counter+1
    cat("The item in run", counter, "is", myitem, "\n")
}

str(ChickWeight)
head(ChickWeight, 6)
chick.ids <- levels(ChickWeight$Chick)
chick.ids
chick.total <- 0
for (i in 1:length(chick.ids)) {
    chick.weights <- ChickWeight[ChickWeight$Chick==chick.ids[i],"weight"]
    maxweight <- max(chick.weights)
    chick.total <- chick.total + maxweight
}
chick.avg <- chick.total/length(chick.ids)
chick.avg

### Via Index or Value
myvec <- c(0.4,1.1,0.34,0.55)
for (i in myvec) {
    print(2*i)
}

for (i in 1:length(myvec)) {
    print(2*myvec[i])
}

foo <- list(aa=c(3.4,1),bb=matrix(1:4,2,2),cc=matrix(c(T,T,F,T,F,F),3,2), dd="string here",ee=matrix(c("red","green","blue","yellow")))
foo
name <- names(foo)
name
is.mat <- rep(NA, length((name)))
nr <- is.mat
nc <- is.mat
data.type <- is.mat
for (i in 1:length(name)) {
    if (is.matrix(foo[[i]])) {
        is.mat[i] <- "Yes"
        nr[i] <- nrow(foo[[i]])
        nc[i] <- ncol(foo[[i]])
        data.type[i] <- class(as.vector(foo[[i]]))
    } else {
        is.mat[i] <- "No"
    }
}
bar <- data.frame(name, is.mat, nr, nc, data.type)
bar

### Nests
loopvec1 <- 5:7
loopvec1
loopvec2 <- 9:6
loopvec2
foo <- matrix(NA, length(loopvec1), length(loopvec2))
foo
for (i in 1:length(loopvec1)) {
    for (j in 1:length(loopvec2)) {
        foo[i,j] <- loopvec1[i]*loopvec2[j]
    }
}
foo

foo <- matrix(NA,length(loopvec1),length(loopvec2))
foo
for (i in 1:length(loopvec1)) {
    for (j in 1:i) {
        foo[i,j] <- loopvec1[i]+loopvec2[j]
    }
}
foo

## Exercises ##
loopvec1 <- 5:7
loopvec2 <- 9:6
foo <- matrix(NA, length(loopvec1), length(loopvec2))
# for (i in 1:length(loopvec2)) {
#     foo[,i] <- loopvec1*loopvec2[i]
# }
for (i in 1:length(loopvec1)) {
    foo[i,] <- loopvec1[i]*loopvec2
}
foo

mystring <- "Lisa"
switch(EXPR=mystring,Homer=12,Marge=34,Bart=56,Lisa=78,Maggie=90,NA)
mystr_vec <- c("Peter","Homer","Lois","Stewie","Maggie","Bart")
mynum_vec <- rep(NA, times=length(mystr_vec))
for (i in 1:length(mystr_vec)) {
    mynum_vec[i] <- switch(EXPR=mystr_vec[i],Homer=12,Marge=34,Bart=56,Lisa=78,Maggie=90,NA)
}
mynum_vec

str(ChickWeight)
head(ChickWeight, 6)
chick.ids <- levels(ChickWeight$Chick)
chick.ids
chick.total <- 0
for (i in chick.ids) {
    chick.weights <- ChickWeight[ChickWeight$Chick==i,"weight"]
    maxweight <- max(chick.weights)
    chick.total <- chick.total + maxweight
}
chick.avg <- chick.total/length(chick.ids)
chick.avg

# mylist <- list(aa=c(3.4,1),
#             bb=matrix(1:4,2,2),
#             cc=matrix(c(T,T,F,T,F,F),3,2),
#             dd="string here",
#             ee=list(c("hello","you"),matrix(c("hello","there"))),
#             ff=matrix(c("red","green","blue","yellow")))
# mylist <- list("tricked you",as.vector(matrix(1:6,3,2)))
mylist <- list(list(1,2,3),
            list(c(3,2),2),
            list(c(1,2),matrix(c(1,2))),rbind(1:10,100:91))
count <- 0
for (i in 1:length(mylist)) {
    if (is.list(mylist[[i]])) {
        for (j in mylist[[i]]) {
            if (is.matrix(j)) {
                count <- count+1
            }
        }
    } else {
        if (is.matrix(mylist[[i]])) {
            count <- count+1
        }
    }
}
count

## while Loops
## In contrast to for loops, you typically deploy a while loop in situations where you cannot easily determine how many times the desired operations need to be run. Instead, we build the loop based solely on a logical-valued condition.

### Definition and Basics
### while (loopcondition) {
###     do any code in here
### }
myval <- 5
while (myval<10) {
    myval <- myval+1
    cat("\n'myval' is now", myval, "\n")
    cat("'mycondition' is now", myval<10, "\n")
}

### Condition Object Modification
mylist <- list()
counter <- 1
mynumbers <- c(4,5,1,2,6,2,4,6,6,2)
mycondition <- mynumbers[counter]<=5
while (mycondition) {
    mylist[[counter]] <- diag(mynumbers[counter])
    counter <- counter+1
    if (counter<=length(mynumbers)) {
        mycondition <- mynumbers[counter]<=5
    } else {
        mycondition <- FALSE
    }
}
mylist

chick.diet1 <- ChickWeight[ChickWeight$Diet=="1",]
chick.ids <- levels(droplevels(chick.diet1$Chick))
chick.ids
length(chick.ids)
chick.total <- 0
chick.avg <- 0
chick.index <- 0
while (chick.avg<=100) {
    chick.index <- chick.index + 1
    chicksub <- chick.diet1[chick.diet1$Chick==chick.ids[chick.index],]
    maxweight <- max(chicksub$weight)
    chick.total <- chick.total + maxweight
    chick.avg <- chick.total/chick.index
}
chick.avg
chick.index
chich.ids[1:chick.index]

## Exercises ##
mynum <- 0
factorial <- 1
while (mynum > 0) {
    factorial <- factorial*mynum
    mynum <- mynum-1
}
factorial

# mystring <- "R fever"
# mystring <- "beautiful"
# mystring <- "ECCENTRIC"
# mystring <- "ElAbOrAte"
mystring <- "eeeeek!"
index <- 1
ecount <- 0
result <- mystring
while (ecount<2 && index<=nchar(mystring)) {
    if (substr(mystring,index,index)=="e" || substr(mystring,index,index)=="E") {
        ecount <- ecount+1
    }
    if (ecount==2) {
        result <- substr(mystring,1,index-1)
    } else {
        result <- substr(mystring,1,index)
    }
    index <- index+1
}
result

##  Implicit Looping
## In some situations, especially for relatively routine loops, you can avoid the need to specify some of the details associated with explicit looping by using the apply suite of functions, which provide “loop-like” behavior in a short-hand, implicit fashion.

### The apply Function
foo <- matrix(1:12,4,3)
foo
sum(foo)    # do not find the sum of each row
row.totals <- rep(NA, times=nrow(foo))
for (i in 1:nrow(foo)) {
    row.totals[i] <- sum(foo[i,])
}
row.totals

row.total2 <- apply(X=foo, MARGIN=1, FUN="sum")
row.total2
apply(X=foo,MARGIN=2,FUN=sum)

bar <- array(1:18,dim=c(3,3,2))
bar
apply(bar, 3, diag)

### Some apply Variants
dia.url <- "http://jse.amstat.org/v9n2/4Cdata.txt"
diamonds <- read.table(dia.url)
names(diamonds) <- c("Carat","Color","Clarity","Cert","Price")
head(diamonds,5)
tapply(X=diamonds$Price, INDEX=diamonds$Color, FUN=sum) # The tapply function performs operations on subsets of the object of interest, where those subsets are defined in terms of one or more factor vectors.

baz <- list(aa=c(3.4,1),
            bb=matrix(1:4,2,2),
            cc=matrix(c(T,T,F,T,F,F),3,2),
            dd="string here",ee=matrix(c("red","green","blue","yellow")))
baz
lapply(X=baz, FUN=is.matrix)    # lapply function, which operates member by member on a list. The returned value is itself a list.

sapply(X=baz, FUN=is.matrix)    # sapply function returns the same results as lapply but in the form of an array

?mapply     # Other Variants
?vapply     # Other Variants

### When to Use Implicit Loops
foo <- matrix(1:12,4,3)
foo
apply(X=foo, MARGIN=1, FUN=sort, decreasing=TRUE)

## Exercises ##
foo <- matrix(1:12,4,3)
foo
bar <- apply(X=foo, MARGIN=1, FUN=sort, decreasing=TRUE)
bar
apply(X=bar, MARGIN=2, FUN=prod)

matlist <- list(matrix(c(T,F,T,T),2,2),
                matrix(c("a","c","b","z","p","q"),3,2),
                matrix(1:8,2,4))
matlist
# for (i in 1:length(matlist)) {
#     matlist[[i]] <- t(matlist[[i]])
# }
matlist <- lapply(X=matlist, FUN="t")
matlist

qux <- array(96:1,dim=c(4,4,2,3))
qux
qux[,,2,]
apply(X=qux[,,2,],MARGIN=3, FUN=diag)
apply(X=qux[,4,,], MARGIN=3, FUN=dim)
apply(X=apply(X=qux[,4,,], MARGIN=3, FUN=dim), MARGIN=1, FUN=sum)

str(ChickWeight)
max_weights <- tapply(X=ChickWeight$weight, INDEX=ChickWeight$Chick, FUN=max)
sum(max_weights) / length(max_weights)