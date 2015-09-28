sourcedata <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
sourcedata <- sourcedata[sourcedata$Date %in% c("1/2/2007", "2/2/2007"),]
sourcedata$Global_active_power <- as.numeric(as.character(sourcedata$Global_active_power))
sourcedata$DateTime <- as.POSIXct(paste(sourcedata$Date, sourcedata$Time), format="%d/%m/%Y %H:%M:%S")
par(pch=".")
plot(sourcedata$DateTime, sourcedata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)")
lines(sourcedata$DateTime, sourcedata$Global_active_power)
dev.copy(png, "plot2.png")
dev.off()
