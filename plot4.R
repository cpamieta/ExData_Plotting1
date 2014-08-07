library(sqldf)
library(datasets)


#creates a data frame with only the two dates
mainData = "household_power_consumption.txt"
data <- read.csv.sql(mainData, sep=";",sql = 'select * from file where Date = "2/2/2007" OR Date = "1/2/2007"')

#converts the date in the date.
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#creates four graphs 
par(mfrow = c(2, 2),mar = c(3, 4.5, 2, 2))
with(data, {
  plot(data$Date,data$Global_active_power, type = "l",ylab = "Global_active_power(kilowatts)",xlab = "")
  plot(data$Date,data$Voltage, type = "l",ylab = "Voltage",xlab = "datetime")
  plot(data$Date,data$Sub_metering_1, type = "l",ylab = "Global_active_power(kilowatts)",xlab = "")
  lines(data$Date,data$Sub_metering_2, type="l", col="red")
  lines(data$Date,data$Sub_metering_3, type="l", col="blue")
  legend("topright", pch = "_", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2 ","Sub_metering_3"))
  
  plot(data$Date,data$Global_reactive_power, type = "l",ylab = "Global_reactive_power",xlab = "datetime")
  
})




#saves the graph in a png file
dev.copy(png, file = "plot4.png",width=480, height=480)  
dev.off()


