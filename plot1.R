setwd("c://users/lena_/lenium-repo/Explore/")
fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileURL,destfile = "./data.zip")
header<-unlist(read.table(unzip("data.zip","household_power_consumption.txt"), nrows = 1, sep = ";", na.strings = "?"))
data<-read.table(unzip("data.zip","household_power_consumption.txt"), skip = 66636, nrows = 2880, header = TRUE, sep = ";", na.strings = "?", col.names = header)
data$Date = as.Date(data$Date,"%e/%m/%Y")
data$DateTime = paste(data$Date,data$Time)
data$Time=strptime(data$DateTime,format = "%Y-%m-%d %H:%M:%S")
with(data,hist(Global_active_power, main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "Red"))
dev.copy(png, file = "plot1.png",width=480,height=480) 
dev.off()