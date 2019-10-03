
#Q1
library(MASS)
library(dplyr)
shuttle <- shuttle %>% mutate(autoland = 1*(use == "auto"))
fit <- glm(shuttle$autoland ~ shuttle$wind, family = "binomial")
round((1/exp(summary(fit)$coeff[2])),3)

#Q2
fit <- glm(shuttle$autoland ~ shuttle$wind + shuttle$magn, family = "binomial")
round((1/exp(summary(fit)$coeff[2])),3)

#Q4
fit <- glm(InsectSprays$count ~ InsectSprays$spray, family = "poisson")
1/exp(fit$coefficients[2])

#Q5
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
plot(x,y)



