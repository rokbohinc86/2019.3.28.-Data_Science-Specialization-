# Random normal distribution (has a sd of 1)

nosim <- 100
n <- 10
sd(apply(matrix(rnorm(nosim * n), nosim), 1, mean))
1 / sqrt(n)

# Uniform distribution (has a sd of 1/12)

sd(apply(matrix(runif(nosim * n), nosim), 1, mean))
1 / sqrt(12 * n)

# Poisson distribution (has a sd of 2)

sd(apply(matrix(rpois(nosim * n, 4), nosim), 1, mean))
2 /  sqrt(n)

# Binom distribution (p = 0.5)

sd(apply(matrix(sample(0 : 1, nosim * n, replace = TRUE), nosim), 1, mean))
1 / (2 * sqrt(n))

# Example 

library(UsingR); 
data(father.son);
x <- father.son$sheight
n<-length(x)

round(c(var(x), var(x) / n, sd(x), sd(x) / sqrt(n)),2)


