# set working directory with setwd("path to git repo ExData_Plotting/my_figures/")

unzip("exdata-data-household_power_consumption.zip", overwrite=F)
input_file <- "household_power_consumption.txt"
d <- read.table(input_file, sep=";", na.strings="?", stringsAsFactors=F, skip=66637,nrows=2880,
                col.names=names(read.table(input_file, sep=";", header=T, nrows=1)))
d$datetime <- strptime(paste(d$Date,d$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow=c(2,2))

with(d, {
  plot(datetime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
  plot(datetime, Voltage, type="l")
  
  plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  points(datetime, Sub_metering_1, type="l")
  points(datetime, Sub_metering_2, type="l", col="red")
  points(datetime, Sub_metering_3, type="l", col="blue")
  legend("topright", legend=names(d[,7:9]), lty=1, lwd=1, col=c("black","red","blue"), bty="n")
  
  plot(datetime, Global_reactive_power, type="l")
})

dev.off()