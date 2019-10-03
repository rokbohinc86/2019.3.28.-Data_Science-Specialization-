library(data.table)
library(dplyr)

if (!file.exists("data")){
        dir.create("data")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

# download data

download.file(fileURL, destfile = "./data/gdp.csv", method = "curl")
download.file(fileURL2, destfile = "./data/edu.csv", method = "curl")
dateDownloaded <- date()

gdp <- fread("./data/gdp.csv", skip = 4, nrows = 191, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
edu <- read.csv("./data/edu.csv")

mergedData = merge(gdp, edu, by.x="CountryCode", by.y="CountryCode", all=TRUE) %>% arrange(desc(Rank))

int <- grep(".*[Ff][Ii][Ss][Cc][Aa][Ll].*end.*[Jj][Uu][Nn][Ee]", mergedData$Special.Notes)
length(mergedData$Special.Notes[int]) %>% print