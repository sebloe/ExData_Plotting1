#Loading Data into R
data <- read.csv("household_power_consumption.txt", sep=";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#trimming to only relevant data
data <- data[(data$Date > as.Date("2007-01-31"))&(data$Date < as.Date("2007-02-03")),]

#creating date and time in one column
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- as.POSIXct(data$DateTime)
#Global Active Power as numeric
data$Global_active_power = as.numeric(as.character(data$Global_active_power))

#plotting
png("plot2.png", width=480, height=480)
with(data, plot(DateTime,Global_active_power,type="n",ylab="Global Active Power (kilowatts)", xlab=""))
with(data,lines(DateTime,Global_active_power))
dev.off()