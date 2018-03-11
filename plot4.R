########################
# Exploratory Data Analysis in Coursera
# Week 01 - Project 01
# plot4.R (with plot4.png)
#
# Sangwoo Shim
########################

# Cleanup memory
rm(list = ls())

# read a data from txt file
rawdata = read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
# change the format from Factor to Date at the Date column
rawdata$Date <- as.Date(rawdata$Date, format("%d/%m/%Y"))

# make a subset from rawdata (2007-02-01, 2007-02-02)
data <- subset(rawdata, (Date >= "2007-02-01" & Date < "2007-02-03"))
# make a temporal variable (Date + Time)
#data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

##### Plot 4
# using png fucntion as the graphic device (480x480)
png("plot4.png", width = 480, height = 480)

par(mfcol=c(2, 2), mar=c(4,4,2,2))

# plot the graph (0, 0) = Global_active_power
plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Glabal Active Power")

# plot the graph using three line (1, 0) = Energy sub mattering (1, 2, 3)
plot(datetime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub mettering")
# add line (red)
lines(datetime, data$Sub_metering_2, type="l", col="red")
# add line (blue)
lines(datetime, data$Sub_metering_3, type="l", col="blue")
# make the legend using 3 colors
legend("topright", lty=1, col=c("black", "red", "blue"), bty = "n", cex=0.75, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot the graph (1, 0) = Voltage
plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot the graph (1, 1) = Global_reactive_power
plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Gloabl_reactive_power")

# release the graphic device
dev.off()

