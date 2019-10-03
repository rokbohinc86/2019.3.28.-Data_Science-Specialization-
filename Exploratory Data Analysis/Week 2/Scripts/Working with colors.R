sample(colors(), 10)

# forming paletes
pal <- colorRamp(c("red","blue")) 
pal(0) # gives RGB
pal(seq(0,1,len=6))

p1 <- colorRampPalette(c("red","blue"))
p1(2)
p1(6)

p3 <- colorRampPalette(c("blue","green"), alpha = 0.5)

plot(x,y,pch=19,col=rgb(0,.5,.5))
plot(x,y,pch=19,col=rgb(0,.5,.5,.3))

cols <- brewer.pal(3, "BuGn")
pal <- colorRampPalette(cols)
image(volcano, col=pal(20))