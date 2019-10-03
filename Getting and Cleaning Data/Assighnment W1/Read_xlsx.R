rowIndex <- 18 : 23
colIndex <- 7:15
dat <- read.xlsx("./data/natural_gas.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex, header = TRUE)
print(sum(dat$Zip*dat$Ext,na.rm=T))