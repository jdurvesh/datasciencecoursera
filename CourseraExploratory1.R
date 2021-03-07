library(tidyverse)
library(data.table)

p1<-fread("household_power_consumption.txt")
View(head(p1))

data_p1<-p1[Date == "1/2/2007" | Date == "2/2/2007"]
data_p1

setwd("C:\\Users\\Disha\\Documents\\coursera_sub\\sub1")

png("plot1.png", width=480, height=480)
hist(as.numeric(data_p1$Global_active_power), main="Global Active Power", 
     xlab="Global Active Pow
er (kilowatts)", ylab="Frequency", col="Blue")

dev.off()

#########
data_p1$Date <- as.Date(data_p1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_p1$Date), data_p1$Time)
data_p1$Datetime <- as.POSIXct(datetime)

png("plot2.png", width=480, height=480)
plot(data_p1$Global_active_power~data_p1$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
#####

png("plot3.png",width=480, height=480)
with(data_p1,{
plot(Sub_metering_1~Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data_p1, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.off()
