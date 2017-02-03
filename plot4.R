# This script loads power consumption data and plots various charts

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

# Plot charts to a file
png(file = "plot4.png")
par(mfcol = c(2, 2))

# Plot top left chart
with(power, plot(Date, Global_active_power, type="l", 
                 xlab = "",
                 ylab="Global Active Power"))

# Plot bottom left chart
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

# Plot top right chart
with(power, plot(Date, Voltage, type="l", 
                 xlab = "datetime",
                 ylab="voltage",
                 col = "black"))

# Plot bottom right chart
with(power, plot(Date, Global_reactive_power, type="l", 
                 xlab = "datetime",
                 ylab="Global_reactive_power",
                 col = "black"))

dev.off()