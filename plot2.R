# Read in the data
dataFile = "household_power_consumption.txt"
data     = read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# We are only interested in 1/2/2007 and 2/2/2007 data
subSetData = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 2 is a line chart of Global Active Power by time

# Create datetime from Date and Time fields
subSetData$Datetime = as.POSIXct(paste(as.Date(subSetData$Date, format="%d/%m/%Y"), subSetData$Time))

# Open PNG device
png("plot2.png", width=480, height=480)

# Plot the data
plot(subSetData$Global_active_power~subSetData$Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close the png device
dev.off()
