# # 3. Of the four types of sources indicated by the type 
# point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions 
# from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
# Get Data
zipfile <- "data.zip"
# avoid unecessary downloads
if (!file.exists(zipfile)){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(fileUrl, destfile = zipfile, method = "curl")
    
}
unzip(zipfile)

# read data
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

table(NEI$type)

# open png device
png(file="plot3.png",width=480,height=480)
# plot

sources<-aggregate(NEI$Emissions[NEI$fips==24510] ~ NEI$type[NEI$fips==24510] + 
                       NEI$year[NEI$fips==24510] ,
                   NEI, sum)
colnames(sources)<-c("type","year","emissions")
ggplot(sources, aes(x=factor(year),y=emissions,group=type)) + geom_line(aes(colour=type)) +
    ggtitle("Evolution of emissions from four source type in Baltimore City.") + 
    labs(x = "years", y="tons of PM2.5")
# close file
dev.off()