set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA

X[(X$var1 <= 3 | X$var3 > 15),] # logical subsetting

X[which(X$var2 > 8),] # for subseting on NA's you can use which to bypass the problem 

sort(X$var1) # sorting increasing
sort(X$var1,decreasing=TRUE) # sorting decreasing
sort(X$var2,na.last=TRUE) # what to do with NAs

X[order(X$var1),] # ordering for variable var1
X[order(X$var1,X$var3),] # additional ordering after var1 ordering

library(plyr) # ordering with plyr
arrange(X,var1) # does the same thing as order
arrange(X,desc(var1)) # decreasing order

X$var4 <- rnorm(5) # adding rows

Y <- cbind(X,rnorm(5)) # column bind