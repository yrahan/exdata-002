library(xlsx)

# download data

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile="mydata.xlsx", method="curl")

# read only a subset
colIndex <- 7:15
rowIndex <- 18:23

dat <- read.xlsx("mydata.xlsx", sheetIndex=1, header=TRUE,
                 colIndex=colIndex, rowIndex=rowIndex, stringsAsFactors=FALSE)

sum(dat$Zip*dat$Ext,na.rm=T) 