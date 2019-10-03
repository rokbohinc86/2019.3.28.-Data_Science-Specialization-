# Load data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Load libraries
library(ggplot2)
library(tidyr)

# Subset NEI on Baltimore City county
NEI.Bal = subset(NEI, fips == "24510")

# create a new factor variable by pasting type and year variables
NEI.Bal$type.year <- as.factor(paste(NEI.Bal$type,NEI.Bal$year,sep = "."))
# Sum all values for the same year and type
typeyearsums <- tapply(NEI.Bal$Emissions, NEI.Bal$type.year, sum)

#Create a tidy data set
data <- data.frame(type.year = names(typeyearsums), value = typeyearsums, row.names = as.character(c(1:length(typeyearsums))))
data <- data %>% separate( col = type.year, into = c("type","year"), sep = "[.]") %>%
        transform(type = as.factor(type), value = as.numeric(value), year = as.integer(year))

###################
# Plot and Export #
###################
g <- ggplot(data, aes(year, value)) + geom_point() + geom_smooth(method = "lm")+ facet_wrap(.~type, scales = "free")
g + labs(x = "Years", y = "PM2.5 Emission (tons)", title = "Total Anual PM2.5 Emission in Baltimore City - Source Type")
ggsave("plot3.png")
