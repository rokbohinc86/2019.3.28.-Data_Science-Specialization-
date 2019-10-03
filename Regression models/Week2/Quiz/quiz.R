#Q1 Q2
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y~x)
print(summary(fit)$coefficients)

# Q2
summary(fit)$sigma

#Q3
fit <- lm(mpg~wt, data = mtcars)
predict(fit, newdata = data.frame(wt=c(mean(mtcars$wt))),interval =("confidence"), q = .975) # this is the interval for the line

#Q5
predict(fit, newdata = data.frame(wt=c(3)),interval =("prediction")) # this is the interval for a new point (the intervals will be larger)

#Q6
fit <- lm(mpg~I(wt/2), data = mtcars)
coef <- summary(fit)$coefficients
print(coef[2,1] + c(-1, 1) * qt(.975, df = fit$df) * coef[2, 2])

#Q9
fit1 <- lm(mpg~1, data = mtcars)
fit2 <- lm(mpg~wt, data = mtcars)
print(sum(resid(fit2)^2)/sum(resid(fit1)^2))


