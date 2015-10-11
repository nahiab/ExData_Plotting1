data = read.table ("household_power_consumption.txt", sep=";", header=TRUE)
data$timing <- paste (data$Date, data$Time)
data$timing <- strptime(data$timing, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
clean <- subset (data, Date == "2007-02-01" | Date == "2007-02-02")
par(mfrow=c(2,2))
with (clean, {
	plot(timing, as.numeric(as.character(Global_active_power)), type="l", xlab= " ", ylab="Global Active Power (Kilowatts)")
	plot(timing, as.numeric(as.character(Voltage)), type="l", xlab= "datetime", ylab="Voltage")
	plot(timing, as.numeric(as.character(Sub_metering_1)), type="l", xlab= " ", ylab="Energy sub metering")
points (clean$timing, as.numeric(as.character(clean$Sub_metering_2)), col="red", type="l")
points (clean$timing, as.numeric(as.character(clean$Sub_metering_3)), col="blue", type="l")
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	plot(timing, as.numeric(as.character(Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime")
	})


dev.copy (png, file="plot4.png")
dev.off()