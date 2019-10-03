mergedData <- filter(mergedData, !is.na(GDP))
mergedData <- mutate(mergedData, cutGDP = cut(mergedData$GDP,breaks=quantile(mergedData$GDP, seq(0, 1, 0.2))))
Fout <- filter(mergedData, Income.Group == "Lower middle income", cutGDP == "(2.63e+05,1.62e+07]")
print(length(Fout[,1]))