# Exploratory Data Analysis Course Project 1 - plot3
# Assume data is downloaded and unzipped in the working directory

# Step 1: Read only the data for the dates 2007-02-01 and 2007-02-02

library(sqldf)
hh_cons_data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")
hh_cons_data$Date_time <- strptime(paste(hh_cons_data$Date,hh_cons_data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

# Create Plot 3
png(filename = "plot3.png", width = 480, height = 480)
with(hh_cons_data, plot(Date_time, Sub_metering_1, type = "l", xlab = "", ylab ="Energy sub metering"))
lines(hh_cons_data$Date_time,hh_cons_data$Sub_metering_2, col= "red")
lines(hh_cons_data$Date_time,hh_cons_data$Sub_metering_3, col= "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1)
dev.off()