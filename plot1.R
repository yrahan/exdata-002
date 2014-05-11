# read data
consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                          na.string="?")

# convert column Date to Date format
consumption$Date <- as.Date(as.character(consumption$Date),format="%d/%m/%Y")

# determine the perimeter of selection 
datesPerimeter <- c(as.Date("2007-02-01" , format="%Y-%m-%d"),
                    as.Date("2007-02-02" , format="%Y-%m-%d"))

# select data in the date perimeter
selection <- consumption[consumption$Date %in% datesPerimeter,]

# open png device
png(file="plot1.png",width=480,height=480)
# make the figure
hist(as.numeric(as.character(selection$Global_active_power)), 
     xlab="Global Active Power (kilowatts)", main="Global Active Power",
     col="red")
# close file
dev.off()

