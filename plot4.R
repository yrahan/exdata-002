# 4. Across the United States, 
# how have emissions from coal combustion-related sources changed from 1999–2008?

library(reshape)
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
scc <- readRDS("Source_Classification_Code.rds")

table(NEI$type)
names(scc)
# open png device
png(file="plot4.png",width=480,height=480)
# plot

sources<-aggregate(NEI$Emissions[NEI$SCC %in% scc$SCC[grep("Coal",scc$Short.Name)]]
                   ~ NEI$year[NEI$SCC %in% scc$SCC[grep("Coal",scc$Short.Name)]] ,
                   NEI, sum)
colnames(sources)<-c("year","emissions")
ggplot(sources, aes(x=factor(year),y=emissions)) + geom_bar(stat = "identity") +
    ggtitle("Emissions from coal combustion.") + labs(x = "years", y="tons")
# close file
dev.off()