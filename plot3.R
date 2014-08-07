library(sqldf)
library(datasets)


#creates a data frame with only the two dates
mainData = "household_power_consumption.txt"
data <- read.csv.sql(mainData, sep=";",sql = 'select * from file where Date = "2/2/2007" OR Date = "1/2/2007"')

#converts the date in the date.
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#create a line graph
plot(data$Date,data$Sub_metering_1, type = "l",ylab = "Global_active_power(kilowatts)",xlab = "")
lines(data$Date,data$Sub_metering_2, type="l", col="red")
lines(data$Date,data$Sub_metering_3, type="l", col="blue")
legend("topright", pch = "_", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2 ","Sub_metering_3"))
#saves the graph in a png file
dev.copy(png, file = "plot3.png",width=480, height=480)  
dev.off()




