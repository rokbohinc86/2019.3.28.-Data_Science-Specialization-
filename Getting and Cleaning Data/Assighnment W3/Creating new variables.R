if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv",method="curl")
restData <- read.csv("./data/restaurants.csv")


s1 <- seq(1,10,by=2) # create sequence
s2 <- seq(1,10,length=3); # length of 3
x <- c(1,3,8,25,100); 
seq(along = x) # sequnce of same length as x


# making a new factor variable in restData named near me
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland") 
table(restData$nearMe)

# similarily creating a new factor variable with condition
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE) 
table(restData$zipWrong,restData$zipCode < 0)

# creating categories
restData$zipGroups = cut(restData$zipCode,breaks=quantile(restData$zipCode))
table(restData$zipGroups)

library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4) # equivalentely you can do with the cut2 funcion
table(restData$zipGroups)

# creating factor variable
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]

yesno <- sample(c("yes","no"),size=10,replace=TRUE)
yesnofac = factor(yesno,levels=c("yes","no")) # define "baseline", it is normaly done alfabetically
relevel(yesnofac,ref="no")

# mutate a dataframe = copy and add a column
library(Hmisc); library(plyr)
restData2 = mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)

# common functions

abs(x) #absolute value
sqrt(x) #square root
ceiling(x) #ceiling(3.475) is 4
floor(x) #floor(3.475) is 3
round(x,digits=n) #round(3.475,digits=2) is 3.48
signif(x,digits=n) #signif(3.475,digits=2) is 3.5
# cos(x) sin(x) log(x) log2(x), log10(x) exp(x) 






