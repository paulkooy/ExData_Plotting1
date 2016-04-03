plot3 <- function() {
     ##   This function generates the 3d plot for course assignment 1, Exploratory Data Analysis
     ##   It retreives the data from the UC Irvine Machine Learning Repository and filters it to
     ##   the relevant data needed for the assignment (using data from the dates 2007-02-01 and 2007-02-02)
     ##   For data retreival the function getData.R has been included into the assignment
     ##   
     ##   Dataset: Electric power consumption [20Mb]
     ##   Description: Measurements of electric power consumption in one household with a one-minute sampling 
     ##   rate over a period of almost 4 years. Different electrical quantities and some sub-metering values 
     ##   are available.
     ##
     ##   Course assignment 1, Exploratory Data Analysis
     ##   3 April 2016
     ##   Paul van der Kooy
     ##
     ##   Load relevant libraries and set working directory
     ##
     library(dplyr)
     ##   setwd("/Users/paul/DataScience/Exploratory Data Analysis/Assignment1")
     ##
     ##   Read the power comsumption data
     ##
     powerData <- read.table("powerdata.txt", header = TRUE, sep=",")
     ##   convert Datetime to POSIX Data/Time format
     powerData$Datetime <- strptime(powerData$Datetime, '%Y-%m-%d %H:%M:%S')
     ##
     ##   Open device
     png(filename = "plot3.png")
     ##   plot Global Active Power
     with(powerData, plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
     with(subset(powerData), lines(Datetime, Sub_metering_2, col = "red"))
     with(subset(powerData), lines(Datetime, Sub_metering_3, col = "blue"))
     par(font = 5)
     legend("topright", pch = 190, col = c("black", "red", "blue"), text.font = 1,
            legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
     ##   close device
     dev.off()
}