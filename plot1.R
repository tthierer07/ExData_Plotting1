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
sub_data[,3] <- as.numeric(as.character(sub_data[,3]))

## Plot the data

png(file = "plot1.png")
hist(sub_data[,3], breaks = 13, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", xlim = c(0,6), ylim = c(0,1200))
dev.off()
