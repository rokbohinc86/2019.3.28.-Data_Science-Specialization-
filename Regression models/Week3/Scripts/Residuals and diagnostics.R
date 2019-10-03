fit <- lm(y ~ x, out2)
plot(fit, which = 1) # plots residuals versus fitted values.
fitno <- lm(y ~ x, out2[-1,]) # fitting with the outlier removed
plot(fitno, which = 1)

View(dfbeta(fit)) #  does the fit by subtracting points from the data set

resno <- out2[1, "y"] - predict(fitno, out2[1,])
1-resid(fit)[1]/resno # the influence, leverage, or hat value

hatvalues(fit) # does the same

# outliers have often different standard deviation

# Standardized residuals #
sigma <- sqrt(deviance(fit)/df.residual(fit)) # sample standard devation, here you have to devide by the degrees of freedom of the fit
rstd <- resid(fit)/(sigma*sqrt(1-hatvalues(fit))) #  computatoiin of standard residuals
rstandard(fit) # calculates standardized residuals
plot(fit, which = 3) # Scale-Location plot shows the square root of standardized residuals against fitted values. 
plot(fit, which=2) # QQ plot of standardized residuals against normal with constant variance

# Studentized residuals #
sigma1 <- sqrt(deviance(fitno)/df(fitno))
resid(fit)[1]/(sigma1 * sqrt(1-hatvalues(fit)[1]))
rstudent(fit)[1]

# Cook's distance #
# It is essentially the sum of squared differences between values fitted with | and without a particular sample. It is normalized (divided by) residual sample variance times the number of predictors
dy <- predict(fitno, out2) - predict(fit, out2)
sum(dy^2)/(2*sigma^2) 
cooks.distance(fit)[1]
plot(fit, which=5)