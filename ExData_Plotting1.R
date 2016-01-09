# ExData_Plotting1.R script
# R Script for covering the Exploratory Data Analysis
# Assignment Course Project 1

# Function input_data for:
# Getting the data from the CSV input file 
# Cleaning the data loaded
input_data <- function(file.source, justdates) {
  # Read the CSV data splited by ';'
  input.data <- read.csv(file.source, header = TRUE, sep = ";", dec = ".", 
                       colClasses=c("character", "character", rep("numeric",7)), na="?")

  input.data$DateTime <- strptime(paste(input.data$Date, input.data$Time), format="%d/%m/%Y %H:%M:%S")

  # Convert the first column 'Date' from character type to Date type 
  input.data[,1] <- as.Date(input.data[,1], format="%d/%m/%Y")

  # Cleaning the data, Subset of the two dates required or used
  input.clean.data <- subset(input.data, Date %in% as.Date(justdates, "%Y-%m-%d"))

  # Remove the rest of data unused
  remove(input.data)
  
  return(input.clean.data)
}


# Function graph2png for:
# Saving the plot generated in a PNG device 
# with the filenam and sizes passed as parameters
graph2png <- function(img.file, img.height = 480, img.width = 480) {
  # Set the device to the PNG device
  options(device = function() png(height = img.height, width = img.width))
  
  # Save the histogram to the image file
  dev.copy(png, img.file)
  
  # Turn Off the device
  dev.off()  
}

# ==========================================
# Main part for all the four plots
# ==========================================

# CSV Input file name
file.source <- "data/household_power_consumption.txt"

# Getting and Clean the Input Data for the two dates required
input.clean.data <- input_data(file.source, c("2007-02-01", "2007-02-02"))


# Table sumary for validating
table(input.clean.data$Date)
# Head data for review the top data
head(input.clean.data)

par(mfrow = c(1,1), mar=c(4.2, 4.2, 1.0, 0.2), bg = "transparent")

# Validate If exist the plot1 function
if(!exists("plot1", mode="function")) source("plot1.R")
title <- "Global Active Power"
plot1(input.clean.data, title, paste(title,"(kilowatts)"), "Frequency", plot.color = "red", save = TRUE)


# Validate If exist the plot2 function
if(!exists("plot2", mode="function")) source("plot2.R")
title <- "Global Active Power"
plot2(input.clean.data, "", "", paste(title,"(kilowatts)"), plot.type = "l", save = TRUE)


# Validate If exist the plot3 function
if(!exists("plot3", mode="function")) source("plot3.R")
series <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colors <- c("black", "red", "blue")
plot3(input.clean.data, series, "", "", "Energy sub metering", plot.type = "l", 
      plot.colors = colors, save = TRUE)


# Validate If exist the plot4 function
if(!exists("plot4", mode="function")) source("plot4.R")
plot4(input.clean.data)
