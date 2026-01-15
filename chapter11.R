# WRITING FUNCTIONS
# Learn about writing your own R functions, how to define and use arguments, return output from a function, and specialize your functions in other ways

## The function Command
## To define a function, use the function command and assign the results to an object name. After that, call the function using that object name just like any other built-in or contributed function in the workspace.

### Function Creation
### A function definition always follows this general format:
### functionname <- function(arg1,arg2,arg3,...) {
###     do any code in here when called
###     return (returnobject)
### }

myfib <- function() {
    fib.a <- 0
    fib.b <- 1
    cat(fib.a, ", ", fib.b, ", ", sep="")
    repeat {
        temp <- fib.a+fib.b
        fib.a <- fib.b
        fib.b <- temp
        cat(fib.b, ", ", sep="")
        if (fib.b>150) {
            cat("BREAK NOW...")
            break
        }
    }
}
myfib()

myfib2 <- function(thresh) {
    fib.a <- 0
    fib.b <- 1
    cat(fib.a, ", ", fib.b, ", ", sep="")
    repeat {
        temp <- fib.a+fib.b
        fib.a <- fib.b
        fib.b <- temp
        cat(fib.b, ", ", sep="")
        if (fib.b>thresh) {
            cat("BREAK NOW...")
            break
        }
    }
}
myfib2(thresh=150)
myfib2(1000000)

myfib3 <- function(thresh){
    fibseq <- c(0,1)
    counter <- 2
    repeat{
        fibseq <- c(fibseq,fibseq[counter-1]+fibseq[counter])
        counter <- counter+1
        if (fibseq[counter]>thresh) {
            break
        }
    }
    return (fibseq)
}
myfib3(150)
foo <- myfib3(10000)
foo
foo[1:7]

### The return Statement
dummy1 <- function() {
    aa <- 2.5
    bb <- "string me along"
    cc <- "string 'em up"
    dd <- 4:8
}

dummy2 <- function() {
    aa <- 2.5
    bb <- "string me along"
    cc <- "string 'em up"
    dd <- 4:8
    return(dd)
}

foo <- dummy1()
foo
bar <- dummy2()
bar

dummy3 <- function(){
    aa <- 2.5
    bb <- "string me along"
    return(aa)
    cc <- "string 'em up"
    dd <- 4:8
    return(bb)
}

baz <- dummy3()
baz

## Exercises ##
myfib4 <- function(thresh=150, printme=TRUE) {
    fib <- c(0,1)
    counter <- 2
    while (fib[counter] <= thresh) {
        counter <- counter+1
        fib[counter] <- fib[counter-1]+fib[counter-2]
    }
    if (printme) {
        cat(fib, "BREAK NOW...")
    } else {
        return (fib)
    }
}
myfib4(thresh=150, printme=TRUE)
myfib4(1000000, T)
myfib4(150, FALSE)
myfib4(1000000, printme=F)

myfac <- function(int) {
    fac <- 1
    while (int>0) {
        fac <- fac*int
        int <- int-1
    }
    return (fac)
}
myfac(5)
myfac(12)
myfac(0)

myfac2 <- function(int=0) {
    if (int<0) {
        return (NaN)
    } else {
        fac <- 1
        while (int>0) {
            fac <- fac*int
            int <- int-1
        }
        return (fac)
    }
}
myfac2(int=-6)
myfac2(5)

## Arguments
### Considering Lazy Evaluation
### R evaluates the defined expressions lazily, dictating that argument values are sought or evaluated only at the moment they are required during execution.
multiples1 <- function(x, mat, str1, str2) {
    matrix.flags <- sapply(x,FUN=is.matrix)
    if (!any(matrix.flags)) {
        return(str1)
    }
    indexes <- which(matrix.flags)
    counter <- 0
    result <- list()
    for(i in indexes) {
        temp <- x[[i]]
        if (ncol(temp)==nrow(mat)) {
            counter <- counter+1
            result[[counter]] <- temp%*%mat
        }
    }
    if (counter==0) {
        return (str2)
    } else {
        return (result)
    }
}

foo <- list(matrix(1:4,2,2),"not a matrix","definitely not a matrix",matrix(1:8,2,4),matrix(1:8,4,2))
bar <- list(1:4,"not a matrix",c(F,T,T,T),"??")
baz <- list(1:4,"not a matrix",c(F,T,T,T),"??",matrix(1:8,2,4))

