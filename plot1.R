#The following commands in Ubuntu provide the row numbers for the starting and ending values of the required subset of data.
#grep -n "^[12]/2/2007" household_power_consumption.txt | head -2
#grep -n "^[12]/2/2007" household_power_consumption.txt | tail -2

# Reading the required data into a variable 'hpc'
hpc <- read.csv("household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE, skip = 66636, nrows = 2880)

# Reading a small sample data into another variable 'test'
test <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, nrows = 5)

# Using the names of 'test' to name the columns of 'hpc'
names(hpc) <- names(test)

# Plotting the required graph and saving it in the prescribed format
png("./plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = NULL)
dev.off()
