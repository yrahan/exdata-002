# 1. Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.


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

str(NEI)
str(SCC)

table(NEI$year)
# open png device
png(file="plot1.png",width=480,height=480)
# plot
barplot(tapply(NEI$Emissions,NEI$year,sum),xlab="year",ylab="tons", 
        main="Total PM2.5 emission from all sources \nfor each of the years 1999, 2002, 2005, and 2008.")
# close file
dev.off()