## Get the data

powerData<-download.file("https://archive.ics.uci.edu/static/public/235/individual+household+electric+power+consumption.zip","powerData.zip")

unzip(zipfile="powerData.zip",exdir="C:/Users/ciano/OneDrive/Documents/Coursera_DS_Course/DS_Exploratoy_Data_Analysis/EDA-Week-1-Project")

powerData<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Subset correct dates

First_Feb_2007<- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]

## plot 4: 2 x 2 plot

## Assumes the following 

##    - data loaded as per plots 1 and 2. Subsetted as 'First_Feb_2007
##    - Date and time formatted as dateTime
##    - column classes corrected as per plot 2

png("plot.4.png",width=480, height=480)
par(mfrow = c(2,2))
plot(First_Feb_2007$dateTime, First_Feb_2007$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(First_Feb_2007$dateTime, First_Feb_2007$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(First_Feb_2007$dateTime, First_Feb_2007$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(First_Feb_2007$dateTime, First_Feb_2007$Sub_metering_2, col = "red")
lines(First_Feb_2007$dateTime, First_Feb_2007$Sub_metering_3, col = "blue")
legend("top", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red","blue"), cex = 0.8, lty = 1 , bty = "n")
plot(time_axis, data[, 4], xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
