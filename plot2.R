mydata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
mydata$Time <- strptime(paste(mydata$Date, mydata$Time), format = "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- mydata[mydata$Date >= as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02"),]
mydata$Global_active_power <- as.numeric(as.vector(mydata$Global_active_power))

png("./plot2.png")
with(mydata, plot(
  Time, 
  Global_active_power, 
  ylab="Global Active Power (kilowatts)", 
  xlab="",
  type='l'))
dev.off()