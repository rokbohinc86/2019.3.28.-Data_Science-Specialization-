round(exp(coef(lm(I(log(gaData$visits + 1)) ~ gaData$julian))), 5)
glm2 = glm(visits ~ julian,family="quasipoisson", data = gaData)

# excercise 1
library(dplyr)
data(Seatbelts)
Seatbelts <- as.data.frame(Seatbelts)
fit <- glm(Seatbelts$DriversKilled ~ Seatbelts$kms + Seatbelts$PetrolPrice + Seatbelts$law, family = "poisson")
summary(fit)$coeff

#excercise 2
fit <- lm(I(log(Seatbelts$DriversKilled + 1)) ~ Seatbelts$kms + Seatbelts$PetrolPrice + Seatbelts$law)
exp(summary(fit)$coef)

#excercise 3
fit <- glm(Seatbelts$DriversKilled ~ Seatbelts$kms + Seatbelts$PetrolPrice + Seatbelts$law, offset = log(Seatbelts$drivers), family = "poisson")
summary(fit)$coeff