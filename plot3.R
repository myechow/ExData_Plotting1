#setting working directory

  setwd('C:\\Users\\me-ch\\Downloads\\Graduate Courses\\Miscellaneous\\Data Science Specialization\\Exploratory Data Analysis')

#reading the text file and assigning the name for the function
  
  proj <- read.table(file='C:\\Users\\me-ch\\Downloads\\Graduate Courses\\Miscellaneous\\Data Science Specialization\\Exploratory Data Analysis\\exdata_data_household_power_consumption\\household_power_consumption.txt', 
                     header = TRUE, sep = ";", dec = ".", na.strings = "?") 

  #sub-setting proj function into proj1
  
  proj1 <- proj[proj$Date %in% c("1/2/2007","2/2/2007") ,]
  
  datetime <- strptime(paste(proj1$Date, proj1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
#converting character values in Global_active_power, subMetering1, subMetering2, and subMetering3 variables into numeric values 
  
  GAP <- as.numeric(proj1$Global_active_power)
  subMetering1 <- as.numeric(proj1$Sub_metering_1)
  subMetering2 <- as.numeric(proj1$Sub_metering_2)
  subMetering3 <- as.numeric(proj1$Sub_metering_3)
  
#creating a plot with desired formats and custom x label
  
  png("plot3.png")
  
#creating plot with custom formats
  
  plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="", xaxt="n")
  
  lines(datetime, subMetering2, type="l", col="red")
  lines(datetime, subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  axis.POSIXct(1, at=datetime, labels=format(datetime, "%a"))
  
dev.off()