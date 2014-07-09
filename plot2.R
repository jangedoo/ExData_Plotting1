setwd("~/GitHub/ExData_Plotting1")
data <- read.csv('household_power_consumption.txt',
                 comment.char = "",
                 sep=';',                 
                 na.strings = '?',                 
)
data$Date <- as.Date(data$Date,format='%d/%m/%Y')
filtered <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

filtered$DateTime <- strptime(paste(filtered$Date, filtered$Time), '%Y-%m-%d %H:%M:%S')


png(filename='plot2.png')
plot(x=filtered$DateTime, y=filtered$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()