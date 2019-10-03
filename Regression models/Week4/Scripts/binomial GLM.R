download.file("https://github.com/jtleek/dataanalysis/blob/master/week5/002binaryOutcomes/data/ravensData.rda?raw=true", destfile="./data/ravensData.rda",method="curl")
load("./data/ravensData.rda")
head(ravensData)

lmRavens <- lm(ravensData$ravenWinNum ~ ravensData$ravenScore)
summary(lmRavens)$coef

logRegRavens = glm(ravensData$ravenWinNum ~ ravensData$ravenScore,family="binomial")
summary(logRegRavens)
plot(ravensData$ravenScore,logRegRavens$fitted,pch=19,col="blue",xlab="Score",ylab ="Prob Ravens Win")
exp(logRegRavens$coeff)
exp(confint(logRegRavens))




x = seq(-10, 10, length = 1000)
beta0 = 0; beta1 = 1
p = 1 / (1 + exp(-1 * (beta0 + beta1 * x)))
y = rbinom(prob = p, size = 1, n = length(p))
plot(x, y, frame = FALSE, xlab = "x", ylab = "y")
lines(lowess(x, y), type = "l", col = "blue", lwd = 3)
fit = glm(y ~ x, family = binomial)
lines(x, predict(fit, type = "response"), lwd = 3, col = "red")


# excercise 1
library(dplyr)
data(Seatbelts)
Seatbelts <- as.data.frame(Seatbelts)
Seatbelts <- mutate(Seatbelts, newVar = 1*(Seatbelts$DriversKilled>119))
round(summary(glm(Seatbelts$newVar ~ Seatbelts$kms + Seatbelts$PetrolPrice + Seatbelts$law, family = "binomial"))$coef,3)

# excercise 2
round(summary(glm(cbind(DriversKilled, drivers - DriversKilled) ~ kms + law + PetrolPrice, data = Seatbelts,family = "binomial"))$coef,3)

# excercise 3

fit1 <- glm(Seatbelts$newVar ~ Seatbelts$law, family = "binomial")
fit2 <- glm(Seatbelts$newVar ~ Seatbelts$law + Seatbelts$PetrolPrice, family = "binomial")
fit3 <- glm(Seatbelts$newVar ~ Seatbelts$law + Seatbelts$PetrolPrice + Seatbelts$kms, family = "binomial")
anova(fit1,fit2,fit3)