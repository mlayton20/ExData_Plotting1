sourcedata <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";")
sourcedata <- sourcedata[sourcedata$Date %in% c("1/2/2007", "2/2/2007"),]
sourcedata$Global_active_power <- as.numeric(as.character(sourcedata$Global_active_power))
hist(sourcedata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()
