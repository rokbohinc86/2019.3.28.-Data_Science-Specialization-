
head(pollution)
summary(pollution$pm25)

# Boxplots
ppm <- pollution$pm25
boxplot(ppm,col="blue")
abline(h = 12)

# hisograms
hist(ppm, col = "green", breaks = 100)
rug(ppm) # that indicates the actual point
abline(v = 12, lwd =2) # value for the line, and line width
hist(subset(pollution,region=="west")$pm25, col = "green")

# barplot
barplot(reg, col = "wheat", main = "Number of Counties in Each Region")

# separate boxplot depending on the region
boxplot(data = pollution, pm25 ~  region)

# specify a plot for two rows and one column
par(mfrow=c(2,1),mar=c(4,4,2,1)) # mar specifies the margines

# scatterplot
with(pollution, plot(latitude, pm25))
abline(h = 12, lwd = 2, lty = 2) # lty = 2 means a dashed line
plot(pollution$latitude, ppm, col = pollution$region)


# settu multiple plot
par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
plot(west$latitude, west$pm25, main = "West")
plot(east$latitude, east$pm25, main = "East")



