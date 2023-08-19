#setting working directory

  setwd('C:\\Users\\me-ch\\Downloads\\Graduate Courses\\Miscellaneous\\Data Science Specialization\\Exploratory Data Analysis')

#reading the text file and assigning the name for the function
  
  proj <- read.table(file='C:\\Users\\me-ch\\Downloads\\Graduate Courses\\Miscellaneous\\Data Science Specialization\\Exploratory Data Analysis\\exdata_data_household_power_consumption\\household_power_consumption.txt', 
                     header = TRUE, sep = ";", dec = ".", na.strings = "?") 

#sub-setting proj function into proj1
  
  proj1 <- proj[proj$Date %in% c("1/2/2007","2/2/2007") ,]
  
#creating a new function datetime with Date and Time formats

  datetime <- strptime(paste(proj1$Date, proj1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
#converting character values in Globa;_active_power variable into numeric as GAP function
  
  GAP <- as.numeric(proj1$Global_active_power)
  
#creating png file of the plot
  
  png("plot2.png", width=480, height=480)
  
#creating a plot with desired formats and custom x label
  
  plot(datetime, GAP, type="l", xlab=" ", ylab="Global Active Power (kilowatts)", xaxt="n")
  axis.POSIXct(1, at=datetime, labels=format(datetime, "%a"))
 
dev.off()