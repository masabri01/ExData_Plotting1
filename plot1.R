## Script name: plot1.R
## Author name: Muhammad Anwar Sabri
## Date written: 2015-MAY-10
## Purpose: This script explores the data in "Individual household electric
##          power consumption data set" by plotting the histogram of the 
##          "Global Active Power (in kilowatts)" of a household in one-minute
##          increments from 2007-FEB-01 00:00:00 to 2007-FEB-02 23:59:00.
##
## Source: https://github.com/rdpeng/ExData_Plotting1
## Data set source: https://d396qusza40orc.cloudfront.net/exdata%2Fdat%2Fhousehold_power_consumption.zip
## Prerequisite: The data file has been unzipped into the working directory
##
## ******* BEGIN plot1.R script ************
##

## read the data set into memory

df <- read.table('household_power_consumption.txt', sep = ';',
      stringsAsFactors = F, header = T)

# convert the first two columns (Date and Time) into R's Date/time type

df1 <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

# store the new date object and the remaining 7 columns in a data frame

df2 <- data.frame(df1, as.numeric(df$Global_active_power), 
       as.numeric(df$Global_reactive_power),
       as.numeric(df$Voltage), as.numeric(df$Global_intensity),
       as.numeric(df$Sub_metering_1), as.numeric(df$Sub_metering_2),
       as.numeric(df$Sub_metering_3))

# extract only the data for the required date/time range

tidy_df <- df2[df2$df1 >= "2007-02-01 00:00:00" & 
               df2$df1 <  "2007-02-03 00:00:00",]

# plot the first graph: histogram of Global Active Power (kilowatts)

hist(as.numeric(tidy_df[,2]), col = "red", main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)", ylab = "Frequency")

# add the text on the upper left margin: Plot 1

mtext(text = "Plot 1", side = 3, line = 3, adj = 0)

# copy the histogram to a PNG file

dev.copy(png, file = "plot1.png")
dev.off()

##
## ******* END plot1.R script ************
