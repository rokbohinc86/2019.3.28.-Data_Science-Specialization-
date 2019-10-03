# library(RMySQL) do not read otherwise you will get an error
library(sqldf)

# set working directory and create dir named data where I download data

setwd("/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Getting and Cleaning Data/Assighnment W2")
if (!file.exists("data")){
    dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

# download data

download.file(fileURL, destfile = "./data/temp.csv", method = "curl")
dateDownloaded <- date()

# read
acs <- read.csv("./data/temp.csv")