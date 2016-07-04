##Unzip downloaded file
  unzip(".data/Course4/ExData_Plotting1/household_power_consumption.zip")

## Read data from textfile
  rawData <- read.csv("./data/Course4/household_power_consumption.txt", sep = ";", header = TRUE)

## Extract required data
  reqData <- subset(rawData,Date == "1/2/2007" | Date == "2/2/2007")

## Change format of Date and Time fields
  reqData$Time <- strptime(paste(reqData$Date,reqData$Time),"%d/%m/%Y %H:%M:%S")
  reqData$Date <- weekdays(as.Date(reqData$Date,"%d/%m/%Y"))
  colnames(reqData)[1] <- "Day"

## Variable containing vector of Global Active Power
## Convert factor varible to vector
  reqData$Global_active_power <- as.numeric(levels(reqData$Global_active_power)[reqData$Global_active_power])

## Select device to plot
  png(file = "./data/Course4/ExData_Plotting1/figures/plot2.png", bg = "transparent")

## Plot line graph
  with(reqData,plot(Time,Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## Switch off the device
  dev.off()