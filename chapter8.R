# READING AND WRITING FILES

##  R-Ready Datasets
data(package=.packages(all.available=TRUE))     # lists available ready-to-use datasets along with a one-line description

### Built-In Datasets
data(package="datasets")    # datasets contained within the built-in, automatically loaded package datasets
?ChickWeight    # a corresponding help file that contains important details about the data and how they’re organized
ChickWeight[1:15,]

### Contributed Datasets
install.packages("tseries")     #  first install the contributed package
library("tseries")      # load the specific package
data(ice.river)
??ice.river
ice.river[1:5,]

## Reading in External Data Files
### The Table Format
mydatafile <- read.table(file="data/mydatafile.txt", header=TRUE, sep=" ", na.strings="*")
mydatafile

list.files("E:/Projects/The_Book_of_R/data")    # view textual output of the contents of any folder
getwd()
setwd()
file.choose()   # open your filesystem viewer directly from the R prompt, just as any other program does

str(mydatafile)
mydatafile$sex <- factor(mydatafile$sex)
mydatafile$funny <- factor(mydatafile$funny, levels=c("Low","Med","High"))
str(mydatafile)

### Spreadsheet Workbooks
spread <- read.csv(file="data/spreadsheetfile.csv", header=FALSE, stringsAsFactors=TRUE)
spread
str(spread)
?gdata; ?XLConnect  # R packages that attempt to read .xlsx/ .xls

### Web-Based Files
dia.url <- "http://jse.amstat.org/v9n2/4Cdata.txt"
diamonds <- read.table(file=dia.url, stringsAsFactors=TRUE)
diamonds
names(diamonds) <- c("Carat","Color","Clarity","Cert","Price")
diamonds[1:5,]
str(diamonds)

### Other File Formats
?foreign    # The R package foreign or reading data files used by statistical programs such as Stata, SAS, Minitab, and SPSS
?RODBC
?RMySQL
?RJDBC

## Writing Out Data Files and Plots
### Datasets
mydatafile
write.table(x=mydatafile, file="data/somenewfile.txt", sep="@", na="??", quote=FALSE, row.names=FALSE)
?write.csv

### Plots and Graphics Files
jpeg(filename="data/myjpegplot.jpeg", width=600, height=600)
plot(1:5, 6:10, xlab="here's an xlab", ylab="a nice ylab", main="a saved .jpeg plot")
points(1:5, 10:6, cex=2, pch=4, col=2)
dev.off()

pdf(file="data/mypdfplot.pdf", width=5, height=5)
plot(1:5,6:10,ylab="a nice ylab",xlab="here's an xlab",main="a saved .pdf plot")
points(1:5,10:6,cex=2,pch=4,col=2)
dev.off()

foo <- c(1.1,2,3.5,3.9,4.2)
bar <- c(2,2.2,-1.3,0,0.2)
fb <- data.frame(foo,bar)
ggplot(fb,mapping=aes(x=foo,y=bar)) +
    geom_point(size=3,shape=8,color="darkgreen") +
    geom_line(color="orange",linetype=4)
ggsave(filename="data/mypngggplot.png")

?jpeg; ?pdf; ?postscript; ?ggsave

## Exercises ##
?quakes
str(quakes)
head(quakes)
quakes[1:10,]
quakes[quakes$mag>=5,]
write.table(x=quakes[quakes$mag>=5,], file="data/q5.txt", sep="!", quote=FALSE, row.names=FALSE)
q5.dframe <- read.table(file="data/q5.txt", header=TRUE, sep="!")
q5.dframe

.libPaths("C:/Program Files/R/R-4.5.2/library")
install.packages("car")     # install the contributed package car
library("car")      # load the car package
str(Duncan)     # inspect Duncan dataset
head(Duncan)
tail(Duncan)
Duncan[1:10,]

png(filename="data/8_1_b.png", width=500, height=500)
plot(                                   # use basic R plots
    x=NULL, y=NULL,
    type="n",
    xlim=c(0,100), ylim=c(0,100),
    main="Income by Education",
    xlab="Education", ylab="Income"
)
points(
    x=Duncan$education[Duncan$prestige<=80],
    y=Duncan$income[Duncan$prestige<=80],
    pch=1,      # type of point
    col="black"
)
points(
    x=Duncan$education[Duncan$prestige>80],
    y=Duncan$income[Duncan$prestige>80],
    pch=19,     # pch = 19': solid circle
    col="blue"
)
legend(
    x="bottomright",
    legend=c("High Prestige", "Low Prestige"),
    pch=c(1, 19),
    col=c("black", "blue"),
)
dev.off()

prestige_group <- rep("High Prestige", times=nrow(Duncan))
prestige_group[Duncan$prestige<=80] <- "Low Prestige"
ggplot(data=Duncan, mapping=aes(x=education,y=income,color=prestige_group)) + 
    geom_point() +
    labs(x="Education",y="Income",title="Income by Education") +
    xlim(0,100) +
    ylim(0,100)
ggsave(filename="data/8_1_b_2.png")

## Ad Hoc Object Read/Write Operations
x <- 8
foo <- c(1.1,2,3.5,3.9,4.2)
bar <- c(2,2.2,-1.3,0,0.2)
fb <- data.frame(foo,bar)
lookatme <- ggplot(fb,mapping=aes(x=foo,y=bar)) +
    geom_point(size=3,shape=8,color="darkgreen") +
    geom_line(color="orange",linetype=4)
somelist <- list(aa=c(5,2,45),
    bb=matrix(data=c(T,T,F,F,F,F,T,F,T),nrow=3,ncol=3),
    cc=factor(c(1,1,2,3,1,1,3),labels=c("A","B","C")))
ls()