multiples1(x=foo, mat=diag(2), str1="no matrices in 'x'", str2="matrices in 'x' but none of appropriate dimensions given 'mat'")
multiples1(x=bar, mat=diag(2), str1="no matrices in 'x'", str2="matrices in 'x' but none of appropriate dimensions given 'mat'")
multiples1(x=baz, mat=diag(2), str1="no matrices in 'x'", str2="matrices in 'x' but none of appropriate dimensions given 'mat'")

multiples1(x=foo,mat=diag(2))   # no initializtion of 'str'1, 'str2' because they're not evaluated in function in case of specific 'foo'
multiples1(x=bar,mat=diag(2))   # Error in multiples1(): argument "str1" is missing, with no default

### Setting Defaults
multiples2 <- function(x, mat, str1="no valid matrices", str2=str1) {
    matrix.flags <- sapply(x,FUN=is.matrix)
    if (!any(matrix.flags)) {
        return (str1)
    } 
    indexes <- which(matrix.flags)
    counter <- 0
    result <- list()
    for (i in indexes) {
        temp <- x[[i]]
        if (ncol(temp)==nrow(mat)) {
            counter <- counter+1
            result[[counter]] <- temp%*%mat
        }
    }
    if (counter==0) {
        return (str2)
    } else {
        return (result)
    }
}
multiples2(foo, mat=diag(2))
multiples2(bar, mat=diag(2))
multiples2(baz, mat=diag(2))

### Checking for Missing Arguments
multiples3 <- function(x,mat,str1,str2) {
    matrix.flags <- sapply(x,FUN=is.matrix)
    if (!any(matrix.flags)) {
        if (missing(str1)) {
            return ("'str1' was missing, so this is the message")
        } else {
            return (str1)
        }
    }
    indexes <- which(matrix.flags)
    counter <- 0
    result <- list()
    for (i in indexes) {
        temp <- x[[i]]
        if (ncol(temp)==nrow(mat)) {
            counter <- counter+1
            result[[counter]] <- temp%*%mat
        }
    }
    if (counter==0) {
        if(missing(str2)){
            return ("'str2' was missing, so this is the message")
        } else {
            return (str2)
        }
    } else {
        return (result)
    }
}
multiples3(foo, mat=diag(2))
multiples3(bar, mat=diag(2))
multiples3(baz, mat=diag(2))

### Dealing with Ellipses
myfibplot <- function(thresh,plotit=TRUE,...) {
    fibseq <- c(0,1)
    counter <- 2
    repeat{
        fibseq <- c(fibseq,fibseq[counter-1]+fibseq[counter])
        counter <- counter+1
        if (fibseq[counter]>thresh) {
            break
        }
    }

    if (plotit) {
        plot(0:(length(fibseq)-1),fibseq,...)
    } else {
        return (fibseq)
    }
}
myfibplot(150)
myfibplot(150,type="b",pch=4,lty=2,main="Terms of the Fibonacci sequence",ylab="Fibonacci number",xlab="Term (n)")

unpackme <- function(...){
    x <- list(...)
    cat("Here is ... in its entirety as a list:\n")
    print(x)
    cat("\nThe names of ... are:", names(x), "\n\n")
    cat("\nThe classes of ... are:", sapply(x,function(y){class(y)[1]}))
}
unpackme(aa=matrix(1:4,2,2),bb=TRUE,cc=c("two","strings"),dd=factor(c(1,1,2,1)))

## Exercises ##
F <- function(P, i, t=12, y, plotit=TRUE,...) {
    balances <- c()
    for (index in 1:y) {
        balances[index] <- P*((1+i/(100*t))^(t*index))
    }
    print(plotit)
    if (plotit) {
        plot(x=1:y,y=balances,type="s",...)
    } else {
        return (balances)
    }
}
F(5000,4.4,y=10,plotit=FALSE)

