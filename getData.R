getData <- function() {
     ##   This function retreives the data from the UC Irvine Machine Learning Repository and filters it to
     ##   the relevant data needed for the assignment (using data from the dates 2007-02-01 and 2007-02-02)
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
     powerData <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?",
                            fill=FALSE, strip.white=TRUE)
     ##   filter dataset to relevant rows only
     powerData <- filter(powerData, Date == "1/2/2007" | Date == "2/2/2007")
     ##   merge Date and time columns
     powerData$Datetime <- paste(powerData$Date, powerData$Time, sep = " ")
     ##   convert Datetime to POSIX Data/Time format
     powerData$Datetime <- strptime(powerData$Datetime, '%d/%m/%Y %H:%M:%S')
     ##   Remove the obsolete columns 
     powerData$Date <- NULL
     powerData$Time <- NULL
     ##   Write prepared data in file for later plot generation
     write.table(powerData, file = "powerdata.txt", sep = ",", row.names = FALSE)
}