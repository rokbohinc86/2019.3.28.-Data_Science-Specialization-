if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv",method="curl")
restData <- read.csv("./data/restaurants.csv")


quantile(restData$councilDistrict,na.rm=TRUE) # look at quntiles
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))  #look at specific quntiles
table(restData$zipCode, useNA="ifany") # counts the number of occurences, with ifany NAs are also returned
table(restData$councilDistrict,restData$zipCode) # also possible in two dimensions

sum(is.na(restData$councilDistrict)) # check for missing values
any(is.na(restData$councilDistrict)) # cheks if any of the elements is true
all(restData$zipCode > 0) # similarily all

colSums(is.na(restData)) # will give you the number of missing values in each column
all(colSums(is.na(restData))==0)

table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),] # subseting with a criteria

data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

# Cross tabs
xt <- xtabs(Freq ~ Gender + Admit,data=DF) # display frequency in a table saparated by he values of gender and admit

warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~.,data=warpbreaks) # the same but with 3 variables
xt
ftable(xt) # flatten table int 2D

# Size of a dataset

fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb") # print the size in Mb


