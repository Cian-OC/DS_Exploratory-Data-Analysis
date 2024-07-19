

## Get the data

powerData<-download.file("https://archive.ics.uci.edu/static/public/235/individual+household+electric+power+consumption.zip","powerData.zip")

unzip(zipfile="powerData.zip",exdir="C:/Users/ciano/OneDrive/Documents/Coursera_DS_Course/DS_Exploratoy_Data_Analysis/EDA-Week-1-Project")

powerData<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Subset correct dates

First_Feb_2007<- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]

str(First_Feb_2007)

head(First_Feb_2007)

tail(First_Feb_2007)

## remove full dataset to save memory

rm(powerData)

## Plot the data and create png image

globalActivePower <- as.numeric(First_Feb_2007$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylim=c(0,1200))
dev.off() ## must include this to get png to work


