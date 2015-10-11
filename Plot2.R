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
sub_data$Global_active_power <- as.numeric(as.character(sub_data$Global_active_power))
sub_date <- as.Date(sub_data$Date, format = "%d/%m/%Y")
time_temp <- paste(sub_date, sub_data$Time)
sub_time <- strptime(time_temp, format = "%Y-%m-%d %H:%M:%S")

## Plot the data

png(file = "plot2.png")
plot(sub_time, sub_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
