setwd("~/GitHub/ExData_Plotting1")
data <- read.csv('household_power_consumption.txt',
                 comment.char = "",
                 sep=';',                 
                 na.strings = '?',                 
)
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
filtered <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

filtered$DateTime <- strptime(paste(filtered$Date, filtered$Time), '%Y-%m-%d %H:%M:%S')
filtered$Day <- weekdays(filtered$DateTime, abbreviate=TRUE)


png(filename='plot4.png')
par(mfcol=c(2,2))
plot(x=filtered$DateTime, y=filtered$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')

plot (filtered$DateTime, filtered$Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub metering")
lines(filtered$DateTime, filtered$Sub_metering_1, col = 'black')
lines(filtered$DateTime, filtered$Sub_metering_2, col = 'red')
lines(filtered$DateTime, filtered$Sub_metering_3, col = 'blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1,1))

plot(filtered$DateTime, filtered$Voltage, xlab='datetime', ylab='Voltage', type='l')
plot(x=filtered$DateTime, y=filtered$Global_reactive_power, xlab='datetime', type='l')
dev.off()