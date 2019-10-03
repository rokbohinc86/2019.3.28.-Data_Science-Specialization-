# read gdp
gdp <- read.csv("./data/gdp.csv", skip = 4) %>% select(X,X.1,X.3,X.4) %>% rename( CountryCode = X, Ranking = X.1, GDP = X.4, Country = X.3)
gdp <- tbl_df(gdp)
gdp <- gdp[1:190,]
gdp$GDP <- as.numeric(gsub(",", "", as.character(gdp$GDP), fixed = T))
gdp$Ranking <- as.numeric(gsub(",", "", as.character(gdp$Ranking), fixed = T))
gdp <- gdp %>% arrange(Ranking)

# read edu
edu <- read.csv("./data/edu.csv")
mergedData = merge(gdp, edu, by.x="CountryCode", by.y="CountryCode", all=TRUE)

print(mean(filter(mergedData, Income.Group == "High income: OECD")[,2], na.rm = TRUE))
print(mean(filter(mergedData, Income.Group == "High income: nonOECD")[,2], na.rm = TRUE))