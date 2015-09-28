sourcedata <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
sourcedata <- sourcedata[sourcedata$Date %in% c("1/2/2007", "2/2/2007"),]
sourcedata$Global_active_power <- as.numeric(as.character(sourcedata$Global_active_power))
sourcedata$Global_reactive_power <- as.numeric(as.character(sourcedata$Global_reactive_power))
sourcedata$Voltage <- as.numeric(as.character(sourcedata$Voltage))
sourcedata$Sub_metering_1 <- as.numeric(as.character(sourcedata$Sub_metering_1))
sourcedata$Sub_metering_2 <- as.numeric(as.character(sourcedata$Sub_metering_2))
sourcedata$Sub_metering_3 <- as.numeric(as.character(sourcedata$Sub_metering_3))
sourcedata$DateTime <- as.POSIXct(paste(sourcedata$Date, sourcedata$Time), format="%d/%m/%Y %H:%M:%S")

#Had to use png() instead of dev.copy() because for some reason the legend was being cropped in copy function.
png(file="plot4.png",width=800,height=700)
par(pch=".", mfrow = c(2,2))

#plot 1
plot(sourcedata$DateTime, sourcedata$Global_active_power, xlab = "", ylab = "Global Active Power")
lines(sourcedata$DateTime, sourcedata$Global_active_power)

#plot 2
plot(sourcedata$DateTime, sourcedata$Voltage, xlab = "datetime", ylab = "Voltage")
lines(sourcedata$DateTime, sourcedata$Voltage)

#plot 3
plot(sourcedata$DateTime, sourcedata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(sourcedata$DateTime, sourcedata$Sub_metering_2, col = "red")
lines(sourcedata$DateTime, sourcedata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1, bty="n")

#plot 4
plot(sourcedata$DateTime, sourcedata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power")
lines(sourcedata$DateTime, sourcedata$Global_reactive_power)

dev.off()
