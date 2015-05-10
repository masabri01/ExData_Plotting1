## Script name: plot3.R
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
## ******* BEGIN plot3.R script ************
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

# plot the third graph: plots of Energy Sub Meterings (1 thru 3)

with(tidy_df, plot(tidy_df[,1], as.numeric(tidy_df[,6]), xlab = "", 
     ylab = "Energy sub metering", type = "n", lwd = 2, col = "black"))

with(tidy_df, points(tidy_df[,1], as.numeric(tidy_df[,6]), xlab = "", 
     ylab = "Energy sub metering", type = "l", lwd = 2, col = "black"))

with(tidy_df, points(tidy_df[,1], as.numeric(tidy_df[,7]), xlab = "", 
     ylab = "Energy sub metering", type = "l", lwd = 2, col = "red"))

with(tidy_df, points(tidy_df[,1], as.numeric(tidy_df[,8]), xlab = "", 
     ylab = "Energy sub metering", type = "l", lwd = 2, col = "blue"))

legend("topright", pch = 95, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# add the text on the upper left margin: Plot 3

mtext(text = "Plot 3", side = 3, line = 3, adj = 0)

# copy the histogram to a PNG file

dev.copy(png, file = "plot3.png")
dev.off()

##
## ******* END plot3.R script ************
