# BASIC PLOTTING
# basic mechanics of plotting via an overview of the plot function
# basics of ggplot2, a powerful library for visualizing data in R

## Using plot with Coordinate Vectors
foo <- c(1.1,2,3.5,3.9,4.2)
bar <- c(2,2.2,-1.3,0,0.2)
plot(foo, bar)

baz <- cbind(foo, bar)
plot(baz)
?plot.default

## Visual Controls and Graphical Parameters
## graphical parameters of plot function
## type: Tells R how to plot the supplied coordinates (for example, as stand-alone points or joined by lines or both dots and lines)
## main, xlab, ylab: Provides options to include plot title, the horizontal axis label, and the vertical axis label, respectively
## col: Chooses color (or colors) to use for plotting points and lines
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
