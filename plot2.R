data <- read.csv(file = 'household_power_consumption.txt', sep = ';', na.strings = '?')
data['timestamp'] <- paste(data$Date, data$Time)
globalActivePowers <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', c('timestamp', 'Global_active_power')]
globalActivePowers$timestamp <- as.POSIXlt(globalActivePowers$timestamp, format = '%d/%m/%Y %H:%M:%S', tz = "")
png(filename = 'plot2.png')
Sys.setlocale("LC_TIME", "C")  # For English day labels on x axis on Ubuntu
plot(globalActivePowers$timestamp, globalActivePowers$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()