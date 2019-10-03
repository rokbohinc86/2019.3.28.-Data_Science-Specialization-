# Load data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")


# Load libraries
library(ggplot2)

##############################################################################
# Subset NEI on sources from Motor Vehicles, and county Baltimore City & LA  #
##############################################################################

# Subset NEI on counties
NEI.Bal = subset(NEI, fips == "24510")
NEI.LA = subset(NEI, fips == "06037")
# Look for lines in all columns containing the word Motor and Vehicle in SCC
motrows <- unique(do.call(c, sapply(SCC, grep, pattern = "(.*)[Mm]otor(.*)")))
vehrows <- unique(do.call(c, sapply(SCC, grep, pattern = "(.*)[Vv]ehicle(.*)")))
bothrows <- intersect(motrows,vehrows)
# Which SCC values corespond to motor vehicles and are present in the NEI data set
SCCboth <- intersect(unique(NEI.Bal$SCC),SCC[bothrows,"SCC"])
# Subset NEI.Bal and NEI.LA on Motor Vehicle sources
NEI.Bal.MotVeh <- NEI.Bal[NEI.Bal$SCC %in% SCCboth,]
NEI.LA.MotVeh <- NEI.LA[NEI.LA$SCC %in% SCCboth,]

# Sum all values for the same year in Baltimore City and LA
yearsums.Bal <- tapply(NEI.Bal.MotVeh$Emissions, NEI.Bal.MotVeh$year, sum)
yearsums.LA <- tapply(NEI.LA.MotVeh$Emissions, NEI.LA.MotVeh$year, sum)
# create a tidy data frame
data <- data.frame(Emission = c(yearsums.Bal,yearsums.LA), County = c(rep("BC",4), rep("LA",4)), Year = rep(names(yearsums.Bal),2))

###################
# Plot and Export #
###################

g <- ggplot(data, aes(Year, Emission)) + geom_point() + facet_wrap(.~County, scales = "free")
g + labs(x = "Years", y = "PM2.5 Emission (tons)", title = "Anual PM2.5 Emission from Motor Vehicles in Baltimore City and Los Angeles")
ggsave("plot6.png")