quadratic.equation <- function(k1, k2, k3) {
    if (missing(k1) || missing(k2) || missing(k3)) {
        return ("The calculations of the quadratic equation are not possible!")
    }
    if (k1==0) {
        if (k2==0) {
            if (k3==0) {
                return ("The quadratic equation has infinite real roots!")
            } else {
                return ("The quadratic equation has no real root!")
            }
        } else {
            return (-k3/k2)
        }
    } else {
        delta <- k2^2-4*k1*k3
        if (delta==0) {
            return (-k2/(2*k1))
        } else {
            if (delta>0) {
                return (c((-k2+delta^0.5)/(2*k1), (-k2-delta^0.5)/(2*k1)))
            } else {
                return ("The quadratic equation has no real root!")
            }
        }
    }
}
quadratic.equation(2,-1,-5)
quadratic.equation(1,1,1)
quadratic.equation(4,4,1)
quadratic.equation(1.3, -8, -3.13)
quadratic.equation(2.25, -3, 1)
quadratic.equation(1.4, -2.2, -5.1)
quadratic.equation(-5, 10.11, -9.9)
quadratic.equation(0,0,0)
quadratic.equation(0,0,1)
quadratic.equation(0,-2,3)
quadratic.equation(1,2)
quadratic.equation(1)

## Specialized Functions
## three kinds of specialized user-defined functions: helper functions, anonymous functions, recursive functions

### Helper Functions
### Externally Defined
multiples_helper_ext <- function(x,matrix.flags,mat) {
    indexes <- which(matrix.flags)
    counter <- 0
    result <- list()
    for (i in indexes) {
        temp <- x[[i]]
        if (ncol(temp)==nrow(mat)) {
        counter <- counter+1
        result[[counter]] <- temp%*%mat
        }
    }
    return (list(result,counter))
}

multiples4 <- function(x,mat,str1="no valid matrices",str2=str1) {
    matrix.flags <- sapply(x,FUN=is.matrix)
    if (!any(matrix.flags)) {
        return(str1)
    }
    helper.call <- multiples_helper_ext(x,matrix.flags,mat)
    result <- helper.call[[1]]
    counter <- helper.call[[2]]
    if(counter==0){
        return (str2)
    } else {
        return (result)
    }
}
### Internally Defined
multiples5 <- function(x,mat,str1="no valid matrices",str2=str1) {
    matrix.flags <- sapply(x,FUN=is.matrix)
    if (!any(matrix.flags)) {
        return(str1)
    }

    multiples_helper_int <- function(x,matrix.flags,mat) {
        indexes <- which(matrix.flags)
        counter <- 0
        result <- list()
        for (i in indexes) {
            temp <- x[[i]]
            if (ncol(temp)==nrow(mat)) {
                counter <- counter+1
                result[[counter]] <- temp%*%mat
            }
        }
        return (list(result,counter))
    }

    helper.call <- multiples_helper_int(x,matrix.flags,mat)
    result <- helper.call[[1]]
    counter <- helper.call[[2]]
    if (counter==0) {
        return (str2)
    } else {
        return (result)
    }
}

### Anonymous Functions
foo <- matrix(c(2,3,3,4,2,4,7,3,3,6,7,2),3,4)
foo
apply(foo,MARGIN=2,FUN=function(x){sort(rep(x,2))})

### Recursive Functions
myfibrec <- function(n) {
    if(n==0||n==1) {
        return (n)
    } else {
        return (myfibrec(n-1)+myfibrec(n-2))
    }
}
myfibrec(4)

## Exercises ##
foo <- list("a",c("b","c","d","e"),"f",c("g","h","i"))
lapply(X=foo,
    FUN=function(x){
        for(i in 1:length(x)) {
            x[i] <- paste(x[i],"!",sep="")
        }
        return(x)
    }
)

recursive.factorial <- function(x) {
    if ((x==0) || (x==1)) {
        return (1)
    } else {
        return (x*recursive.factorial(x-1))
    }
}
recursive.factorial(5)
recursive.factorial(12)
recursive.factorial(0)


geolist <- function(x) {
    geo_means_vec_helper <- function(c) {
        return (prod(c)^(1/length(c)))
    }

    geo_means_mat_helper <- function(m) {
        return (apply(X=m,MARGIN=1,FUN=geo_means_vec_helper))
    }

    for (i in 1:length(x)) {
        if (is.matrix(x[[i]])) {
            x[[i]] <- geo_means_mat_helper(x[[i]])
        } else {
            x[[i]] <- geo_means_vec_helper(x[[i]])
        }
    }

    return (x)
}

foo <- list(1:3,matrix(c(3.3,3.2,2.8,2.1,4.6,4.5,3.1,9.4),4,2),matrix(c(3.3,3.2,2.8,2.1,4.6,4.5,3.1,9.4),2,4))
foo
geolist(foo)
bar <- list(1:9,matrix(1:9,1,9),matrix(1:9,9,1),matrix(1:9,3,3))
bar
geolist(bar)