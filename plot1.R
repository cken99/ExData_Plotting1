# Read in the data
dataFile = "household_power_consumption.txt"
data     = read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# We are only interested in 1/2/2007 and 2/2/2007 data
subSetData = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot 1 is a histogram of Global Active Power

# Open PNG device
png("plot1.png", width=480, height=480)

# Plot the data
hist(as.numeric(subSetData$Global_active_power), 
     col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close the png device
dev.off()
