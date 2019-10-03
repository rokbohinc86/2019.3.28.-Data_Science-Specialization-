# Load data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Sum all values for the same year 
yearsums <- tapply(NEI$Emissions, NEI$year, sum)

###################
# Plot and Export #
###################
png("plot1.png", width = 480, height = 480)
plot(names(yearsums),yearsums, xlab = "Years", ylab = "PM2.5 Emission (tons)", main = "Total Anual PM2.5 Emission in United States")
dev.off()

