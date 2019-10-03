(fit$coef[2] - fit$coef[3])/1.6011
summary(fit)$coef
lmF <- lm(Numeric[Sex=="Female"] ~ Year[Sex=="Female"],hunger)
lmM <- lm(Numeric[Sex=="Male"] ~ Year[Sex=="Male"],hunger)
lmBoth <- lm(data = hunger, Numeric ~ Year + Sex) # intercept is hungry females at year 0
lmInter <- lm(data = hunger, Numeric ~ Year + Sex + Sex*Year)