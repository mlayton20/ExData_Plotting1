sourcedata <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
sourcedata <- sourcedata[sourcedata$Date %in% c("1/2/2007", "2/2/2007"),]
sourcedata$Sub_metering_1 <- as.numeric(as.character(sourcedata$Sub_metering_1))
sourcedata$Sub_metering_2 <- as.numeric(as.character(sourcedata$Sub_metering_2))
sourcedata$Sub_metering_3 <- as.numeric(as.character(sourcedata$Sub_metering_3))
sourcedata$DateTime <- as.POSIXct(paste(sourcedata$Date, sourcedata$Time), format="%d/%m/%Y %H:%M:%S")

#Had to use png() instead of dev.copy() because for some reason the legend was being cropped in copy function.
png(file="plot3.png",width=400,height=350)
par(pch=".")
plot(sourcedata$DateTime, sourcedata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(sourcedata$DateTime, sourcedata$Sub_metering_2, col = "red")
lines(sourcedata$DateTime, sourcedata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1)
dev.off()
