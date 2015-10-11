data = read.table ("household_power_consumption.txt", sep=";", header=TRUE)
data$timing <- paste (data$Date, data$Time)
data$timing <- strptime(data$timing, "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
clean <- subset (data, Date == "2007-02-01" | Date == "2007-02-02")
with (clean, plot(timing, as.numeric(as.character(Global_active_power)), type="l", xlab= " ", ylab="Global Active Power (Kilowatts)"))


dev.copy (png, file="plot2.png")
dev.off()