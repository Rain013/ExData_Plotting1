#Read data file
alldata <- read.table("household_power_consumption.txt", sep = ";",header=TRUE, na.strings = "?", colClasses = NA )

#Pick out the data to be used
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

#Add the date and time together
data$day <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$day <- as.POSIXct(data$day)

#Open a png file
png('plot3.png')

#Plot the data
plot(data$day,data$Sub_metering_1, type = "l", col="black", xlab = "", ylab = "Energy sub metering")
lines(data$day,data$Sub_metering_2, col="red")
lines(data$day,data$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.75, lty = c(1,1,1), pch = c(NA,NA,NA))

dev.off()