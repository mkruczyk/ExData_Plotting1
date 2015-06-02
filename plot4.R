mydata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
mydata$Time <- strptime(paste(mydata$Date, mydata$Time), format = "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- mydata[mydata$Date >= as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02"),]
mydata$Global_active_power <- as.numeric(as.vector(mydata$Global_active_power))
mydata$Sub_metering_1 <- as.numeric(as.vector(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.vector(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.vector(mydata$Sub_metering_3))
mydata$Voltage <- as.numeric(as.vector(mydata$Voltage))
mydata$Global_reactive_power <- as.numeric(as.vector(mydata$Global_reactive_power))

attach(mydata)
png("./plot4.png")
par(mfrow=c(2, 2))
plot(
  Time, 
  Global_active_power, 
  ylab="Global Active Power", 
  xlab="",
  type='l')

plot(
  Time, 
  Voltage, 
  ylab="Voltage", 
  xlab="datetime",
  type='l')

plot(
  Time, 
  Sub_metering_1, 
  ylab="Energy sub metering", 
  xlab="",
  type='l',
  col="black")
lines(Time, Sub_metering_2, col="red")
lines(Time, Sub_metering_3, col="blue")
legend(
  "topright", 
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
  lty=1,
  col=c("black", "red", "blue"))


plot(
  Time, 
  Global_reactive_power, 
  ylab="Global_Rective_Power", 
  xlab="datetime",
  type='l')
dev.off()
detach(mydata)
