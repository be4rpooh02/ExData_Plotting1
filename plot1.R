########################
# Exploratory Data Analysis in Coursera
# Week 01 - Project 01
# plot1.R (with plot1.png)
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

##### Plot 1 
# using png fucntion as the graphic device (480x480)
png("plot1.png", width = 480, height = 480)

# plot the histogram
hist(data$Global_active_power, main="Global Active Power", col="red",
     xlab="Global Active Power(kilowatt)", ylab="Frequency")

# release the graphic device
dev.off()
