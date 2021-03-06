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
## Convert factor varible to vector
  globalActPow <- as.numeric(levels(reqData$Global_active_power)[reqData$Global_active_power])

## Select device to plot
  png(file = "./data/Course4/ExData_Plotting1/figures/plot1.png", bg = "transparent")

## Plot histogram
  hist(globalActPow, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

## Switch off the device
  dev.off()
