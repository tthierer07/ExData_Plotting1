## Get the data

data_file <- "~/R/ExData_Plotting1/household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, sep = ";")

## Subset data between 2007-02-01 and 2007-02-02

key_1 <- data[,1] == '1/2/2007'
inverse_1 <- data[!key_1,]
key_2 <- inverse_1[,1] == '2/2/2007'
day_1 <- data[key_1,]
day_2 <- inverse_1[key_2,]
sub_data <- rbind(day_1, day_2)
sub_data$Voltage <- as.numeric(as.character(sub_data$Voltage))
sub_data$Global_reactive_power <- as.numeric(as.character(sub_data$Global_reactive_power))
sub_data$Global_active_power <- as.numeric(as.character(sub_data$Global_active_power))
sub_data$Sub_metering_1 <- as.numeric(as.character(sub_data$Sub_metering_1))
sub_data$Sub_metering_2 <- as.numeric(as.character(sub_data$Sub_metering_2))
sub_data$Sub_metering_3 <- as.numeric(as.character(sub_data$Sub_metering_3))
sub_date <- as.Date(sub_data$Date, format = "%d/%m/%Y")
time_temp <- paste(sub_date, sub_data$Time)
sub_time <- strptime(time_temp, format = "%Y-%m-%d %H:%M:%S")

## Plot the data
png(file = "plot4.png")
par(mfrow = c(2,2))
plot(sub_time, sub_data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(sub_time, sub_data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(sub_time, sub_data$Sub_metering_1, type = "n", col = "black", ylab = "Energy sub metering", xlab = "" )
points(sub_time, sub_data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
points(sub_time, sub_data$Sub_metering_2, type = "l", col = "red", ylab = "Energy sub metering", xlab = "")
points(sub_time, sub_data$Sub_metering_3, type = "l", col = "blue", ylab = "Energy sub metering", xlab = "")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1 , col = c("black","red","blue"), bty = "n")
plot(sub_time, sub_data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()