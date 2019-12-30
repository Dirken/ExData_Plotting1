#plot3.R

dataset <- read.csv("household_power_consumption.txt", 
                    sep=";", 
                    header=T, 
                    na.strings="?", 
                    stringsAsFactors = F)

dataset <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
dataset$weekday <- paste(as.Date(dataset$Date), dataset$Time)
dataset$weekday <- as.POSIXct(dataset$weekday)


with(dataset, {
  plot(Sub_metering_1~weekday,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)"
  )
  lines(Sub_metering_2~weekday, col="red")
  lines(Sub_metering_3~weekday, col="blue")}
)
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png("plot3.png", width=480, height=480)
dev.off()
