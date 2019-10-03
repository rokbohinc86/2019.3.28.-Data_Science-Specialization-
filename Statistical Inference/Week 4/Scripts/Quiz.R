#Q1
a <- c(140,138,150,148,135)
b <- c(132,135,151,146,130)
t.test(a, b, paired = TRUE, var.equal = TRUE, alternative = "two.sided")

# Q2
1100 + c(-1,1) * qt(0.975,df=9-1) * 30/sqrt(9)

# Q3
pbinom(2, 4, 0.5, lower.tail = FALSE, log.p = FALSE)

# Q4 # here you cannot have fractions
a <- 1/100
b <- 10/1787
ppois(b*1787, round(a*1787), lower.tail = TRUE)

# Q5

n = 9
x=-3
y= 1
sx=1.5
sy=1.8
S <- sqrt((sx^2+sy^2)/n)
pt((y-x)/S, df = 2*n-2, lower.tail = FALSE)

# Q6
#wouldn't reject

# Q7

mu0 = 0
mua = 0.01
sigma = 0.04
n = 100
alpha = 0.05
z = qnorm(1 - alpha)

pnorm(mu0 + z * sigma/sqrt(n), mean = mua, sd = sigma/sqrt(n), lower.tail = FALSE)
power.t.test(n = n, delta = mua-mu0, sd = sigma, type = "one.sample", alt = "one.sided")$power

# Q8

power.t.test(power = 0.9, delta = mua-mu0, sd = sigma, type = "one.sample", alt = "one.sided", sig.level = 0.05)$n



