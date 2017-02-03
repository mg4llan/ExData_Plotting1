# This script loads power consumption data and plots a line chart of sub metering

# Load data
datafile <- "D:/Documents/Coursera/DataScience/ExploringData/household_power_consumption.txt"
power <- read.csv(datafile, 
                  sep=";", 
                  header=TRUE,
                  stringsAsFactors = FALSE,
                  quote="",
                  na.strings = "?")

# Convert dates
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Create subset of desired data
power <- subset(power, Date>="2007-02-01" & Date<="2007-02-02")

# Add times to dates
power$Date <- strptime(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

# Plot chart to a file
png(file = "plot3.png")
with(power, plot(Date, Sub_metering_1, type="l", 
                 xlab = "",
                 ylab="Energy sub metering",
                 col="black"))
with(power, lines(Date, Sub_metering_2, type="l", col="red"))
with(power, lines(Date, Sub_metering_3, type="l", col="blue"))
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty=c(1,1,1))
dev.off()