# Overal descrition of the script:
# This script downloads the data and unzip it in the corresponding directories

# set working directory and create dir named data where I download data
setwd("/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Exploratory Data Analysis/Week 4/Final Assighnment")
if (!file.exists("data")){
        dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

# download data 
download.file(fileURL, destfile = "./data/Emission.zip", method = "curl")

# record the date the data has been downloaded
dateDownloaded <- date()

# Extract data
library(zip)
setwd("./data/")
unzip("./Emission.zip")

rm(fileURL)