
# Load data
allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Use data from the dates 2007-02-01 and 2007-02-02
subSetData <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

# Get Global Active Power data
globalActivePowerData <- as.numeric(subSetData$Global_active_power)

# Specify parameters of the plot
png("plot1.png", width=480, height=480)
hist(globalActivePowerData, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()