#Q1
data(mtcars)
mtcars$cyl <- as.factor(mtcars$cyl)
fit <- lm(data = mtcars,mpg ~ cyl + wt)
print(fit$coefficients[3])

#Q2
fit <- lm(data = mtcars,mpg ~ cyl + wt)
fit2 <- lm(data = mtcars,mpg ~ cyl)
print(rbind(summary(fit)$coef[3,],summary(fit2)$coef[3,]))

#Q3
fit <- lm(data = mtcars,mpg ~ cyl + wt)
fit2 <- lm(data = mtcars,mpg ~ cyl + wt + cyl * wt)
print(anova(fit,fit2))

#Q4
fit <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)

#Q5
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit <- lm(y ~ x)
hatvalues(fit)

#Q6
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit <- lm(y ~ x)
print(dfbetas(fit)[5,2])

#Q7



