mu0 = 30
mua = 32
sigma = 4
n = 16


alpha = 0.05
z = qnorm(1 - alpha)
pnorm(mu0 + z * sigma/sqrt(n), mean = mu0, sd = sigma/sqrt(n), lower.tail = FALSE)
pnorm(mu0 + z * sigma/sqrt(n), mean = mua, sd = sigma/sqrt(n), lower.tail = FALSE)

#######################################
library(manipulate)
library(ggplot2)

mu0 = 30
myplot <- function(sigma, mua, n, alpha) {
        g = ggplot(data.frame(mu = c(27, 36)), aes(x = mu))
        g = g + stat_function(fun = dnorm, geom = "line", args = list(mean = mu0,
                                                                      sd = sigma/sqrt(n)), size = 2, col = "red")
        g = g + stat_function(fun = dnorm, geom = "line", args = list(mean = mua,
                                                                      sd = sigma/sqrt(n)), size = 2, col = "blue")
        xitc = mu0 + qnorm(1 - alpha) * sigma/sqrt(n)
        g = g + geom_vline(xintercept = xitc, size = 3)
        g
}
manipulate(myplot(sigma, mua, n, alpha), 
           sigma = slider(1, 10, step = 1, initial= 4),
           mua = slider(30, 35, step = 1, initial = 32), 
           n = slider(1, 50, step = 1, initial = 16), 
           alpha = slider(0.01, 0.1, step = 0.01, initial = 0.05)
           )

# non central t test

 power.t.test(n = 16, delta = 2/4, sd = 1, type = "one.sample", alt = "one.side\
d")$power
[1] 0.604
# illustrating that it depends only on the effect size, delta/sd
 power.t.test(n = 16, delta = 2, sd = 4, type = "one.sample", alt = "one.sided")$power
[1] 0.604
# same thing again
 power.t.test(n = 16, delta = 100, sd = 200, type = "one.sample", alt = "one.sided")$power
[1] 0.604
# specifying the power and getting n
 power.t.test(power = 0.8, delta = 2/4, sd = 1, type = "one.sample", alt = "one.sided")$n
[1] 26.14
# again illustrating that the effect size is all that matters
power.t.test(power = 0.8, delta = 2, sd = 4, type = "one.sample", alt = "one.sided")$n
[1] 26.14
# again illustrating that the effect size is all that matters
 power.t.test(power = 0.8, delta = 100, sd = 200, type = "one.sample", alt = "one.sided")$n