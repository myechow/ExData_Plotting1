#setting working directory

  setwd('C:\\Users\\me-ch\\Downloads\\Graduate Courses\\Miscellaneous\\Data Science Specialization\\Exploratory Data Analysis')

#reading the text file and assigning the name for the function
  
  proj <- read.table(file='C:\\Users\\me-ch\\Downloads\\Graduate Courses\\Miscellaneous\\Data Science Specialization\\Exploratory Data Analysis\\exdata_data_household_power_consumption\\household_power_consumption.txt', 
                     header = TRUE, sep = ";", dec = ".", na.strings = "?") 

#subsetting proj into proj1
  
  proj1 <- proj[proj$Date %in% c("1/2/2007","2/2/2007"), ]
  
#creating png file of the plot
  
  png("plot1.png")   
  
#creating the histogram with desired color, limits, and labels
  
  hist(proj1[,3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")             
  
 
dev.off()