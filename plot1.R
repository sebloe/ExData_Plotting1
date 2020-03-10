#Loading Data into R
data <- read.csv("household_power_consumption.txt", sep=";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#trimming to only relevant data
data <- data[(data$Date > as.Date("2007-01-31"))&(data$Date < as.Date("2007-02-03")),]
data$DateTime <- paste(data$Date,data$Time)

#Global Active Power as numeric
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
#plot and print
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()