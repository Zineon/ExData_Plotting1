#The following commands in Ubuntu provide the row numbers for the starting and ending values of the required subset of data.
#grep -n "^[12]/2/2007" household_power_consumption.txt | head -2
#grep -n "^[12]/2/2007" household_power_consumption.txt | tail -2

# Reading the required data into a variable 'hpc'
hpc <- read.csv("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE, skip = 66636, nrows = 2880)

# Reading a small sample data into another variable 'test'
test <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, nrows = 5)

# Using the names of 'test' to name the columns of 'hpc'
names(hpc) <- names(test)

# Creating a new variable 'datetime' in 'hpc' to generate the Day format for the graph
hpc$datetime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

# Plotting the required graphs and saving them in the prescribed format
png("./plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(hpc$datetime, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(hpc$datetime, hpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(hpc$datetime, hpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpc$datetime, hpc$Sub_metering_2, type = "l", col = "red", xlab = NULL)
lines(hpc$datetime, hpc$Sub_metering_3, type = "l", col = "blue", xlab = NULL)
legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend =  c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
plot(hpc$datetime, hpc$Global_active_power, type = "l", xlab = "datetime", ylab = "Global_active_power")
dev.off()
