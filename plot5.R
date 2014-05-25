# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?


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
png(file="plot5.png",width=480,height=480)
# plot
sources<-aggregate(NEI$Emissions[NEI$SCC %in% scc$SCC[grep("Veh",scc$Short.Name)] & 
        NEI$fips==24510] ~ NEI$year[NEI$SCC %in% scc$SCC[grep("Veh",scc$Short.Name)] & 
        NEI$fips==24510] , NEI, sum)
colnames(sources)<-c("year","emissions")
ggplot(sources, aes(x=factor(year),y=emissions)) + geom_bar(stat = "identity") +
    ggtitle("Emissions from vehicle sources in Baltimore City") + 
    labs(x = "years", y="tons")

# close file
dev.off()