# This is a comment in R...
1 + 1   # This works out the result of one plus one

getwd()     # check the location of the working directory
setwd("E:/Projects/The_Book_of_R")  # change the default working directory using / for all Wins, Linux and MacOS

# set path to install R packages, use administrative/root user to set the library path
.libPaths("C:/Program Files/R/R-4.5.2/library")
install.packages("languageserver")  # download and install the specific package
installed.packages()    # list all installed system/user libraries
update.packages()   # check for updates to installed packages

?mean       # access the help file for a given command or other object
??"mean"    # a list of functions whose help files contain the string of interest
help("mean")            # the same with ?
help.search("mean")     # the same with ??

