# Plot 3 Function
# Base line Plot for graphing the next three series:
#      energy sub-metering No. 1 (Sub_metering_1)
#      energy sub-metering No. 2 (Sub_metering_2)
#      energy sub-metering No. 3 (Sub_metering_3)

plot3 <- function(plot.data, plot.series, plot.title, plot.xlab, plot.ylab,  
                  plot.type = "l", plot.colors = c("black", "red", "blue"), plot.cex = 1.0, plot.bty = "o",
                  img.type = "png", img.file = "plot3", img.height = 480, img.width = 480, save = FALSE) {
  
  if (isTRUE(save)) {  
    # Trim off excess margin space (bottom, left, top, right)
    par(mfrow = c(1,1), mar=c(4.2, 4.2, 1.0, 0.2), cex=.64, bg = "transparent")
  }
  
  # Create the Plot for the first serie
  plot(plot.data$DateTime, plot.data[[plot.series[1]]],
                  type = plot.type,
                  col = plot.colors[1],
                  main = plot.title,
                  xlab = plot.xlab,
                  ylab = plot.ylab)
  
  # Create the graph line for the second serie
  lines(plot.data$DateTime, plot.data[[plot.series[2]]], 
        type = plot.type, 
        col = plot.colors[2])
  
  # Create the graph line for the third serie
  lines(plot.data$DateTime, plot.data[[plot.series[3]]], 
        type = plot.type, 
        col = plot.colors[3])
  
  # Create a legend for the series name in the top-right corner
  legend("topright", plot.series, col = plot.colors, 
         lty = 1, bty = plot.bty, cex = plot.cex, pt.cex = 1);
  
  # Save the graph If this is required
  if (isTRUE(save)) {
    graph2png(paste(img.file, img.type, sep = "."), img.height, img.width)
  }
}