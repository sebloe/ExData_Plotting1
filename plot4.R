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

#Global Active Power as numeric
data$Global_active_power = as.numeric(as.character(data$Global_active_power))

#Global reactive Power as numeric
data$Global_reactive_power = as.numeric(as.character(data$Global_reactive_power))

#Voltag as numeric
data$Voltage = as.numeric(as.character(data$Voltage))


#plotting
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

#plot1
with(data, plot(DateTime,Global_active_power,type="n",ylab="Global Active Power", xlab=""))
with(data,lines(DateTime,Global_active_power))

#plot2
with(data, plot(DateTime,Voltage,type="n"))
with(data,lines(DateTime,Voltage))

#plot3
with(data, plot(DateTime,Sub_metering_1,type="n",ylab="Energy sub metering", xlab=""))
with(data,lines(DateTime,Sub_metering_3,col="blue"))
with(data,lines(DateTime,Sub_metering_2,col="red"))
with(data,lines(DateTime,Sub_metering_1,col="black"))
legend("topright",col=c("black","blue","red"),lty=,bty="o", lwd=2.5,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4
with(data, plot(DateTime,Global_reactive_power,type="n"))
with(data,lines(DateTime,Global_reactive_power))

dev.off()
