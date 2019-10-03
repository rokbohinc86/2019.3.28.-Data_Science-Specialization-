setwd("/home/rok/Edjucation/2019.3.28. Data_Science-Specialization/Getting and Cleaning Data/Assighnment W3")

if (!file.exists("data")){
        dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

# download data

download.file(fileURL, destfile = "./data/gdp.csv", method = "curl")
download.file(fileURL2, destfile = "./data/edu.csv", method = "curl")
dateDownloaded <- date()

# read gdp
gdp <- read.csv("./data/gdp.csv", skip = 4) %>% select(X,X.1,X.3,X.4) %>% rename( CountryCode = X, Ranking = X.1, GDP = X.4, Country = X.3)
gdp <- tbl_df(gdp)
gdp <- gdp[1:190,]
gdp$GDP <- as.numeric(gsub(",", "", as.character(gdp$GDP), fixed = T))
gdp$Ranking <- as.numeric(gsub(",", "", as.character(gdp$Ranking), fixed = T))
gdp <- gdp %>% arrange(Ranking)
print(gdp[13,3])                       

# read edu
edu <- read.csv("./data/edu.csv")
print(sum(!is.na(match(edu$CountryCode, gdp$CountryCode))))


#library(dplyr); 
#gdp <- as_tibble(gdp)
#colSums(is.na(gdp))
#dim(gdp)

#gdp <- gdp %>% filter(X != "") %>% select(X:X.4) %>% select(-X.2) %>% rename( CountryCode = X,GDP = X.4, Country = X.3) %>% filter((GDP != "..") & GDP != "")

#mergedData = merge(gdp, edu, by.x="CountryCode", by.y="CountryCode", all=TRUE) %>% filter(!is.na(GDP)) %>% arrange(GDP)
#print(sum(!is.na(match(edu$CountryCode, gdp$CountryCode))))
