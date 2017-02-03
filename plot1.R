# This script loads power consumption data and plots a histogram of global active power

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

# Plot histogram to a file
png(file = "plot1.png")
hist(power$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()