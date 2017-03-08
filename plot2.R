#Read data file
alldata <- read.table("household_power_consumption.txt", sep = ";",header=TRUE, na.strings = "?", colClasses = NA)

#Pick out the data to be used
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")

#Add the date and time together
data$day <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$day <- as.POSIXct(data$day)

#Open a png file
png('plot2.png')

#Plot the data
#Plot the data
plot(data$day,data$Global_active_power, type = "l", xlab = "",ylab = "Global Active Power (kilowatts)") 

dev.off()