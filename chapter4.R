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
### Creating a String
foo <- "This is a character string!"
foo
length(x=foo)   # R treats the string as a single entity
nchar(x=foo)
nchar(foo)
bar <- "23.3"
bar
bar*2   # Error in bar * 2 : non-numeric argument to binary operator
"alpha" == "alpha"
"alpha" != "beta"
c("alpha","beta","gamma") == "beta"
"alpha" <= "beta"
"gamma" > "Alpha"
"Alpha" > "alpha"
"beta" >= "bEtA"
baz <- "&4 _ 3 **%.? $ymbolic non$en$e ,; "
baz

### Concatenation
qux <- c("awesome", "R", "is")
qux
length(qux)
cat(qux[2], qux[3], "totally", qux[1], "!")
paste(qux[2], qux[3], "totally", qux[1], "!")
cat(qux[2], qux[3], "totally", qux[1], "!", sep="---")
paste(qux[2], qux[3], "totally", qux[1], "!", sep="")   # by default, sep=" "
cat("Do you think ",qux[2]," ",qux[3]," ",qux[1],"?",sep="")
a <- 3
b <- 4.4
cat("The value stored as 'a' is ", a, ".", sep="")
paste("The value stored as 'b' is ",b,".",sep="")
cat("The result of a+b is ",a,"+",b,"=",a+b,".",sep="")
paste("Is ",a+b," less than 10? That's totally ",a+b<10,".",sep="")

### Escape Sequences
?Quotes
cat("here is a string\nsplit\tto new\b\n\n\tlines")
cat("I really want a backslash: \\\nand a double quote: \"")

### Substrings and Matching
foo <- "This is a character string!"
substr(x=foo, start=21, stop=27)
foo
substr(x=foo, start=1, stop=4) <- "Here"    # Change foo by assigment operator and substr function
foo
substr(x=foo, start=1, stop=4) <- "There"
foo
substr(x=foo, start=1, stop=4) <- "It"
foo
bar <- "How much wood could a woodchuck chuck"
bar
sub(pattern="chuck", replacement="hurl", x=bar)
gsub(pattern="chuck", replacement="hurl", x=bar)
?substr
?sub
?gsub
?grep

## Exercises ##
cat("The quick brown fox\n\tjumped over\n\t\tthe lazy dogs")
num1 <- 4
num2 <- 0.75
cat("The result of multiplying 4 by 0.75 is", num1*num2)
sub(pattern="tdavies", replacement="apham", x="/Users/tdavies/Documents/RBook/")
bar <- "How much wood could a woodchuck chuck"
d_str <- paste("How much wood could a woodchuck chuck", "if a woodchuck could chuck wood")
d_str
gsub(pattern="wood", replacement="metal", x=d_str)
e_str <- "Two 6-packs for $12.99"
e_str
substr(x=e_str, start=5, stop=10) == "6-pack"
sub(pattern="12", replacement="10", x=e_str)

## Factors
### Identifying Categories
firstname <- c("Liz","Jolene","Susan","Boris","Rochelle","Tim","Simon","Amy")
sex.num <- c(0,0,0,1,0,1,1,0)
sex.char <- c("female","female","female","male","female","male","male","female")
sex.num.fac <- factor(x=sex.num)
sex.num.fac
sex.char.fac <- factor(x=sex.char)
sex.char.fac
length(sex.num.fac)
length(sex.char.fac)
which(sex.char.fac == "male")
levels(sex.num.fac)     # vector of strings
levels(sex.char.fac)    # vector of strings
sex.num.fac
levels(sex.num.fac) <- c(1,2)   # Change levels of factor
levels(sex.num.fac)
sex.num.fac
sex.char.fac[2:5]
sex.char.fac[c(1:3,5,8)]
sex.num.fac == 2
sex.num.fac == "2"
firstname[sex.char.fac == "male"]
firstname[sex.char == "male"]
firstname[sex.num.fac == 2]
firstname[sex.num == 1]

### Defining and Ordering Levels
mob <- c("Apr","Jan","Dec","Sep","Nov","Jul","Jul","Jun")
mob[2]
mob[3]
mob[2] < mob[3]
mob.fac.basic <- factor(x=mob)  # two potential problems: only seven unique months and two observations categorized as “July,”, the levels of the factor aren’t arranged
mob.fac.basic
table(mob.fac.basic)
ms <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
mob.fac <- factor(x=mob, levels=ms)
mob.fac
table(mob.fac)
levels(mob.fac)
mob.fac[2]
mob.fac[3]
mob.fac[2] < mob.fac[3]
sex.char <- c("female","female","female","male","female","male","male","female")
sex.char.fac <- factor(x=sex.char)
sex.char.fac
sex.char.fac2 <- factor(x=sex.char, levels=c("male","female"))
sex.char.fac2
relevel(x=sex.char.fac, ref="male")     # Do not change the levels of original factor
sex.char.fac
relevel(x=mob.fac, ref="Dec")   # Use for unordered factor
mob.fac <- factor(x=mob, levels=ms, ordered=TRUE)   # Create an unordered factor
mob.fac
relevel(x=mob.fac, ref="Dec")   # Error: 'relevel' only for unordered factors

