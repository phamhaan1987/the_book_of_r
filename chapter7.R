# BASIC PLOTTING
# basic mechanics of plotting via an overview of the plot function
# basics of ggplot2, a powerful library for visualizing data in R

## Using plot with Coordinate Vectors
foo <- c(1.1,2,3.5,3.9,4.2)
bar <- c(2,2.2,-1.3,0,0.2)
plot(foo, bar)

baz <- cbind(foo, bar)
plot(baz)
?plot
?plot.default

## Visual Controls and Graphical Parameters
## graphical parameters of plot function
## type: Tells R how to plot the supplied coordinates (for example, as stand-alone points or joined by lines or both dots and lines)
## main, xlab (x-axis label), ylab (y-axis label): Provides options to include plot title, the horizontal axis label, and the vertical axis label, respectively
## col (color): Chooses color (or colors) to use for plotting points and lines
## pch (point character): Selects which character to use for plotting individual points
## cex (character expansion): Controls the size of plotted point characters
## lty (line type): Specifies the type of line to use to connect the points (for example, solid, dotted, or dashed)
## lwd (line width): Controls the thickness of plotted lines
## xlim, ylim (x-limits, y-limits) Provides limits for the horizontal and vertical ranges (respectively) of the plotting region
## asp (aspect ratio) Locks the per-unit size of the y-axis coordinates relative to the x-axis coordinates in terms of some multiplicative value

### Automatic Plot Types
plot(foo, bar, type="l")    # by default: type="p"
plot(foo, bar, type="b")
plot(foo, bar, type="n")    # option type="n" results in no points or lines plotted, creating an empty plot

### Title and Axis Label
plot(foo, bar, main="My lovely plot", xlab="x axis label", ylab="location y")   # by default, a basic plot doesn’t have a main title, and its axes are labeled with the names of the vectors being plotted
plot(foo, bar, type="b", main="My lovely plot\ntitle on two lines", xlab="", ylab="")

### Color
colors()    # number of uniquely named colors
plot(foo, bar, type="b", main="My lovely plot", xlab="", ylab="", col=2)    # by default, col=1 (~black)
plot(foo, bar, type="b", main="My lovely plot", xlab="", ylab="", col="seagreen4")  # There are eight possible integer values and over 650 character strings to specify color
plot(foo, bar, type="b", main="My lovely plot", xlab="", ylab="",
    col=4, pch=8, lty=2, cex=2.3, lwd=3.3)  # The pch parameter controls the character to plot individual data points, a value between 1 and 25
plot(foo, bar, type="b", main="My lovely plot", xlab="", ylab="",
    col=6, pch=15, lty=3, cex=0.7, lwd=2)   # The lty parameter, which affects the type of line drawn, can take the values 1 through 6

### Custom Region Limits
plot(foo, bar, type="b", main="My lovely plot", xlab="", ylab="",
    col=4, pch=8, lty=2, cex=2.3, lwd=3.3, xlim=c(-10,5), ylim=c(-3,3))
plot(foo, bar, type="b", main="My lovely plot", xlab="", ylab="",
    col=6, pch=15, lty=3, cex=0.7, lwd=2, xlim=c(3,5), ylim=c(-0.5,0.2))

### Aspect Ratio
plot(foo, bar, pch=19)
plot(foo, bar, pch=19, asp=1)

## Adding Points, Lines, and Text to an Existing Plot
x <- 1:20
y <- c(-1.49,3.37,2.59,-2.78,-3.94,-0.92,6.43,8.51,3.41,-8.23,
    -12.01,-6.58,2.87,14.12,9.63,-4.58,-14.78,-11.67,1.17,15.62)

plot(x, y, type="n", main="")
abline(h=c(-5,5), col="red", lty=2, lwd=2)
segments(x0=c(5,15), y0=c(-5,-5), x1=c(5,15), y1=c(5,5), col="red", lty=3, lwd=2)
points(x[y>=5],y[y>=5], pch=4, col="darkmagenta", cex=2)
points(x[y<=-5],y[y<=-5], pch=3, col="darkgreen", cex=2)
points(x[(x>=5&x<=15)&(y>-5&y<5)], y[(x>=5&x<=15)&(y>-5&y<5)], pch=19, col="blue")
points(x[(x<5|x>15)&(y>-5&y<5)], y[(x<5|x>15)&(y>-5&y<5)])
lines(x, y , lty=4)
arrows(x0=8, y0=14, x1=11, y1=2.5)
text(x=8, y=15, labels="sweet spot")
legend(
    "bottomleft",
    legend=c("overall process","sweet","standard","too big","too small","sweet y range","sweet x range"),
    pch=c(NA,19,1,4,3,NA,NA),
    lty=c(4,NA,NA,NA,NA,2,3),
    col=c("black","blue","black","darkmagenta","darkgreen","red","red"),
    lwd=c(1,NA,NA,NA,NA,2,2),
    pt.cex=c(NA,1,1,2,2,NA,NA)
)

