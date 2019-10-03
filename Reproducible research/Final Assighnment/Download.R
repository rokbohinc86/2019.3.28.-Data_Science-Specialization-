setwd("/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Reproducible research/Final Assighnment")
if (!file.exists("data")){
            dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"

# download data

download.file(fileURL, destfile = "./data/Storm.csv", method = "curl")

# record the date the data has been downloaded

dateDownloaded <- date()