library(reshape2)
head(mtcars)

#melt function
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars,id=c("carname","gear","cyl"),measure.vars=c("mpg","hp")) # the id get copied, the measure vars get stacked
head(carMelt,n=3)

# casting data frames

cylData <- dcast(carMelt, cyl ~ variable) # gives different values of cyl and the for variables it givesthe # of different values
cylData <- dcast(carMelt, cyl ~ variable,mean)# similar but gives the means

# Averaging values
tapply(InsectSprays$count,InsectSprays$spray,sum) # variable, factor, function

# spliat apply combine
spIns =  split(InsectSprays$count,InsectSprays$spray)

sprCount = lapply(spIns,sum)
unlist(sprCount)

sapply(spIns,sum)

# another method
library(plyr)
ddply(InsectSprays,.(spray),summarize,sum=sum(count))
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum)) # don't really get how it does it, but it calculcates the sum
# for all values within a factor and generates the same size data frame as the original 
