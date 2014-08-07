library(sqldf)
library(datasets)


#creates a data frame with only the two dates
mainData = "household_power_consumption.txt"
data <- read.csv.sql(mainData, sep=";",sql = 'select * from file where Date = "2/2/2007" OR Date = "1/2/2007"')

#create a Histogram
hist(data$Global_active_power,xlab = "Global_active_power(kilowatts)", main = "Global_active_power",col = "red")  

#saves the graph in a png file
dev.copy(png, file = "plot1.png",width=480, height=480)  ## Copy my plot to a PNG file
dev.off()