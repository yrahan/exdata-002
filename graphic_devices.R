# open pdf device
pdf(file="myplot.pdf")
# create plot and send it to a file
with(faithful, plot(eruptions, waiting))
# annotate plot
title(main="Old Faithful Geyser data")
# close pdf file device
dev.off()


# copy plot from screen to file
library(datasets)
# create plot and send it to a file
with(faithful, plot(eruptions, waiting))
# annotate plot
title(main="Old Faithful Geyser data")
# copy to device
dev.copy(png, file="geyserplot.png")
# close device
dev.off()
