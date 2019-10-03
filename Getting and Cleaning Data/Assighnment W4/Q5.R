library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

Y2012 <- (year(index(amzn)) == 2012)
print(dim(amzn[Y2012])[[1]])
sum2012 <- amzn[Y2012]
print(sum(wday(index(sum2012)) == 2))