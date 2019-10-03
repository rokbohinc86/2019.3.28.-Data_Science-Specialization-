# Load data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Subset NEI on Baltimore City county
NEI.Bal = subset(NEI, fips == "24510")

# Sum all values for the same year 
yearsums <- tapply(NEI.Bal$Emissions, NEI.Bal$year, sum)

###################
# Plot and Export #
###################
png("plot2.png", width = 480, height = 480)
plot(names(yearsums),yearsums, xlab = "Years", ylab = "PM2.5 Emission (tons)", main = "Total Anual PM2.5 Emission in Baltimore City")
dev.off()

