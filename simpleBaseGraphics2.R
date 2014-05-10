# demo of plotting with r
x <- rnorm(100)
hist(x)

y <-rnorm(100)
plot(x, y)

# set margin
par(mar=c(2, 2, 2, 2))
plot(x, y)

# set margin, give back room for labels
par(mar=c(4, 4, 2, 2))
plot(x, y)

# plotting symbols
plot(x, y)
plot(x, y, pch = 20)
plot(x, y, pch = 19)
plot(x, y, pch = 2)
plot(x, y, pch = 3)
plot(x, y, pch = 4)

# to see examples, uncomment below
# example(point)

# legend, titel, ..
plot(x, y, pch = 20)
title("Scatterplot")
text(-2, -2, "Label")
legend("topleft", "Data", pch=20)
# linear regression
fit <- lm(y ~ x)
# add that line
abline(fit)
# thicness
abline(fit, lwd=3)
# color
abline(fit, lwd=3, col="blue")

#
plot(x, y, xlab="Weight", ylab="Height", main="Scatterplot", pch=20)
legend("topright", legend="Data", pch=20)
fit <- lm(y ~ x)
abline(fit, lwd=3, col="red")
z <- rpois(100, 2)
par(mfrow=c(2, 1))
plot(x, y, pch=20)
plot(x, z, pch=19)
# read margin values
par("mar")
# readjust them cause they are a bit too large
par(mar=c(2, 2, 1, 1))
plot(x, y, pch=20)
plot(x, z, pch=19)


#
par(mfrow=c(1, 2))
par(mar=c(4, 4, 2, 2))
plot(x, y, pch=20)
plot(x, z, pch=19)


#
par(mfrow=c(2, 2))
plot(x, y, pch=20)
plot(x, z, pch=19)
plot(y, z, pch=20)
plot(z, x, pch=19)


par(mfcol=c(2, 2))
plot(x, y, pch=20)
plot(x, z, pch=19)
plot(y, z, pch=20)
plot(z, x, pch=19)


# reset
par(mfrow=c(1, 1))
x <- rnorm(100)
y <- x + rnorm(100)
?gl
gl(2, 50)
gl(2, 50, labels=c("Male", "Female"))

g <- gl(2, 50, labels=c("Male", "Female"))
plot(x, y)


# lets separate the data
plot(x, y, type="n") # means dont plot for now
points(x[g=="Male"], y[g=="Male"], col="green")
points(x[g=="Female"], y[g=="Female"], col="blue", pch=19)
