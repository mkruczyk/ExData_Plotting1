mydata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")
mydata$Time <- strptime(paste(mydata$Date, mydata$Time), format = "%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- mydata[mydata$Date >= as.Date("2007-02-01") & mydata$Date <= as.Date("2007-02-02"),]
mydata$Global_active_power <- as.numeric(as.vector(mydata$Global_active_power))


png("./plot1.png")
with(mydata, hist(
  Global_active_power, 
  xlab="Global Active Power (kilowatts)", 
  col="red", 
  main="Global Active Power"))
dev.off()

