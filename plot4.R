# Read in the data
dataFile = "household_power_consumption.txt"
data     = read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# We are only interested in 1/2/2007 and 2/2/2007 data
subSetData = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 4 is 4 plots
# (i)   Global Active Power by Time
# (ii)  Voltage by Time
# (iii) Energy Sub Metering by Time
# (iv)  Global Reactive Power by Time

# Create datetime from Date and Time fields
subSetData$Datetime = as.POSIXct(paste(as.Date(subSetData$Date, format="%d/%m/%Y"), subSetData$Time))

# Open PNG device
png("plot4.png", width=480, height=480)

# Two rows and 2 columns
par(mfrow = c(2, 2)) 

# Plot 1 - Global Active Power by Time
plot(subSetData$Datetime, subSetData$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.5)

# Plot 2 - Voltage by Time
plot(subSetData$Datetime, subSetData$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3 - Energy Sub Metering

# Sub Metering 1
plot(subSetData$Datetime, as.numeric(subSetData$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")

# Add Sub Metering 2
lines(subSetData$Datetime, as.numeric(subSetData$Sub_metering_2), type="l", col="red")

# Add Sub Metering 3
lines(subSetData$Datetime, as.numeric(subSetData$Sub_metering_3), type="l", col="blue")

# Add the legend
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Plot 4 - Global Reactive Power by Time
plot(subSetData$Datetime, subSetData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


# Close the png device
dev.off()
