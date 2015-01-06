data <- read.csv(file = 'household_power_consumption.txt', sep = ';', na.strings = '?')
data['timestamp'] <- paste(data$Date, data$Time)

subMeterings <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', c('timestamp', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')]
subMeterings$timestamp <- as.POSIXlt(subMeterings$timestamp, format = '%d/%m/%Y %H:%M:%S', tz = "")

png(filename = 'plot3.png')
Sys.setlocale("LC_TIME", "C")  # For English day labels on x axis on Ubuntu
plot(c(min(subMeterings$timestamp), max(subMeterings$timestamp)), c(min(subMeterings$Sub_metering_1, subMeterings$Sub_metering_2, subMeterings$Sub_metering_3), max(subMeterings$Sub_metering_1, subMeterings$Sub_metering_2, subMeterings$Sub_metering_3)), type = 'n', ylab = 'Energy sub metering', xlab = "")
lines(subMeterings$timestamp, subMeterings$Sub_metering_1, col = "black")
lines(subMeterings$timestamp, subMeterings$Sub_metering_2, col = "red")
lines(subMeterings$timestamp, subMeterings$Sub_metering_3, col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c('black', 'red', 'blue'))
dev.off() 