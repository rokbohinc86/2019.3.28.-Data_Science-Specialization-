setwd("/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Getting and Cleaning Data/Assighnment W4")

if (!file.exists("data")){
        dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

# download data

download.file(fileURL, destfile = "./data/gdp.csv", method = "curl")
dateDownloaded <- date()

# read
library(data.table)
library(dplyr)

gdp <- fread("./data/gdp.csv", skip = 4, nrows = 191, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total")) %>% filter(!is.na(Rank))

print(mean(as.numeric(gsub(",| ","", gdp$Total))))

# Q3
countryNames <- gdp$Economy
print(grep("^United",countryNames))