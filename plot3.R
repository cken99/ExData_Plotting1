# Read in the data
dataFile = "household_power_consumption.txt"
data     = read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# We are only interested in 1/2/2007 and 2/2/2007 data
subSetData = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 3 is a multi line plot of Energy Sub Metering by time

# Create datetime from Date and Time fields
subSetData$Datetime = as.POSIXct(paste(as.Date(subSetData$Date, format="%d/%m/%Y"), subSetData$Time))

# Open PNG device
png("plot3.png", width=480, height=480)

# Plot the data for Sub Metering 1
plot(subSetData$Datetime, as.numeric(subSetData$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")

# Add Sub Metering 2
lines(subSetData$Datetime, as.numeric(subSetData$Sub_metering_2), type="l", col="red")

# Add Sub Metering 3
lines(subSetData$Datetime, as.numeric(subSetData$Sub_metering_3), type="l", col="blue")

# Add the legend
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


# Close the png device
dev.off()
