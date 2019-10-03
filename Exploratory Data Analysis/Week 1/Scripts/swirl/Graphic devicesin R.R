#on Unix/Linux x11() is the screen device
?Devices
with(faithful, plot(eruptions, waiting))
title("Old Faithful Geyser data")
dev.cur() # shows you the the device you the current plotting device
dev.off() # closes the device

dev.set(x) # sets a graphic device eqal to integer (x>=2)
dev.copy(device = png, file = "geyserplot.png") # copies a plot from one device to another
dev.copy2pdf() # copies a plot to pdf