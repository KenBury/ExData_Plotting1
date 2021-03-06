setwd("~/GitHub/ExData_Plotting1")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "./exdata-data-Fhousehold_power_consumption.zip",method="auto")
unzip("./exdata-data-Fhousehold_power_consumption.zip")
pdata <- read.table("./household_power_consumption.txt",header= TRUE , sep = ";", na.strings = c("?"))
## pdata <- read.table("./household_power_consumption.txt",header= TRUE , sep = ";")
pdata$DateTime <- strptime(paste(as.character(pdata$Date)," ",as.character(pdata$Time)), "%d/%m/%Y %H:%M:%S")
spdata <- subset (pdata, DateTime >= as.POSIXlt( "2007-02-01 00:00:00") & DateTime <= as.POSIXlt( "2007-02-02 00:00:00"))
png( file = "plot4.png",width=480,height=480,res=72)
par (mfrow = c(2,2))
## 1,1 plot
with (spdata, plot (DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)" , type ="l" ))
## 1,2 plot
with (spdata, plot (DateTime, Voltage,  type ="l" ))
## 2,1 plot
with (spdata, plot (DateTime, Sub_metering_1, type ="l" , ylab = "Energy sub metering"))
lines(spdata$DateTime, spdata$Sub_metering_2, col="red")
lines(spdata$DateTime, spdata$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red" , "blue"))
## 2,2 plot
with (spdata, plot (DateTime, Global_reactive_power,  type ="l" ))

dev.off()
