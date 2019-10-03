## Code for creating plot in Course projet 2 for Exploratory Data Analysis
library(ggplot2)
library(data.table)

##read data
## This first line will likely take a few seconds. Be patient!
path = "./ExplorAnalysis/Project2/"
NEI <- readRDS(paste(path, "summarySCC_PM25.rds", sep = ""))
SCC <- readRDS(paste(path, "Source_Classification_Code.rds", sep=""))

##Create plot5
NEIBalt <- subset(NEI, fips=="24510" )
SCCVehicle <- subset(SCC, select = "SCC", tolower(SCC.Level.Two) %like% "vehicle")
NEIBaltVeh <- merge(NEIBalt, SCCVehicle, by = "SCC")

png(filename = paste(path,"Plot5.png" ,sep = ""), width = 480, height = 480, units = "px")

ggplot(data=NEIBaltVeh, aes(as.factor(year), Emissions)) + geom_bar(stat = "identity") + labs(x="Year", y="Tons PM2.5", title ="Emmission in Baltimor from motor vehicle sources") 

dev.off()