data <- read.csv(file = 'household_power_consumption.txt', sep = ';', na.strings = '?')
globalActivePowers <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', 'Global_active_power']
png(filename = 'plot1.png')
hist(globalActivePowers, col = 'red', xlab = 'Global Active Power (kilowatts)', main = "Global Active Power")
dev.off()
