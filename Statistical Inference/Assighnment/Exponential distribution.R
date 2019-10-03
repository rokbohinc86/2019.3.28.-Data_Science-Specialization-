n <- 40 # number of samples
l <- 0.2 # characteristic parameter
nsim <- 1000 # number of simulations

data <- matrix(rexp(n*nsim,l), nsim) # sample n*nsim exponentials
means <- apply(data,1,mean) # calculate the mean of each row

meanth1 <- 1/l # theoretical value of the mean for 1 sample
sigmath1 <- 1/l # theoretical value of standard deviation for 1 sample
meanexp1 <- mean(data[,1])
sigmaexp1 <- sd(data[,1])

sigmath40 <- sigmath1/sqrt(n) # theoretical value of the standard deviation for n samples
meanth40 <- meanth1 # theoretical value of the mean for n samples
meanexp40 <- mean(means) # simulated mean for n samples
sigmaexp40 <- sd(means) # simulated standard deviation for n samples

# Show values
round(c(meanth1,sigmath1,meanexp1,sigmaexp1),2)
round(c(meanth40,sigmath40,meanexp40,sigmaexp40),2)

# Create plot
png("Means.png", width = 900, height = 480)
par(mfrow = c(1,2))
hist(means, breaks = 40, main = "Samples means from exponential distribution (n = 40)", xlab = "Sample values")
points(x = seq(2,8,0.1), y = 100 * dnorm(seq(2,8,0.1), mean = meanth40, sd = sigmath40), type = "l", col = "red")
abline(v = meanth40, col = "red", lwd = 2, lty = 3)
abline(v = meanexp40, col = "black", lwd = 2, lty = 2)
legend("topright", lty = c(1,1,2,3), col=c("black","red","black","red"), legend=c("Simulated distribution", "Normal distribution*100", "Sample mean", "Theoretical mean"))
hist(data[,1], breaks = 40, main = "Individual samples from exponential distribution (n = 1)", xlab = "Sample values")
abline(v = meanth1, col = "red", lwd = 2, lty = 3)
abline(v = meanexp1, col = "black", lwd = 2, lty = 2)
legend("topright", lty = c(1,2,3), col=c("black","red","black"), legend=c("Simulated distribution", "Sample mean", "Theoretical mean"))
dev.off()

#hist((means-meanth1)^2, breaks = 100, main = "Varience of means of 40 samples from the exponential distribution", xlab = "Varience of 40 samples from the explonential distribution", xlim = c(0,3))
#abline(v = sigmath40^2, col = "red", lwd = 2, lty = 2)
#abline(v = sexpsigmaexp40^2, col = "black", lwd = 2, lty = 2)
#legend("topright", lty = c(1,2,2), col=c("black","black","red"), legend=c("Simulated distribution", "Sample varience Mean", "Theoretical varience mean"))
