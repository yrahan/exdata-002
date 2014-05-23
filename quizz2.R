library(ggplot2)
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)
?xyplot

?panel.lines

library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)

?trellis.par.set


library(datasets)
data(airquality)

?data

qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)


library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)

qplot(votes, rating, data = movies)


qplot(votes, rating, data = movies) + stats_smooth("loess")
qplot(votes, rating, data = movies, smooth = "loess")
qplot(votes, rating, data = movies) + geom_smooth()
qplot(votes, rating, data = movies, panel = panel.loess)
