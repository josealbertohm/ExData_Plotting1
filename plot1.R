# Plot 1 Function
# Histogram for Global Active Power
plot1 <- function(plot.data, plot.title, plot.xlab, plot.ylab, 
                  plot.color = "red",  
                  img.type = "png", img.file = "plot1", img.height = 480, img.width = 480, save = FALSE) {
  
  if (isTRUE(save)) {  
    # Trim off excess margin space (bottom, left, top, right)
    par(mar=c(4.2, 4.2, 1.0, 0.2), bg = "transparent")
  }
  
  # Create the Histogram for this base plot
  hist(plot.data$Global_active_power,
                  col = plot.color,
                  main = plot.title,
                  xlab = plot.xlab,
                  ylab = plot.ylab, font.main = 2, cex.main = 1)
  
  # Save the graph If this is required
  if (isTRUE(save)) {
    graph2png(paste(img.file, img.type, sep = "."), img.height, img.width)
  }
}