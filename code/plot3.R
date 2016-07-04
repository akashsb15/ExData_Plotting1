## Download file
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", mode = "wb",
              destfile = "./data/Course4/ExData_Plotting1/household_power_consumption.zip")

## Unzip downloaded file
  unzip("./data/Course4/ExData_Plotting1/household_power_consumption.zip")

## Read data from textfile
  rawData <- read.csv("./data/Course4/household_power_consumption.txt", sep = ";", header = TRUE)

## Extract required data
  reqData <- subset(rawData,Date == "1/2/2007" | Date == "2/2/2007")

## Change format of Date and Time fields
  reqData$Time <- strptime(paste(reqData$Date,reqData$Time),"%d/%m/%Y %H:%M:%S")
  reqData$Date <- weekdays(as.Date(reqData$Date,"%d/%m/%Y"))
  colnames(reqData)[1] <- "Day"

## Variable containing vector of Global Active Power
## Convert factor varibles to vectors
  reqData$Sub_metering_1 <- as.numeric(levels(reqData$Sub_metering_1)[reqData$Sub_metering_1])
  reqData$Sub_metering_2 <- as.numeric(levels(reqData$Sub_metering_2)[reqData$Sub_metering_2])
  ## reqData$Sub_metering_3 is already in numeric format

## Select device to plot
  png(file = "./data/Course4/ExData_Plotting1/figures/plot3.png", bg = "transparent")

## Plot line graphs
  with(reqData,plot(Time,Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering"))
  with(reqData,lines(Time,Sub_metering_2, col = "red"))
  with(reqData,lines(Time,Sub_metering_3, col = "blue"))

## Legend
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lwd = 1)

## Switch off the device
  dev.off()