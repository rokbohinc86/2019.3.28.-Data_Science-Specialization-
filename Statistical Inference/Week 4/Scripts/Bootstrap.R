library(UsingR)
data(father.son)
x <- father.son$sheight
n <- length(x)
B <- 10000
resamples <- matrix(sample(x, n * B, replace = TRUE), B, n)
resampledMedians <- apply(resamples, 1, median)

sd(resampledMedians)
quantile(resampledMedians, c(.025, .975))

g = ggplot(data.frame(medians = resampledMedians), aes(x = resampledMedians))
g = g + geom_histogram(color = "black", fill = "lightblue", binwidth = 0.05)
g


# Group comparison using permutation test

data(InsectSprays)
g = ggplot(InsectSprays, aes(spray, count, fill = spray))
g = g + geom_boxplot()
g


subdata <- InsectSprays[InsectSprays$spray %in% c("B", "C"),]
y <- subdata$count
group <- as.character(subdata$spray)
testStat <- function(w, g) mean(w[g == "B"]) - mean(w[g == "C"])
observedStat <- testStat(y, group)
permutations <- sapply(1 : 10000, function(i) testStat(y, sample(group)))

mean(permutations > observedStat)