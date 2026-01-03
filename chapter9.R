# CALLING FUNCTIONS

## Scoping
### Environments
### scoping rules with virtual environments
### There are different kinds of environments with various roles. Some important ones include: global environments, package environments and namespaces, and local or execution environments.
### Global Environments
### The global environment is the compartment set aside for user-defined objects
foo <- 4+5
bar <- "stringtastic"
ls()
### Package Environments and Namespaces
### The package environment refers to the items made available to the user by each package in R
ls("package:graphics")  # list all of the user-visible objects contained in the built-in graphics package environment
### Local/Execution Environments
### Calling a function in R creates a new environment, the local (or execution) environment. This environment contains all the objects and variables created in and visible to the function in a specific instance of that function running, including any arguments you’ve supplied to it upon execution.
youthspeak <- matrix(data=c("OMG","LOL","WTF","YOLO"),nrow=2,ncol=2)
youthspeak
### Search Path
### To access data structures and functions from environments other than the immediate global environment, R follows a search path.
### The search path is basically a list of the environments that R searches when an object is requested. If the object isn’t found in one environment, R proceeds to the next one.
### For my current session, if I request a certain object at the R prompt, the program inspects .GlobalEnv ▸ tools:RGUI▸ package:stats ▸ . . .▸ package:base in turn, stopping the search when it has found and retrieved the desired object. This is known as lexical scoping.
search()    # lexical scoping 
baz <- seq(from=0,to=3,length.out=5)
baz
environment(seq)    # look up the enclosing environment of any function using environment
environment(arrows)

library(car)    # lexical scoping rules: the car package environment in the path is inserted directly after the global environment
search()
neither.here()  # Error in neither.here() : could not find function "neither.here"
nor.here        # Error: object 'nor.here' not found

### Reserved and Protected Names
NaN <- 5    # Error in NaN <- 5 : invalid (do_set) left-hand side to assignment
False <- "confusing"
nan <- "this is"
cat(nan,False)
T <- 42
F <- TRUE
F && T
rm(list=c("False","nan","T","F"))
ls()

## Exercises ##
search()
ls("package:methods")
length(ls("package:methods"))   # 201

environment(read.table)   # namespace:utils
environment(data)           # namespace:utils
environment(matrix)         # namespace:base
environment(jpeg)           # namespace:grDevices

ls("package:graphics")
any(ls("package:graphics") == "smoothScatter")

## Argument Matching
### Exact
bar <- matrix(data=1:9,nrow=3,ncol=3,dimnames=list(c("A","B","C"),c("D","E","F")))  # using exact matching of arguments, where you write out each argument tag in full
bar
bar <- matrix(nrow=3,dimnames=list(c("A","B","C"),c("D","E","F")),ncol=3,data=1:9)  # the argument tags are fully specified, the order of the arguments doesn’t matter
bar

### Partial
bar <- matrix(nr=3,di=list(c("A","B","C"),c("D","E","F")),nc=3,dat=1:9) # Partial matching lets you identify arguments with an abbreviated tag
bar
bar <- matrix(nr=3,di=list(c("A","B","C"),c("D","E","F")),nc=3,d=1:9)   # Error in :argument 4 matches multiple formal arguments (d maybe standfors data or dimnames)

### Positional
args(matrix)    # function (data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)
bar <- matrix(1:9,3,3,F,list(c("A","B","C"),c("D","E","F")))
bar
bar <- matrix(1:9,3,3,list(c("A","B","C"),c("D","E","F")))  # Error in matrix(): invalid 'byrow' argument

### Mixed
bar <- matrix(1:9,3,3,dim=list(c("A","B","C"),c("D","E","F")))
bar

### Ellipses (~ ...)
args(data.frame)    # function (..., row.names = NULL, check.rows = FALSE, check.names = TRUE, fix.empty.names = TRUE, stringsAsFactors = FALSE)
args(plot)  # function (x, y, ...)

## Exercises ##
args(seq)   # function (...)
seq(-4,4,0.2)

array(8:1,dim=c(2,2,2))     # mixed
rep(1:2,3)                  # positional
seq(from=10,to=8,length=5)  # exact
sort(decreasing=T,x=c(2,1,1,2,0.3,3,1.3))   # exact
which(matrix(c(T,F,T,T),2,2))   # positional
which(matrix(c(T,F,T,T),2,2),a=T)   # mixed

args(plot.default)  # function (x, y = NULL, type = "p", xlim = NULL, ylim = NULL, log = "", main = NULL, sub = NULL, xlab = NULL, ylab = NULL, ann = par("ann"), axes = TRUE, frame.plot = axes, panel.first = NULL, panel.last = NULL, asp = NA, xgap.axis = NA, ygap.axis = NA, ...)

## Pipes
## A relatively recent addition to the base R language is the pipe operator, denoted by |>. Available in versions 4.1.0+, the pipe operation permits the “chaining together” of several function calls whereby the result of one call is fed directly, or piped, into the next.

### Syntax and Examples
?mtcars
str(mtcars)
head(mtcars)
mtcars |> head()    # when piping: from left to right, the object being piped automatically fills the first argument position of the destination/target function
head(mtcars, 3)
mtcars |> head(3)

?subset
subset(x=mtcars, subset=am==0, select=c("hp","mpg"))
mtcars[mtcars$am==0, c("hp","mpg")]
colMeans(subset(mtcars, am==0, c(hp,mpg)))
colMeans(subset(mtcars[mtcars$am==0, c("hp","mpg")]))
mtcars |> subset(am==0,c("hp","mpg")) |> colMeans()
mtcars %>% subset(am==0,c("hp","mpg")) %>% colMeans()

### Should You Pipe?
### The main difference between use of traditional R syntax and piped commands is that we interpret the former in an “inside-out” fashion
### (with the first operations taking place at the innermost position of function executions, and proceed outwards),
### with the latter operating in a “left-to-right” manner wherein the first operations take place on the left and proceed right.
### Either way, it’s worth noting that anything you can achieve with the use of pipe operators you can also achieve without them, and there is no performance advantage one way or another.