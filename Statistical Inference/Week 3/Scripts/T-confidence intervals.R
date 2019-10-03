# Compare the two distributions
k <- 1000
xvals <- seq(-5, 5, length = k)
myplot <- function(df){
        d <- data.frame(y = c(dnorm(xvals), dt(xvals, df)),
                        x = xvals,
                        dist = factor(rep(c("Normal", "T"), c(k,k))))
        g <- ggplot(d, aes(x = x, y = y))
        g <- g + geom_line(size = 2, aes(color = dist))
        g
}

myplot(df = 10)

#Compare quantiles
pvals <- seq(.5, .99, by = .01)
myplot2 <- function(df){
        d <- data.frame(n= qnorm(pvals),t=qt(pvals, df),
                        p = pvals)
        g <- ggplot(d, aes(x= n, y = t))
        g <- g + geom_abline(size = 2, col = "lightblue")
        g <- g + geom_line(size = 2, col = "black")
        g <- g + geom_vline(xintercept = qnorm(0.975))
        g <- g + geom_hline(yintercept = qt(0.975, df))
        g
}

## SAME GROUP ##

data(sleep)
qplot(sleep$extra, sleep$group, col=sleep$ID)
g1 <- sleep$extra[1 : 10]; g2 <- sleep$extra[11 : 20]
difference <- g2 - g1
mn <- mean(difference); s <- sd(difference); n <- 10
## Calculating directly
mn + c(-1, 1) * qt(.975, n-1) * s / sqrt(n)
## using R's built in function
t.test(difference)
## using R's built in function, another format
t.test(g2, g1, paired = TRUE)
## using R's built in function, another format
t.test(extra ~ I(relevel(group, 2)), paired = TRUE, data = sleep)


## INDEPENDANT GROUP ##

n1 <- length(g1); n2 <- length(g2)
sp <- sqrt( ((n1 - 1) * sd(g1)^2 + (n2-1) * sd(g2)^2) / (n1 + n2-2))
md <- mean(g2) - mean(g1)
semd <- sp * sqrt(1 / n1 + 1/n2)
rbind(
        md + c(-1, 1) * qt(.975, n1 + n2 - 2) * semd,
        t.test(g2, g1, paired = FALSE, var.equal = TRUE)$conf,
        t.test(g2, g1, paired = TRUE)$conf
)


library(datasets); data(ChickWeight); library(reshape2)
##define weight gain or loss
wideCW <- dcast(ChickWeight, Diet + Chick ~ Time, value.var = "weight")
names(wideCW)[-(1 : 2)] <- paste("time", names(wideCW)[-(1 : 2)], sep = "")
library(dplyr)
wideCW <- mutate(wideCW,
                 gain = time21 - time0
)


wideCW14 <- subset(wideCW, Diet %in% c(1, 4))
rbind(
        t.test(gain ~ Diet, paired = FALSE, var.equal = TRUE, data = wideCW14)$conf,
        t.test(gain ~ Diet, paired = FALSE, var.equal = FALSE, data = wideCW14)$conf
)


## INDEPENDANT GROUP , UNEQUAL VARIENCE ##

t.test(gain ~ Diet, paired = FALSE, var.equal = FALSE, data = wideCW14)$conf
