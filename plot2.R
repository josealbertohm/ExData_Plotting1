# Plot 2 Function
# Base line Plot for graphing the Date-Time and Global Active Power
plot2 <- function(plot.data, plot.title, plot.xlab, plot.ylab, 
                  plot.type = "l", plot.color = "black",  
                  img.type = "png", img.file = "plot2", img.height = 480, img.width = 480, save = FALSE) {
  
  if (isTRUE(save)) {  
    # Trim off excess margin space (bottom, left, top, right)
    par(mar=c(4.2, 4.2, 1.0, 0.2), bg = "transparent")
  }
  
  # Create the graph line using the base plot
  with(plot.data, plot(DateTime, Global_active_power,
                  type = plot.type,
                  col = plot.color,
                  main = plot.title,
                  xlab = plot.xlab,
                  ylab = plot.ylab))

  # Save the graph If this is required
  if (isTRUE(save)) {
    graph2png(paste(img.file, img.type, sep = "."), img.height, img.width)
  }
}