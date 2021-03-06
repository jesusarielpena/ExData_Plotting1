#First load the library usded for this assigment
library(dplyr)
#set working directory and load the dataset previously downloaded.

setwd("C:/Users/penajes2/Documents/R/exdata_data_household_power_consumption")
data_full <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?", stringsAsFactors = FALSE)


#Now filter the two days that will be used for the analysis using filter function.
prueba<- filter(data_full, Date=="1/2/2007"| Date=="2/2/2007")

#convert Dates from chr format to Date format. 
prueba$Date <- as.Date(prueba$Date, format = "%d/%m/%Y") 

# Combine Date and Time variables to create  a new column in dataset named "DateTime" in as.POSIXct format 
prueba$DateTime <- as.POSIXct(paste(prueba$Date, prueba$Time))

#create the plot and save it in .png file
png("plot3.png", width = 480, height = 480) 
plot(prueba$DateTime, prueba$Sub_metering_1, type="l", ylab= "Energy sub Meeting", xlab="")
lines(prueba$DateTime, prueba$Sub_metering_2, type="l",col="red")
lines(prueba$DateTime, prueba$Sub_metering_3, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col = c("black","red","blue"))
dev.off() 
