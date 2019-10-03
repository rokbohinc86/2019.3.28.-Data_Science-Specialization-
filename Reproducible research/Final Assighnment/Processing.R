library(dplyr)
library(lubridate)
library(ggplot2)

data <- read.csv("./data/Storm.csv")
data <- select(data, STATE__, BGN_DATE, EVTYPE, F, MAG, FATALITIES, INJURIES, PROPDMG, PROPDMGEXP, CROPDMG, CROPDMGEXP)
data[,2] <- mdy_hms(data[,2])
first(sort(data[,2]))
last(sort(data[,2]))

datasum <- group_by(data, EVTYPE) %>% summarise(sum(FATALITIES), sum(INJURIES))
datasum <- datasum[order(datasum$`sum(FATALITIES)`, datasum$`sum(INJURIES)`, decreasing = TRUE),]
