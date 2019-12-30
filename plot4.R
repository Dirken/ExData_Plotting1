#plot4.R

dataset <- read.csv("household_power_consumption.txt", 
                    sep=";", 
                    header=T, 
                    na.strings="?", 
                    stringsAsFactors = F)

dataset <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")
dataset$weekday <- paste(as.Date(dataset$Date), dataset$Time)
dataset$weekday <- as.POSIXct(dataset$weekday)

par(mfrow=c(2,2), mar=c(4,4,2,1))

with(dataset, {
  plot(Global_active_power~weekday, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~weekday, type="l", xlab="datetime", ylab="Voltage")
  plot(Sub_metering_1~weekday, type="l", xlab="", ylab="Energy sub metering", )
  lines(Sub_metering_2~weekday,col='Red')
  lines(Sub_metering_3~weekday,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, cex=0.75,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~weekday, type="l", ylab="Global_rective_power",xlab="datetime",  
       ylim=range(min(dataset$Global_reactive_power),max(dataset$Global_reactive_power)))
})

png("plot4.png", width=480, height=480)
dev.off()
