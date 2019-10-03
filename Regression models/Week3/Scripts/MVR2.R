fit <- lm(data = InsectSprays, count ~ spray) # interestigly as spray is a factor variable you get  6 betas not 1
summary(fit)$coef
nfit <- lm(data = InsectSprays, count ~ spray - 1) # each coefficient is the mean for each factor

spray2 <- relevel(InsectSprays$spray,"C") # if we want a different refference level in the fir we can use relevel
fit2 <- lm(count ~ spray2, InsectSprays)

(fit$coef[2] - fit$coef[3])/1.6011 # get the t statistic for B relative to C from fit