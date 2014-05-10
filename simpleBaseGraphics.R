library(datasets)

hist(airquality$Ozone)

with(airquality, plot(Wind, Ozone))

airquality <- transform(airquality, Month=factor(Month))
boxplot(Ozone ~ Month, airquality, xlab="Month" , ylab="Ozone (ppb)")

par("col")
# plot then add a title
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City.")

# do the same
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City."))

# highlight a subset
with(subset(airquality, Month == 5), points(Wind, Ozone, col="blue"))


# now plot only what is asked in the subset:
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City.", type="n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col="blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col="red"))
legend("topright", pch = 1, col = c("blue", "red"), legend=c("Mai", "Other Months"))

# Base plot with regression line
with(airquality, plot(Wind, Ozone, main="Ozone, Wind in NYC", pch=20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd=2)

# two plots side by side
par(mfrow=c(1, 2))
with(airquality, {
    plot(Wind, Ozone, main="Ozone and Wind in NYC")
    plot(Solar.R, Ozone, main="Ozone and Solar Radiation in NYC")
})

# multiple plots

par(mfrow=c(1, 3), mar=c(4, 4, 2, 1), oma=c(0, 0, 2, 0))
with(airquality, {
    plot(Wind, Ozone, main="Ozone and Wind")
    plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
    plot(Temp, Ozone, main="Ozone and Temperature")
    mtext("Ozone and Weather in NYC", outer = TRUE)
})