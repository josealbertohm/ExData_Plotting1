# Plot 4 Function
# Base line Plot for graphing the next three series:
#      energy sub-metering No. 1 (Sub_metering_1)
#      energy sub-metering No. 2 (Sub_metering_2)
#      energy sub-metering No. 3 (Sub_metering_3)

plot4 <- function(plot.data, plot.type = "l",
                  img.type = "png", img.file = "plot4", img.height = 480, img.width = 480) {
  
  title <- "Global Active Power"
  
  # Trim off excess margin space (bottom, left, top, right)
  par(mfrow = c(2,2), mar=c(4.2, 4.2, 1.0, 0.2), bg = "transparent")
  
  with(plot.data, {
    plot4.1(plot.data, "", "", paste(title,"(kilowatts)"), plot.type)
    plot4.2(plot.data, "", "datetime", "Voltage", plot.type)
    plot4.3(plot.data, "", "", "Energy sub metering", plot.type = plot.type)
    plot4.4(plot.data, "", "datetime", "Global_reactive_power", plot.type = plot.type)
  })

  graph2png(paste(img.file, img.type, sep = "."), img.height, img.width)
}

# Graphic for the top-left (1, 1)
plot4.1 <- function(plot.data, title, plot.xlab, plot.ylab, plot.type) {
  plot2(plot.data, title, plot.xlab, plot.ylab, plot.type = plot.type)
}

# Graphic for the top-right (1, 1)
plot4.2 <- function(plot.data, plot.title, plot.xlab, plot.ylab, plot.type) {
  # Create the graph line using the base plot
  with(plot.data, plot(DateTime, Voltage,
                       type = plot.type,
                       main = plot.title,
                       xlab = plot.xlab,
                       ylab = plot.ylab))
}

# Graphic for the bottom-left (2, 1)
plot4.3 <- function(plot.data, plot.title, plot.xlab, plot.ylab, plot.type) {
  series <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  colors <- c("black", "red", "blue")
  plot3(input.clean.data, series, plot.title, plot.xlab, plot.ylab, 
        plot.type = plot.type, plot.colors = colors, plot.cex = 0.55, plot.bty = "n")
}

# Graphic for the bottom-right (2, 2)
plot4.4 <- function(plot.data, plot.title, plot.xlab, plot.ylab, plot.type) {
  # Create the graph line using the base plot
  with(plot.data, plot(DateTime, Global_reactive_power,
                       type = plot.type,
                       main = plot.title,
                       xlab = plot.xlab,
                       ylab = plot.ylab))
}