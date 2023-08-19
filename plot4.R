#setting working directory

  setwd('C:\\Users\\me-ch\\Downloads\\Graduate Courses\\Miscellaneous\\Data Science Specialization\\Exploratory Data Analysis')

#reading the text file and assigning the name for the function
  
  proj <- read.table(file='C:\\Users\\me-ch\\Downloads\\Graduate Courses\\Miscellaneous\\Data Science Specialization\\Exploratory Data Analysis\\exdata_data_household_power_consumption\\household_power_consumption.txt', 
                     header = TRUE, sep = ";", dec = ".", na.strings = "?") 
  
#sub-setting proj function into proj1
  
  proj1 <- proj[proj$Date %in% c("1/2/2007","2/2/2007") ,]
  
#creating a new function datetime with Date and Time formats
  
  datetime <- strptime(paste(proj1$Date, proj1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
#converting character values in Global_active_power, Global_reactive_power, and voltage variables into numeric values 
  
  GAP <- as.numeric(proj1$Global_active_power)
  GRP <- as.numeric(proj1$Global_reactive_power)
  V <- as.numeric(proj1$Voltage)

#converting character values in subMetering1, subMetering2, and subMetering3 variables into numeric values   
  
  subMetering1 <- as.numeric(proj1$Sub_metering_1)
  subMetering2 <- as.numeric(proj1$Sub_metering_2)
  subMetering3 <- as.numeric(proj1$Sub_metering_3)
  
#creating png file of the plot

  png("plot4.png")
  
#arranging multiple plots into panels
  
  par(mfrow = c(2, 2)) 
  
#creating 4 plots with desired formats and custom x labels
  
  plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2) #1st plot
  axis.POSIXct(1, at=datetime, labels=format(datetime, "%a"))
  
  plot(datetime, V, type="l", xlab="datetime", ylab="Voltage")                #2nd plot
  axis.POSIXct(1, at=datetime, labels=format(datetime, "%a"))
  
  plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")  #3rd plot
  lines(datetime, subMetering2, type="l", col="red")
  lines(datetime, subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  axis.POSIXct(1, at=datetime, labels=format(datetime, "%a"))
  
  plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power", xaxt="n")  #4th plot
  axis.POSIXct(1, at=datetime, labels=format(datetime, "%a"))

dev.off()