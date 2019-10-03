library(data.table)

## fast reading of data tables
DT <- fread("./data/Ohio.csv")
system.time(DT[,mean(pwgtp15),by=SEX])