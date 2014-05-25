# 6. Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

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
png(file="plot6.png",width=480,height=480)
# plot
sources<-aggregate(NEI$Emissions[NEI$SCC %in% scc$SCC[grep("Veh",scc$Short.Name)] & 
                                      (NEI$fips==24510 | NEI$fips=="06037")] ~ 
                       NEI$year[NEI$SCC %in% scc$SCC[grep("Veh",scc$Short.Name)] & 
                                     (NEI$fips==24510 | NEI$fips=="06037")] + 
                       NEI$fips[NEI$SCC %in% scc$SCC[grep("Veh",scc$Short.Name)] & 
                                     (NEI$fips==24510 | NEI$fips=="06037")], NEI, sum)
colnames(sources)<-c("year","fips","emissions")
ggplot(sources, aes(x=factor(year),y=emissions,group=fips)) + 
    geom_line(aes(colour=fips)) +    
    ggtitle("Compare emissions from motor vehicle sources between\n
            Baltimore City and Los Angeles County.") + 
    labs(x = "year", y="tons") +
    scale_colour_manual (values=c("red","green"), 
                         labels=c("Los Angeles County","Baltimore City"))
# close file
dev.off()