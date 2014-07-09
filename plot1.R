setwd("~/GitHub/ExData_Plotting1")
data <- read.csv('household_power_consumption.txt',
                 comment.char = "",
                 sep =';',                 
                 na.strings = '?',                 
                 )
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
filtered <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

filtered$DateTime <- strptime(paste(filtered$Date, filtered$Time), '%Y-%m-%d %H:%M:%S')


png(filename='plot1.png')
hist(filtered$Global_active_power, xlab = 'Global Active Power (kilowatts)', ylab='Frequency', main='Global Active Power', col = 'red')
dev.off()