setwd("c://users/lena_/lenium-repo/Explore/")
fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileURL,destfile = "./data.zip")
header<-unlist(read.table(unzip("data.zip","household_power_consumption.txt"), nrows = 1, sep = ";", na.strings = "?"))
data<-read.table(unzip("data.zip","household_power_consumption.txt"), skip = 66636, nrows = 2880, header = TRUE, sep = ";", na.strings = "?", col.names = header)
data$Date=as.Date(data[,1],format = "%d/%m/%Y")
data$Time=strptime(as.character(data[,2]),format = "%H:%M:%S")


