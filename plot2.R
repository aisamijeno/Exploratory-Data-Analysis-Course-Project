## ====================
## PROJECT DESCRIPTION:
## ====================
## Script for plot2.png

# This project performs the following steps:
# - Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# - Name each of the plot files as plot1.png, plot2.png, etc.
# - Create a separate R code file plot1.R, plot2.R that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png. 
#   Your code file should include code for reading the data so that the plot can be fully reproduced. 
#   You must also include the code that creates the PNG file.
# - Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)

#Set working directory and Downloaded file
#read txt file
powerConsum <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#Change classes of Date and Time variables
powerConsum$Date <- as.Date(powerConsum$Date, format = "%d/%m/%Y")
powerConsum$DateTime <- strptime(paste(powerConsum$Date,powerConsum$Time),
                                 format = "%Y-%m-%d %H:%M:%S")
#Choose data from "2007-2-1" to "2007-2-2"
powerConsum <- powerConsum[powerConsum$Date >= "2007-2-1" & powerConsum$Date <= "2007-2-2",]

#Change classes of Data's 3:8 columns
powerConsum[,3] <- as.numeric(powerConsum[,3])
powerConsum[,4] <- as.numeric(powerConsum[,4])
powerConsum[,5] <- as.numeric(powerConsum[,5])
powerConsum[,6] <- as.numeric(powerConsum[,6])
powerConsum[,7] <- as.numeric(powerConsum[,7])
powerConsum[,8] <- as.numeric(powerConsum[,8])

#Constructing plot2 
with(powerConsum, plot(DateTime, Global_active_power, type = "l", xlab = "",
                       ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis(side = 1, at = c(as.numeric(powerConsum$DateTime[1]),
                      as.numeric(powerConsum$DateTime[1441]),
                      as.numeric(powerConsum$DateTime[2880])),labels = c("Thu","Fri","Sat"))
#Save plot2 to a PNG file
dev.copy(device = png, width = 480, height = 480, file = "plot2.png")