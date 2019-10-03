## BASE
with(cars, plot(speed, dist))
text(mean(cars$speed), max(cars$dist), "SWIRL rules!") # gives labels on x and y axsis

## LATICE
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))
xyplot(Life.Exp ~ Income | region, data = state, layout = c(2,2))

# GGPLOT2
qplot(displ, hwy, data = mpg)