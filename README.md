<div align="justify">

The Book of R is a resource intended to help you become proficient in R
as a first programming language, motivated by the statistical analysis of
data. The goal is to lay a comprehensive foundation of the
computational aspects of modern data science.
The book is structured by first focusing on R as a computational and
programming tool and then shifting gears to discuss using R for
probability, statistics, and data exploration and modeling. You’ll build
your knowledge progressively, and most chapters end with a table
summarizing important commands and operators for quick reference.
# Part I: The Language
Part I, which covers the fundamental syntax and object types used
across all aspects of R programming, is essential for beginners.
## Chapter 1: Getting Started Provides instruction on installing R
and explains the default appearance of the software’s graphical user
interface. Basic workflow is explained, as is the common step ofinstalling a contributed package of code. The coverage is
purposefully kept concise; topics are expounded upon in the
appendices.
## Chapter 2: Numerics, Arithmetic, Assignment, and Vectors
Introduces the basics of simple arithmetic, as well as the creation
and assignment of objects in the workspace. The key object type of
vectors and their behavior is explored.
## Chapter 3: Matrices and Arrays Extends the discussion of
vectors to encompass higher-dimensional object types. Matrices are
defined, in terms of both their representation in R and their
mathematical properties, as is the more general class of array-type
objects. Common tasks, such as subsetting these objects, are
explored in detail.
## Chapter 4: Non-Numeric Values Explores important data types
such as logical (true/false) values, character strings, factors, and datetimes. A comprehensive treatment of each of these, including typical
operations and use-cases, is given.
## Chapter 5: Lists and Data Frames Details the larger, more
general object types of lists and data frames. Data frames in
particular are the main type of object used for storage of datasets,
exploratory data analysis, data visualization, and subsequent
statistical modeling.
## Chapter 6: Special Values, Classes, and Coercion Covers how
R represents important special values such as missing observations.
The chapter also examines how to interrogate a particular object for
its type, as well as how to distinguish between different object types.
## Chapter 7: Basic Plotting Provides a primer on plotting, using
both built-in and contributed functionality via the ggplot2 package.
These basic skills lay the groundwork for creating common
statistical plots and more advanced graphical design, both of which
are detailed in later parts of the book.
## Chapter 8: Reading and Writing Files Teaches the
fundamentals of reading in data from external files, essential foranalyzing your own data. You’ll also consider how to write out your
data to external files, such as plaintext files or comma-separated,
spreadsheet-style files, as well as write out specific R objects that can
subsequently be used in a different R session.
# Part II: Programming
Part II focuses on getting you familiar with the syntax and behavior
of R’s programming mechanisms.
## Chapter 9: Calling Functions Introduces basic technicalities to
help you understand how R interprets your commands. Topics
include environments, the search path, and argument matching.
## Chapter 10: Conditions and Loops Explores fundamental
programming structures, such as the conditional if...else statements
used to control the flow of your code and different types of loops for
repeating specified operations.
## Chapter 11: Writing Functions Covers writing your own
executable R functions, facilitated by skills learned in the
immediately preceding chapters. You’ll learn how to handle
arguments and formally return results. Specialized functions, such as
anonymous no-name functions and those that recursively call
themselves, are also discussed.
## Chapter 12: Exceptions, Timings, and Visibility Deals with
additional topics relevant to executing R functions. These include
handling warnings and errors, measuring function execution time,
and profiling code to determine where computational bottlenecks
might lie.
# Part III: Statistics and Probability
With a firm handle on R as a language, you’ll shift your attention to
statistical thinking in Part III.
## Chapter 13: Elementary Statistics Introduces you to basic
statistical and data-related tasks. You’ll look at importantterminology used to describe variables; elementary summary
statistics such as the mean, variance, quantiles, and correlation; and
how these statistics are implemented in R.
## Chapter 14: Basic Data Visualization Combines knowledge
from the preceding chapter with important code from Chapter 7 as
a foundation for visually exploring your data with both base R and
ggplot2 functionality. You’ll learn when and how to use and customize
common statistical plots such as histograms, box plots, and
scatterplots.
## Chapter 15: Probability Gives a primer on key concepts related
to the statistical understanding of probability, including the ideas of
random variables and their probability distributions.
## Chapter 16: Common Probability Distributions Extends the
fu
ndamental definitions of the preceding chapter to look at the R
implementation and statistical interpretation of some well-known
probability distributions.
# Part IV: Statistical Testing and Modeling
Part IV introduces statistical uncertainty, hypothesis testing, and
linear regression models. Linear regression represents just one class
of parametric models and is a natural starting point for learning
about statistical regression. Similarly, the R syntax and output used
to fit, summarize, predict from, and diagnose linear models of this
kind are much the same for other regression models, so once you’re
comfortable with these chapters, you’ll be ready to tackle the R
implementation of morecomplicated models covered in moreadvanced texts with relative ease.
## Chapter 17: Sampling Distributions and Confidence Takes the
general idea of a probability distribution and lends it to statistics
estimated from data. You are thereby introduced to sampling
distributions—the fundamental building block of statistical
inference—and corresponding confidence intervals.
## Chapter 18: Hypothesis Testing Details the fundamentals of
hypothesis testing from an applied, example-driven perspective. It
explains the meaning of p-values and demonstrates implementation
and interpretation using R.
## Chapter 19: Analysis of Variance Discusses basics of the
common analysis of variance (ANOVA) procedure and covers design
of the corresponding hypotheses, their interpretation, and
implementation of ANOVA in R.
## Chapter 20: Simple Linear Regression Introduces regression
models, using the simplest setting in which you aim to model (or
predict) the value of one variable based on the value of another.
Basic theory, notation, and terminology are covered, as is the
implementation and interpretation of such models.
## Chapter 21: Multiple Linear Regression Extends the
discussions of the preceding chapter to examine linear regression
models with more than one predictor variable. This involves new
ideas around interpretation of the fitted model, dealing with variable
transformation, as well as capturing more-complex relationships in
your data via interactive effects.
## Chapter 22: Linear Model Selection and Diagnostics
Discusses methods for selecting an appropriate linear model and
assessing the validity of that model with various diagnostic tools.
Taken together, Parts III and IV represent much of what you’d
expect to see in first- and second-year college statistics courses. My
aim is to keep mathematical details to a minimum and focus on
implementation and interpretation. I’ll provide references to other
resources where necessary if you’re interested in looking more
closely at the underlying theory.
# Part V: Advanced Graphics
The final part looks at moreadvanced graphing skills. Though not
strictly necessary, it’s helpful to have some familiarity with the linearregression methods discussed in Part IV before tackling Part V,
since some of the examples in this last part use fitted linear models.
## Chapter 23: Advanced Plot Customization Shows you how to
customize traditional R graphics, from handling the graphics devices
themselves to controlling the finer aspects of your plot’s appearance,
such as dealing with margins and displaying special textual
characters.
## Chapter 24: Going Further with the Grammar of Graphics
Explores the popular ggplot2 package further, looking at more
advanced features such as adding smooth scatterplot trends and
producing multiple plots via faceting. You’ll also examine the
interactive capabilities of the ggvis package.
## Chapter 25: Defining Colors and Plotting in Higher
Dimensions Concentrates on higher-dimensional plotting in R.
Covers color handling and 3D surface preparation before discussing
contour plots, perspective plots, and pixel images with the aid of
multiple examples.
## Chapter 26: Interactive 3D Plots Focuses on creating
interactive plots (rotated by a mouse) via the rgl package. You’ll also
see simple ways to use rgl for plotting multivariate parametric
equations.

</div>