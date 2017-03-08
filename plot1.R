#Read data file
alldata <- read.table("household_power_consumption.txt", sep = ";",header=TRUE, na.strings = "?", colClasses = NA)
#Pick out the data to be used
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

#Open a png file
png('plot1.png')

#Plot the data
hist(data$Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

dev.off()