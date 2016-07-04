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
  
  
    ## For figure (1,1)
    reqData$Global_active_power <- as.numeric(levels(reqData$Global_active_power)[reqData$Global_active_power])
  
    ## For figure (2,1)
    reqData$Sub_metering_1 <- as.numeric(levels(reqData$Sub_metering_1)[reqData$Sub_metering_1])
    reqData$Sub_metering_2 <- as.numeric(levels(reqData$Sub_metering_2)[reqData$Sub_metering_2])
    ## reqData$Sub_metering_3 is already in numeric format
  
    ## For figure (1,2)
    reqData$Voltage <- as.numeric(levels(reqData$Voltage)[reqData$Voltage])
  
    ## For figure (2,2)
    reqData$Global_reactive_power <- as.numeric(levels(reqData$Global_reactive_power)[reqData$Global_reactive_power])
  
  
  ## Select device to plot
    png(file = "./data/Course4/ElectricPowerConsumptionData/figures/plot4.png", bg = "transparent")
  
  ## Make the grid for plots
    par(mfrow = c(2,2))
  
  ## Plot line graphs
    ## Figure (1,1)
    with(reqData,plot(Time,Global_active_power,type = "l", xlab = "", ylab = "Global Active Power"))
  
    ## Figure (1,2)
    with(reqData,plot(Time,Voltage,type = "l", xlab = "", ylab = "Voltage"))
  
    ## Figure (2,1)
    with(reqData,plot(Time,Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering"))
    with(reqData,lines(Time,Sub_metering_2, col = "red"))
    with(reqData,lines(Time,Sub_metering_3, col = "blue"))
    ## Legend
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lwd = 1, box.col = "transparent")
  
    ## Figure (2,2)
    with(reqData,plot(Time,Global_reactive_power,type = "l", xlab = "", ylab = "Global Reactive Power"))
  
  
  
  ## Switch off the device
    dev.off()