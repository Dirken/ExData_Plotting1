#plot2.R

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
  plot(Global_active_power~weekday,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)"
  )}
)

png("plot2.png", width=480, height=480)
dev.off()
