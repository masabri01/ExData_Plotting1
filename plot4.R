## Script name: plot4.R
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
## ******* BEGIN plot4.R script ************
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

# plot the Four graphs in 2 x 2 arrangement

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

# plot the first graph: plot of Global Active Power (kilowatts) over time

with(tidy_df, {
     plot(tidy_df[,1], as.numeric(tidy_df[,2]), xlab = "", 
     ylab = "Global Active Power", type = "l", lwd = 2)

# add the text on the upper left margin: Plot 4

     mtext(text = "Plot 4", side = 3, line = 3, adj = 0)

# plot the second graph: plot of Voltage over time

     plot(tidy_df[,1], as.numeric(tidy_df[,4]), xlab = "", 
     ylab = "Voltage", type = "l", lwd = 2)


# plot the third graph: plot of Energy Sub Meterings (1 thru 3)

     plot(tidy_df[,1], as.numeric(tidy_df[,6]), xlab = "", 
     ylab = "Energy sub metering", type = "n", lwd = 2, col = "black")

     with(tidy_df, points(tidy_df[,1], as.numeric(tidy_df[,6]), 
          xlab = "", ylab = "Energy sub metering", type = "l", lwd = 2, 
          col = "black"))

     with(tidy_df, points(tidy_df[,1], as.numeric(tidy_df[,7]),
          xlab = "", ylab = "Energy sub metering", type = "l", lwd = 2, 
          col = "red"))

     with(tidy_df, points(tidy_df[,1], as.numeric(tidy_df[,8]), 
          xlab = "", ylab = "Energy sub metering", type = "l", lwd = 2, 
          col = "blue"))

     legend("topright", pch = 95, col = c("black", "red", "blue"), 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot the fourth graph: plot of Global Reactive Power over time

     plot(tidy_df[,1], as.numeric(tidy_df[,3]), xlab = "", 
     ylab = "Global Reactive Power", type = "l", lwd = 2)
})


# copy the graphs to a PNG file

dev.copy(png, file = "plot4.png")
dev.off()

##
## ******* END plot4.R script ************
