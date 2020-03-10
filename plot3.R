#Loading Data into R
data <- read.csv("household_power_consumption.txt", sep=";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#trimming to only relevant data
data <- data[(data$Date > as.Date("2007-01-31"))&(data$Date < as.Date("2007-02-03")),]

#creating date and time in one column
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- as.POSIXct(data$DateTime)
#Submetering columns as numeric
data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))

#plotting
png("plot3.png", width=480, height=480)
with(data, plot(DateTime,Sub_metering_1,type="n",ylab="Energy sub metering", xlab=""))
with(data,lines(DateTime,Sub_metering_3,col="blue"))
with(data,lines(DateTime,Sub_metering_2,col="red"))
with(data,lines(DateTime,Sub_metering_1,col="black"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()