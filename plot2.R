# 2. Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

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


# open png device
png(file="plot2.png",width=480,height=480)
# plot
barplot(tapply(NEI$Emissions[NEI$fips==24510],
               NEI$year[NEI$fips==24510],sum),
        xlab="year",ylab="tons", 
        main="Total emissions from PM2.5 decreased in the Baltimore City.")
# close file
dev.off()