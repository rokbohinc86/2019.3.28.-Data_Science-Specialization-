# Download
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.csv",method="curl")
cameraData <- read.csv("./data/cameras.csv")

names(cameraData)
# You can convert all character to lower case with tolower
tolower(names(cameraData))

# Separate values that have periods
splitNames = strsplit(names(cameraData),"\\.")
splitNames[[5]]
splitNames[[6]]

# for lists you can then use sapply to take only the forst elemet
mylist <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)
firstElement <- function(x){x[1]}
sapply(splitNames,firstElement)


# Downolad
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv",method="curl")
download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")
reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)

# get rid of underscores
names(reviews)
sub("_","",names(reviews))

# sub applys only the first instance while gsub applies to all instances
testName <- "this_is_a_test"
sub("_","",testName)
gsub("_","",testName)

# grep gets the string positions
grep("Alameda",cameraData$intersection)
grep("Alameda",cameraData$intersection,value=TRUE) # prints out strings with the match
# grepl returns a vetor of true false values regarind the matching
grepl("Alameda",cameraData$intersection)

library(stringr)
nchar("Jeffrey Leek") # numbers of characters
substr("Jeffrey Leek",1,7) # take characters from 1st to seventh character
paste("Jeffrey","Leek") # stringjoin, paste0 separates wth ""
str_trim("Jeff      ") # removes whilte spaces











