## Get the data

powerData<-download.file("https://archive.ics.uci.edu/static/public/235/individual+household+electric+power+consumption.zip","powerData.zip")

unzip(zipfile="powerData.zip",exdir="C:/Users/ciano/OneDrive/Documents/Coursera_DS_Course/DS_Exploratoy_Data_Analysis/EDA-Week-1-Project")

powerData<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Subset correct dates

First_Feb_2007<- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]

## Plot 3: Sub_Metering plot

## Assumes the following 

##    - data loaded as per plots 1 and 2. Subsetted as 'First_Feb_2007
##    - Date and time formatted as dateTime
##    - column classes corrected as per plot 2



png("plot.3.png",width=480, height=480)
with(plot(First_Feb_2007$dateTime, First_Feb_2007$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(First_Feb_2007$dateTime, First_Feb_2007$Sub_metering_2,type="l", col= "red")
lines(First_Feb_2007$dateTime, First_Feb_2007$Sub_metering_3,type="l", col= "blue")
legend(c("topright"),inset=0.10, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"),xpd=TRUE)
dev.off()
