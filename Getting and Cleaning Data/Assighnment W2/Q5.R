if (!file.exists("data")){
    dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

download.file(fileURL, destfile = "./data/Q5.csv", method = "curl")

data <- read.fwf("./data/Q5.csv", header = FALSE, widths = c(10,5,4,4,5,4,4,5,4,4,5,4,4), skip = 4)
data[,c(2,5,8,11)] <- NULL
    