# set working directory with setwd("path to git repo ExData_Plotting/my_figures/")

unzip("exdata-data-household_power_consumption.zip", overwrite=F)
input_file <- "household_power_consumption.txt"
d <- read.table(input_file, sep=";", na.strings="?", stringsAsFactors=F, skip=66637,nrows=2880,
                col.names=names(read.table(input_file, sep=";", header=T, nrows=1)))

png("plot1.png")
label <- "Global Active Power"
hist(d$Global_active_power, main=label, xlab=paste(label,"(kilowatts)",sep=" "), col="red")
dev.off()