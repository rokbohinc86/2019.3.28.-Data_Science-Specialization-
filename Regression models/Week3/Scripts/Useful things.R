library(ggplot2)
library(GGally)
data(swiss)
g = ggpairs(swiss, lower = list(continous = "smooth")) # creates a cool pairs plot with correlations added

library(rgl)
n = 100; x2 <- 1 : n; x1 = .01 * x2 + runif(n, -.1, .1); y = -x1 + x2 + rnorm(n, sd = .01)
plot3d(x1,x2,y) # 3d plotting

data(swiss); par(mfrow = c(2, 2))
fit <- lm(Fertility ~ . , data = swiss); 
plot(fit) # ploting diagnostics for fits


?influence.measures
#residuals
rstandard(fit) #residuals divided by their standard deviations
rstudent(fit) #residuals divided by their standard deviations, where the ith data point was deleted in the calculation of the standard deviation for the residual to follow a t distribution
#Laverage
hatvalues(fit) #The hat values are necessarily between 0 and 1 with larger values indicating greater (potential for) leverage.
#influence
dffits(fit) # change in the predicted response when the i th point is deleted in fitting the model.
dfbetas(fit) # change in individual coefficients when the i th point is deleted in fitting the model.
cooks.distance(fit) # overall change in the coefficients when the i th point is deleted.

summary(fit)$adj.r.squared # adjusts for number of fitted parameters
summary(fit)$r.squared

library(car)
vif(fit) # is the varience inflation factor

# Nested model testing
fit1 <- lm(Fertility ~ Agriculture, data = swiss)
fit3 <- update(fit1, Fertility ~ Agriculture + Examination + Education)
fit5 <- update(fit1, Fertility ~ Agriculture + Examination + Education + Catholic + Infant.Mortality)
anova(fit1, fit3, fit5)



fullModel <- lm(data=mtcars, mpg ~ .)
step(fullModel, k=log(nrow(mtcars)))