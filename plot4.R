# Read data for four plots
data <- read.csv(file = 'household_power_consumption.txt', sep = ';', na.strings = '?')
data['timestamp'] <- paste(data$Date, data$Time)

# First contains global active power between 2007-02-01 and 2007-02-02
globalActivePowers <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', c('timestamp', 'Global_active_power')]
globalActivePowers$timestamp <- as.POSIXlt(globalActivePowers$timestamp, format = '%d/%m/%Y %H:%M:%S', tz = "")

# Second contains voltage between 2007-02-01 and 2007-02-02
voltages <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', c('timestamp', 'Voltage')]
voltages$timestamp <- as.POSIXlt(voltages$timestamp, format = '%d/%m/%Y %H:%M:%S', tz = "")

# Third contains three sub meterings between 2007-02-01 and 2007-02-02
subMeterings <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', c('timestamp', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')]
subMeterings$timestamp <- as.POSIXlt(subMeterings$timestamp, format = '%d/%m/%Y %H:%M:%S', tz = "")

# Fourth contains globalreactive power between 2007-02-01 and 2007-02-02
globalReactivePowers <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', c('timestamp', 'Global_reactive_power')]
globalReactivePowers$timestamp <- as.POSIXlt(globalReactivePowers$timestamp, format = '%d/%m/%Y %H:%M:%S', tz = "")

# For English day labels on x axis on Ubuntu
Sys.setlocale("LC_TIME", "C")

# Plot to png file plot4.png
png(filename = 'plot4.png')

# 2x2 plot
par(mfrow=c(2,2))

# Global active power
plot(globalActivePowers$timestamp, globalActivePowers$Global_active_power, type = 'l', ylab = 'Global Active Power', xlab = '')

# Voltage
plot(voltages$timestamp, voltages$Voltage, type = 'l', ylab = 'Voltage', xlab = 'datetime')

# Sub meterings 1, 2 and 3
plot(c(min(subMeterings$timestamp), max(subMeterings$timestamp)), c(min(subMeterings$Sub_metering_1, subMeterings$Sub_metering_2, subMeterings$Sub_metering_3), max(subMeterings$Sub_metering_1, subMeterings$Sub_metering_2, subMeterings$Sub_metering_3)), type = 'n', ylab = 'Energy sub metering', xlab = "")
lines(subMeterings$timestamp, subMeterings$Sub_metering_1, col = "black")
lines(subMeterings$timestamp, subMeterings$Sub_metering_2, col = "red")
lines(subMeterings$timestamp, subMeterings$Sub_metering_3, col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c('black', 'red', 'blue'), bty = "n")

# Global reactive power
plot(globalReactivePowers$timestamp, globalReactivePowers$Global_reactive_power, type = 'l', ylab = 'Global Reactive Power', xlab = 'datetime')

dev.off() 