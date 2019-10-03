library(data.table)
library(dplyr)

gdp <- fread("./data/gdp.csv", skip = 4, nrows = 191, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
edu <- read.csv("./data/edu.csv")

mergedData = merge(gdp, edu, by.x="CountryCode", by.y="CountryCode", all=TRUE) %>% arrange(desc(Rank))