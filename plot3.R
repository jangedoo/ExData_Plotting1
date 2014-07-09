setwd("~/GitHub/ExData_Plotting1")
data <- read.csv('household_power_consumption.txt',
                 comment.char = "",
                 sep=';',                 
                 na.strings = '?',                 
)
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
filtered <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

filtered$DateTime <- strptime(paste(filtered$Date, filtered$Time), '%Y-%m-%d %H:%M:%S')


png(filename='plot3.png')
plot (filtered$DateTime, filtered$Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub metering")
lines(filtered$DateTime, filtered$Sub_metering_1, col = 'black')
lines(filtered$DateTime, filtered$Sub_metering_2, col = 'red')
lines(filtered$DateTime, filtered$Sub_metering_3, col = 'blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1,1))
dev.off()