# Load data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

########################################################################
# Subset NEI on sources from coal combustion and Baltimore City county #
########################################################################

# Subset NEI on county
NEI.Bal = subset(NEI, fips == "24510")
# Look for lines in all columns containing the word Motor and Vehicle in SCC
motrows <- unique(do.call(c, sapply(SCC, grep, pattern = "(.*)[Mm]otor(.*)")))
vehrows <- unique(do.call(c, sapply(SCC, grep, pattern = "(.*)[Vv]ehicle(.*)")))
bothrows <- intersect(motrows,vehrows)
# Which SCC values corespond to motor vehicles and are present in the NEI data set
SCCboth <- intersect(unique(NEI.Bal$SCC),SCC[bothrows,"SCC"])
# Subset NEI.Bal on Motor Vehicle sources
NEI.Bal.MotVeh <- NEI.Bal[NEI.Bal$SCC %in% SCCboth,]
yearsums <- tapply(NEI.Bal.MotVeh$Emissions, NEI.Bal.MotVeh$year, sum)

###################
# Plot and Export #
###################

png("plot5.png", width = 480, height = 480)
plot(names(yearsums),yearsums, xlab = "Years", ylab = "PM2.5 Emission (tons)", main = "Anual PM2.5 Emission from Motor Vehicles in Baltimore City")
dev.off()