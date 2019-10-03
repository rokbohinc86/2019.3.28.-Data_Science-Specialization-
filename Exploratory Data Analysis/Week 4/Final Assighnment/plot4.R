# Load data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Load libraries
library(lattice)
library(tidyr)
library(stringr)

##############################################
# Subset NEI on sources from coal combustion #
##############################################

# Look for lines in all columns containing the word Comb or Combustion in SCC
combrows <- unique(do.call(c, sapply(SCC, grep, pattern = "(.*)[Cc]omb (.*)|(.*)[Cc]ombustion (.*)")))
# Look for lines in all columns containing the word Coal in SCC
coalrows <- unique(do.call(c, sapply(SCC, grep, pattern = "(.*)[Cc]oal (.*)")))
# Look which rows have both patterns in SCC
bothrows <- intersect(coalrows,combrows)
# Which SCC values corespond to coal combustion and are present in the NEI data set
SCCboth <- intersect(unique(NEI$SCC),SCC[bothrows,"SCC"])
# Subset
NEI <- NEI[NEI$SCC %in% SCCboth,]

########################################################################
# Create factor variable state.fips.year over which to sum all values #
########################################################################

# Remove all fips that correspond to NA
NEI <- NEI[str_trim(NEI$fips) != "NA",]

# Extract the statefips from fips as the first two characters in the string
NEI$statefips <- sapply(NEI$fips, substr, start = 1, stop = 2)

# Create factor variable state.fips.year
NEI$statefips.year <- as.factor(paste(NEI$statefips,NEI$year,sep = "."))

########################################################################
# Create the data set for ploting emission across the different states #
########################################################################

# Sum all values for the same year and statefips
statefips.year.sums <- tapply(NEI$Emissions, NEI$statefips.year, sum)
# create a data frame
data <- data.frame(statefips.year = names(statefips.year.sums), value = statefips.year.sums, row.names = as.character(c(1:length(statefips.year.sums))))
# Make data frame tindy
data <- data %>% separate( col = statefips.year, into = c("statefips","year"), sep = "[.]") %>%
        transform(statefips = as.factor(statefips), value = as.numeric(value), year = as.integer(year))
# remove state fips = TR, which is the last 207th value
data <- data[1:206,] 

###################
# Plot and Export #
###################

png("plot4.png", width = 600, height = 600)
print(xyplot(value ~ year | statefips, data, ylab="PM2.5 Emission (tons)",main="Anual PM2.5 State Emission from Coal Combustion"))
dev.off()