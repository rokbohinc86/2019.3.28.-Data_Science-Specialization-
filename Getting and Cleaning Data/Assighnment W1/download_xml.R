
# set working directory and create dir named data where I download data
setwd("/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Getting and Cleaning Data/Assighnment W1")
if (!file.exists("data")){
    dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

# download data and metadata

download.file(fileURL, destfile = "./data/restaurants.xml", method = "curl")

# record the date the data has been downloaded

dateDownloaded <- date()