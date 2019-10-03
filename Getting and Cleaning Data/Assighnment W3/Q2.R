library(jpeg)

setwd("/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Getting and Cleaning Data/Assighnment W3")

if (!file.exists("data")){
        dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

# download data

download.file(fileURL, destfile = "./data/picture.jpg", method = "curl")
dateDownloaded <- date()

# read
pic <- readJPEG("./data/picture.jpg", native=TRUE)
print(quantile(pic, c(0.3,0.8)))