### Dropping Categories
mob.fac
mob.fac2 <- droplevels(mob.fac)
mob.fac2

### Working with the Numeric Representation of Factors
sex.char.fac
as.numeric(sex.char.fac)
as.numeric(x=sex.char.fac)
sex.char.fac2
as.numeric(sex.char.fac2)

### Collapsing Factors
mob.fac
table(mob.fac)
mob.fac.q <- mob.fac
mob.fac.q
levels(mob.fac.q) <- list(Q1=c("Jan","Feb","Mar"),Q2=c("Apr","May","Jun"),Q3=c("Jul","Aug","Sep"),Q4=c("Oct","Nov","Dec"))  # Change all levels of factor and all member values of factor
mob.fac.q
table(mob.fac.q)

### Combining Factors
foo <- factor(x=c("A","B","A","C"))
foo
bar <- factor(x=c("D","E","E","E"))
bar
baz <- factor(x=c(foo,bar))
baz
new.mob.values <- factor(x=c("Oct","Feb","Feb"))
new.mob.values
mob.fac.ext <- factor(x=c(mob.fac,new.mob.values))
mob.fac.ext
bad.mob.fac <- factor(x=c("Oct","Feb","FeB"))   # case sensitivity for new level
bad.mob.fac
factor(x=c(mob.fac,bad.mob.fac))    # create a new level - FeB, not use Feb

### Creating Factors from Continuous Values
Y <- c(0.53,5.4,1.5,3.33,0.45,0.01,2,4.2,1.99,1.01)
br <- c(0,2,4,6)
cut(x=Y, breaks=br)     # by default, right=TRUE, so intervals like (0,2], (2,4], (4,6]
table(cut(x=Y, breaks=br))
cut(x=Y, breaks=br, right=FALSE)    # intervals like [0,2), [2,4), [4,6)
table(cut(x=Y, breaks=br, right=FALSE))
cut(x=Y, breaks=br, right=FALSE, include.lowest=TRUE)    # intervals like [0,2), [2,4), [4,6]
table(cut(x=Y, breaks=br, right=FALSE, include.lowest=TRUE))
lab <- c("Small","Medium","Large")
cut(x=Y, breaks=br, right=FALSE, include.lowest=TRUE, labels=lab)
table(cut(x=Y, breaks=br, right=FALSE, include.lowest=TRUE, labels=lab))

## Exercises ##
sex <- rep(x="M", times=20)
sex
sex[1] <- "F"
sex[5:7] <- "F"
sex[12] <- "F"
sex[14:16] <- "F"
sex
party <- rep(x="Labour", times=20)
party
party[c(1,4,12,15,16,19)] <- "National"
party[c(6,9)] <- "Greens"
party[c(11,20)] <- "ACT"
party[10] <- "Other"
party
sex.fac <- factor(sex)
sex.fac
levels(sex.fac)
table(sex.fac)
party.fac <- factor(x=party, levels=c("Labour","National","Greens","ACT","Maori","Other"))
party.fac
levels(party.fac)
table(party.fac)
as.numeric(party.fac)
party.fac[sex.fac == "M"]
sex.fac[party.fac == "National"]
sex.fac2 <- c(sex.fac, factor(c("M","M","F","F","F","M")))
sex.fac2
table(sex.fac2)
party.fac2 <- c(party.fac, factor(c("National","Maori","Maori","Labour","ACT","Labour")))
party.fac2
table(party.fac2)
party.fac
table(party.fac)
party.fac3 <- droplevels(party.fac)
party.fac3
table(party.fac3)
confidence <- c(75,55,20,100,10,84,50,99,33,52,35,53,25,30,100,80,56,0,64,31,10,29,40,5,18,33)
confidence
confidence.fac <- cut(x=confidence, breaks=c(0,30,70,100), labels=c("Low","Moderate","High"), right=TRUE, include.lowest=TRUE)
confidence.fac
table(confidence.fac)
party.fac2
table(party.fac2)
confidence.fac[party.fac2 == "Labour"]
confidence.fac[party.fac2 == "National"]

## Dates and Times
??lubridate
### Creating and Formatting Dates
d1 <- "2025-02-19"
d2 <- "2/19/25"
d3 <- "19Feb2025"
date1 <- as.Date(x=d1)  # by default, format="%Y-%m-%d"
date1
date2 <- as.Date(x=d2, format="%m/%d/%y")
date2
date3 <- as.Date(x=d3, format="%d%b%Y")
date3
month.name  # use %B for Month as full text
month.abb   # use %b for Month as abbreviation
birthstrings <- c("Jul-4-1985","Mar-3-1954","Jul-8-1955","Oct-20-1988","Jul-26-2019")
DOB <- as.Date(x=birthstrings, format="%b-%d-%Y")
DOB
DOB[3]
which(DOB > as.Date("1985-08-01"))
format(x=DOB, format="%d")
format(x=DOB,format="%Y")
format(x=DOB,format="%b %y")
weekdays(DOB)
quarters(DOB)

### Performing Simple Operations with Dates
