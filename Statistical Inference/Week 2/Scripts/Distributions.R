#########################
# Binomial Distribution #
#########################

#Suppose a friend has 8 children, 7 of which are girls and none are twins. If each gender has an
#independent 50% probability for each birth, what’s the probability of getting 7 or more girls out of
#8 births?
choose(8, 7) * 0.5^8 + choose(8, 8) * 0.5^8
pbinom(6, size = 8, prob = 0.5, lower.tail = FALSE)

#######################
# Normal distributoin #
#######################

#What is the 95 th percentile of a N (29, σ=4.72 ) distribution?
qnorm(.95, mean = mu, sd = sigma)

#Imaging asking what’s the probability that a randomly drawn subject
#from this population has a BMI less than 24.27?
pnorm(24.27, 29, 4.73)

#Assume that the number of daily ad clicks for a company is (approximately) normally distributed
#with a mean of 1020 and a standard deviation of 50. What’s the probability of getting more than
#1,160 clicks in a day?
pnorm(1160, 1020, 50, lower.tail =FALSE)

###########
# Poisson #
###########

# The number of people that show up at a bus stop is Poisson with a mean of 2.5 per hour. If watching
#the bus stop for 4 hours, what is the probability that $3$ or fewer people show up for the whole
#time?
ppois(3, lambda = 2.5 * 4)

#We flip a coin with success probability 0.01 five hundred times. What’s the probability of 2 or fewer
#successes?

ppois(2, lambda = 500 * 0.01)
pbinom(2, size = 500, prob = 0.01)

