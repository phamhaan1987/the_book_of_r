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

if(mystring=="Homer"){
    foo <- 12
} else if(mystring=="Marge"){
    foo <- 34
} else if(mystring=="Bart"){
    foo <- 56
} else if(mystring=="Lisa"){
    foo <- 78
} else if(mystring=="Maggie"){
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
