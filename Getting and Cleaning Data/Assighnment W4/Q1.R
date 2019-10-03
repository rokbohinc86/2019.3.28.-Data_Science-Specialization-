setwd("/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Getting and Cleaning Data/Assighnment W4")

if (!file.exists("data")){
        dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

# download data

download.file(fileURL, destfile = "./data/Idaho.csv", method = "curl")
dateDownloaded <- date()

# read
data <- read.csv("./data/Idaho.csv")

strsplit(names(data),"wgtp")[[123]]