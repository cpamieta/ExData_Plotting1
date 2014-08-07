library(sqldf)
library(datasets)


#creates a data frame with only the two dates
mainData = "household_power_consumption.txt"
data <- read.csv.sql(mainData, sep=";",sql = 'select * from file where Date = "2/2/2007" OR Date = "1/2/2007"')

#converts the date in the date.
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#create a line graph
plot(data$Date,data$Global_active_power, type = "l",ylab = "Global_active_power(kilowatts)",xlab = "")
#saves the graph in a png file
dev.copy(png, file = "plot2.png",width=480, height=480)  
dev.off()







