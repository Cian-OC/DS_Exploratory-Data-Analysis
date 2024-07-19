## Get the data

powerData<-download.file("https://archive.ics.uci.edu/static/public/235/individual+household+electric+power+consumption.zip","powerData.zip")

unzip(zipfile="powerData.zip",exdir="C:/Users/ciano/OneDrive/Documents/Coursera_DS_Course/DS_Exploratoy_Data_Analysis/EDA-Week-1-Project")

powerData<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Subset correct dates

First_Feb_2007<- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]

## Plot 2: Linegraph of Global Active Power and Time

## Uses same subset of household_power_consumption, First_Feb_2007, created for plot 1.

## Create a column of date and time merged

dateTime <- strptime(paste(First_Feb_2007$Date, First_Feb_2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

First_Feb_2007 <- cbind(First_Feb_2007, dateTime)

## Correct column classes

First_Feb_2007$Date <- as.Date(First_Feb_2007$Date, format = "%d/%M/%Y")

First_Feb_2007$Time <- format(First_Feb_2007$Time, format="%H:%M:%S")

First_Feb_2007$Global_active_power <- as.numeric(First_Feb_2007$Global_active_power)

First_Feb_2007$Global_reactive_power <- as.numeric(First_Feb_2007$Global_reactive_power)

First_Feb_2007$Voltage <- as.numeric(First_Feb_2007$Voltage)

First_Feb_2007$Global_intensity <- as.numeric(First_Feb_2007$Global_intensity)

First_Feb_2007$Sub_metering_1 <- as.numeric(First_Feb_2007$Sub_metering_1)

First_Feb_2007$Sub_metering_2 <- as.numeric(First_Feb_2007$Sub_metering_2)

First_Feb_2007$Sub_metering_3 <- as.numeric(First_Feb_2007$Sub_metering_3)


## Plot the data

png("plot2.png", width=480, height=480)
with(plot(First_Feb_2007$dateTime,First_Feb_2007$Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()

