library(lattice)
library(datasets)

# simple scatterplot
xyplot(Ozone~Wind, data=airquality)

# convert month to a factor variable
airquality <- transform(airquality, Month = factor(Month))

#  how many months are there
unique(airquality$Month)
length(unique(airquality$Month))

# plot by month
xyplot(Ozone~Wind | Month, data=airquality, layout=c(5, 1))


# lattice are objects
p <- xyplot(Ozone~Wind, data=airquality) # nothing apears
p # print now

xyplot(Ozone~Wind, data=airquality) # Auto-printing


# lattice panel functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)

f <- factor(f, labels = c("Group 1", "Group 2"))
f
y
xyplot(y ~ x | f, layout = c(2, 1))  ## Plot with 2 panels


## Custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
  panel.xyplot(x, y, ...)  ## First call the default panel function for 'xyplot'
  panel.abline(h = median(y), lty = 2)  ## Add a horizontal line at the median
})

## Custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
  panel.xyplot(x, y, ...)  ## First call default panel function
  panel.lmline(x, y, col = 2)  ## Overlay a simple linear regression line
})

