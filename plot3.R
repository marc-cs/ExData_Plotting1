# Load data
allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Use data from the dates 2007-02-01 and 2007-02-02
subSetData <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

# Get Global Active Power data
globalActivePowerData <- as.numeric(subSetData$Global_active_power)

# Get Sub Metering data
subMetering1Data <- as.numeric(subSetData$Sub_metering_1)
subMetering2Data <- as.numeric(subSetData$Sub_metering_2)
subMetering3Data <- as.numeric(subSetData$Sub_metering_3)

# Specify parameters of the plot
png("plot3.png", width=480, height=480)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, subMetering1Data, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2Data, type="l", col="red")
lines(datetime, subMetering3Data, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()