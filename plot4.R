setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
data <- subset(read.csv("./household_power_consumption.txt", sep=";", na.strings="?", colClasses = c("Date" = "myDate")), Date >= "2007/02/01" & Date <= "2007/02/02")
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg ="transparent")
datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
par(mfcol = c(2, 2))
with(data, plot(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))
with(data, plot(datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")
with(data, plot(datetime, Voltage, type = "l"))
with(data, plot(datetime, Global_reactive_power, type = "l"))
dev.off()