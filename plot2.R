##Plot 2
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

plot2 <- function() {
  plot(dataset$timestamp,dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
}
plot2()