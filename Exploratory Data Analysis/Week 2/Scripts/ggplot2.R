library(ggplot2)
qplot() # workhorse
# use factor variables, indicating subsets, which you want to label appropriately
ggplot() # core function doing thingd qplot canot do

str(mpg)
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, col = drv) # collors according to factor drv
qplot(displ, hwy, data = mpg, shape = drv)
qplot(displ, hwy, data = mpg, geom = c("point", "smooth")) # smooths the data, gray lines are 95% confidence level

# histograms
qplot(hwy, data = mpg, fill=drv) # only one variable
qplot(hwy, data = mpg, geom = "density") # smooths histogram, actually it is the density

# facets
qplot(displ, hwy, data = mpg, facets = .~ drv) #plots multiple graphs
qplot(hwy, data = mpg, facets = drv ~ ., binwidth=1) # also histograms

# adding linear fits
qplot(displ, hwy, data = mpg, col = drv) + geom_smooth(method = "lm")

# box and whisker plots
qplot(drv, hwy, data = mpg, geom = "boxplot")
qplot(drv, hwy, data = mpg, geom = "boxplot", color = manufacturer)

#################
# custumization #
#################

g <- ggplot(mpg, aes(displ, hwy))
p <- g + geom_point()
p <- g + geom_point() + geom_smooth()
p <- g + geom_point() + geom_smooth() + facet_grid(.~drv)
#g + geom_point() + facet_grid(drv~cyl,margins=TRUE)
#g + geom_point() + facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",size=2,se=FALSE,color="black") 

xlab()
ylab()
labs()
ggtitle()

##############
# aesthetics #
##############

g + geom_point(color = "steelblue", size = 4, alpha = 1/2)
g + geom_point(aes(color = drv), size = 4, alpha = 1/2)
g + geom_point(aes(color = drv), size = 4, alpha = 1/2) + labs(x = "bla", y = expression(R[2]))
g + geom_point(aes(color = drv), size = 4, alpha = 1/2) + theme_bw(base_family = "Times")
g + geom_point(aes(color = drv),size=2,alpha=1/2) + geom_smooth(size=4,linetype=3,method="lm",se=FALSE) 


g + geom_line() + coord_cartesian(ylim = c(12,25))



###################################
qplot(price, data=diamonds)
qplot(price, data=diamonds, binwidth = 18497/30)
qplot(price, data=diamonds, binwidth = 18497/30, fill = cut)
qplot(price,data=diamonds,geom="density", color = cut)
qplot(carat, price, data=diamonds, color=cut)
qplot(carat,price,data=diamonds, color=cut) + geom_smooth(method="lm")
qplot(carat,price,data=diamonds, color=cut, facets = .~cut) + geom_smooth(method="lm")
#####################################
g + geom_point(alpha=1/3)
cutpoints <- quantile(diamonds$carat, seq(0,1,length=4), na.rm = TRUE)
diamonds$car2 <- cut(diamonds$carat,cutpoints)
g + geom_point(alpha=1/3) + facet_grid(cut ~ car2)
g+geom_point(alpha=1/3)+facet_grid(cut~car2)+geom_smooth(method="lm",size=3,color="pink")
ggplot(diamonds,aes(carat,price))+geom_boxplot()+facet_grid(.~cut)