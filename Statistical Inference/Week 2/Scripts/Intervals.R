library(UsingR)
data(father.son)
x <- father.son$sheight
(mean(x) + c(-1, 1) * qnorm(0.975) * sd(x)/sqrt(length(x)))/12 # 12 is the conversion from feet to inches

# Your campaign advisor told you that in a random sample of 100 likely voters, 56 intent to vote for
# you. Can you relax? Do you have this race in the bag?
0.56 + c(-1, 1) * qnorm(0.975) * sqrt(0.56 * 0.44/100)
binom.test(56, 100)
binom.test(56, 100)$conf.int

# Here the coverage is actualy below 0.975 because of the low n, if n is bigger, CLT ensures the intervals are corretly estimated
n <- 20
pvals <- seq(0.1, 0.9, by = 0.05)
nosim <- 1000
coverage <- sapply(pvals, function(p) {
        phats <- rbinom(nosim, prob = p, size = n)/n # generate nosim random binom outcomes with prob p and size n
        ll <- phats - qnorm(0.975) * sqrt(phats * (1 - phats)/n) # fro each result calculate the confidence intervals
        ul <- phats + qnorm(0.975) * sqrt(phats * (1 - phats)/n)
        mean(ll < p & ul > p) # whats the percentage that prob lies inside the confidence interval 
})

# a quick fix is add two sucess and 4 failures, then the confidence interval is better estimated - Agrestic/Coull interval
n <- 20
pvals <- seq(0.1, 0.9, by = 0.05)
nosim <- 1000
coverage <- sapply(pvals, function(p) {
        phats <- (rbinom(nosim, prob = p, size = n) + 2)/(n + 4)
        ll <- phats - qnorm(0.975) * sqrt(phats * (1 - phats)/n)
        ul <- phats + qnorm(0.975) * sqrt(phats * (1 - phats)/n)
        mean(ll < p & ul > p)
})

#A nuclear pump failed 5 times out of 94.32 days. Give a 95% confidence interval for the failure rate per day.
x <- 5
t <- 94.32
lambda <- x/t
round(lambda + c(-1, 1) * qnorm(0.975) * sqrt(lambda/t), 3)
poisson.test(5, 94.32, conf.level = .95)$conf.int

lambdavals <- seq(0.005, 1, by = 0.1)
nosim <- 1000
t <- 100
coverage <- sapply(lambdavals, function(lambda) {
        lhats <- rpois(nosim, lambda = lambda * t)/t
        ll <- lhats - qnorm(0.975) * sqrt(lhats/t)
        ul <- lhats + qnorm(0.975) * sqrt(lhats/t)
        mean(ll < lambda & ul > lambda)
})