## Exercises ##
?plot.window
plot(x=NULL, y=NULL, type="n", xlab="", ylab="", xlim=c(-3,3), ylim=c(7,13))
abline(h=c(7,13), v=c(-3,3), col="grey", lty=2, lwd=5)
text(x=0, y=10, labels="SOMETHING\nPROFOUND", cex=2)
arrows(x0=-2.5, y0=12.5, x1=-1, y1=10.5)
arrows(x0=-2.5, y0=10, x1=-1, y1=10)
arrows(x0=-2.5, y0=7.5, x1=-1, y1=9.5)
arrows(x0=2.5, y0=12.5, x1=1, y1=10.5)
arrows(x0=2.5, y0=10, x1=1, y1=10)
arrows(x0=2.5, y0=7.5, x1=1, y1=9.5)

weight <- c(55,85,75,42,93,63,58,75,89,67)
height <- c(161,185,174,154,188,178,170,167,181,178)
sex <- c("Female","Male","Male","Female","Male","Male","Female","Male","Male","Female")
plot(weight, height, type="n", main="Weight and Height by Sex", xlab="Weight (kg)", ylab="Height (cm)")
points(weight[sex=="Female"], height[sex=="Female"], col="red", pch=1, cex=2)
points(weight[sex=="Male"], height[sex=="Male"], col="green", pch=2, cex=2)
legend(
    "bottomleft",
    legend=c("Female","Male"),
    col=c("red","green"),
    pch=c(1,2),
    pt.cex=c(2,2)
)

## The ggplot2 Package
## Install ggplot2 - grammar of graphics: the concept of defining and manipulating layers

### Plotting a Toy Example
.libPaths("C:/Program Files/R/R-4.5.2/library")
install.packages("ggplot2")
library("ggplot2")

foo <- c(1.1,2,3.5,3.9,4.2)
bar <- c(2,2.2,-1.3,0,0.2)
fb <- data.frame(foo,bar)
fb
ggplot(data=fb, mapping=aes(x=foo,y=bar))
ggplot(data=fb, mapping=aes(x=foo,y=bar)) + geom_point()
ggplot(data=fb, mapping=aes(x=foo,y=bar)) + 
    geom_point() +
    ggtitle("My lovely ggpolt") +
    xlab("x asix label") + 
    ylab("location y")

baz <- plot(foo, bar)
baz
qux <- ggplot(data=fb, mapping=aes(x=foo,y=bar)) + geom_point()
qux

### Setting Appearance Constants with Geoms
ggplot(data=fb, mapping=aes(x=foo,y=bar)) +
    geom_point() + 
    geom_line()

ggplot(data=fb, mapping=aes(x=foo,y=bar)) +
    geom_point(size=3, shape=6, color="blue") + 
    geom_line(color="red", linetype=2)

myggplot <- ggplot(data=fb,mapping=aes(x=foo,y=bar)) +
    geom_line(color="red",linetype=2)
myggplot
myggplot + geom_point(size=3,shape=3,color="blue")
myggplot + geom_point(size=3,shape=7,color="blue")
??geom_

### Aesthetic Mapping with Geoms
x <- 1:20
y <- c(-1.49,3.37,2.59,-2.78,-3.94,-0.92,6.43,8.51,3.41,-8.23,
    -12.01,-6.58,2.87,14.12,9.63,-4.58,-14.78,-11.67,1.17,15.62)
xydata <- data.frame(x, y)

ptype <- rep("too_big", times=length(x))
ptype[y<=-5] <- "too_small"
ptype[(x>=5&x<=15)&(y>-5&y<5)] <- "sweet"
ptype[(x<5|x>15)&(y>-5&y<5)] <- "standard"
ptype
ptype <- factor(ptype)
ptype
xydata$ptype <- ptype
xydata
str(xydata)

gg <- ggplot(data=xydata, mapping=aes(x=x,y=y,color=ptype,shape=ptype))
gg + geom_point()
gg + geom_point(size=4) +
    geom_hline(yintercept=c(-5,5),color="red") +
    # geom_line(color="black",lty=2)
    geom_line(mapping=aes(group=1),color="black",lty=2) +   # lty=2 ~ linetype=2
    geom_segment(mapping=aes(x=5,y=-5,xend=5,yend=5),color="red",lty=3) +
    geom_segment(mapping=aes(x=15,y=-5,xend=15,yend=5),color="red",lty=3)

## Exercises ##
weight <- c(55,85,75,42,93,63,58,75,89,67)
height <- c(161,185,174,154,188,178,170,167,181,178)
sex <- factor(c("Female","Male","Male","Female","Male","Male","Female","Male","Male","Female"))
df <- data.frame(weight,height,sex)
df
str(df)

ggplot(data=df, mapping=aes(x=weight,y=height,color=sex,shape=sex)) +
    geom_point() +
    ggtitle("Weigh and Height by Sex") +
    xlab("Weight (kg)") + 
    ylab("Height (cm)")