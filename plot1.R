# Exploratory Data Analysis Course Project 1 - plot1
# Assume data is downloaded and unzipped in the working directory

# Step 1: Read only the data for the dates 2007-02-01 and 2007-02-02

library(sqldf)
hh_cons_data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")

# combine the date and time into one variable and format it
hh_cons_data$Date_time <- strptime(paste(hh_cons_data$Date,hh_cons_data$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

# Step 2: Create Plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(hh_cons_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
