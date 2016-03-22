#Plot 1
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


dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
dataset$Global_reactive_power <- as.numeric(as.character(dataset$Global_reactive_power))
dataset$Voltage <- as.numeric(as.character(dataset$Voltage))
dataset <- transform(dataset, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
dataset$Sub_metering_1 <- as.numeric(as.character(dataset$Sub_metering_1))
dataset$Sub_metering_2 <- as.numeric(as.character(dataset$Sub_metering_2))
dataset$Sub_metering_3 <- as.numeric(as.character(dataset$Sub_metering_3))

plot1 <- function() {
  hist(dataset$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}
plot1()