##plot 4
## data download
if(!file.exists("exdata-data-household_power_consumption.zip")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudatasetront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  file <- unzip(temp)
  unlink(temp)
}
power <- read.table(file, header=TRUE, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
dataset <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]


plot4 <- function() {
  par(mfrow=c(2,2))
  
  plot(dataset$timestamp,dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(dataset$timestamp,dataset$Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(dataset$timestamp,dataset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(dataset$timestamp,dataset$Sub_metering_2,col="red")
  lines(dataset$timestamp,dataset$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) 
  plot(dataset$timestamp,dataset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
}
plot4()