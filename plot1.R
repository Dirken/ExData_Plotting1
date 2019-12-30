#Plot1
dataset <- read.csv("household_power_consumption.txt", 
                    sep=";", 
                    header=T, 
                    na.strings="?", 
                    stringsAsFactors = F)

dataset <- subset(dataset, Date == "1/2/2007" | Date == "2/2/2007")

with(dataset, {
  hist(Global_active_power,
       ylim=range(0,1200),
       xlab="Global Active Power (kilowatts)", 
       ylab="Frequency", 
       col="red", 
       main="Global Active Power")
  }
)
png("plot1.png", width=480, height=480)
dev.off()
