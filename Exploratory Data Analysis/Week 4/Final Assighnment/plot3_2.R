## Plot 3
# Which of source types have seen decreases/increases in emissions from 1999–2008 for Baltimore City?
#
library(dplyr)
library(ggplot2)

# Dataset: the National Emissions Inventory (NEI)
# from the Environmental Protection Agency (EPA)
# [29Mb]
#
data_folder <- "exdata_data_NEI_data"
data_zip_name <- "exdata_data_NEI_data.zip"
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

# Dowload data source if not already done, and set NEI and SCC
if(!file.exists(data_zip_name)) {
        
        download.file(data_url, destfile = data_zip_name, method = "curl")
        if(!dir.exists(data_folder)) {
                dir.create(data_folder, showWarnings = TRUE, recursive = FALSE, mode = "0744")
        }
        unzip(data_zip_name, exdir = data_folder)
        
}
if (!exists("NEI")){
        
        NEI <- readRDS(paste(data_folder,"/summarySCC_PM25.rds", sep=""))
        
}

###########################

# Subset NEI.Baltimore from NEI
NEI.Baltimore <- subset(NEI,fips=="24510")

# Summarise NEI.Baltimore, with year and type
NEI.Baltimore <- NEI.Baltimore %>% group_by(type,year)
NEI.Baltimore <- as.data.frame(NEI.Baltimore %>% summarise(sum(Emissions)))
names(NEI.Baltimore) <- c("type", "year", "emissions")

# Plot png file "plot3.png"
# Plot NEI.Baltimore
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
g <- ggplot(
        data = NEI.Baltimore,
        aes(x = year, y = emissions, color = type, group = type)
)
g <- g + geom_line() + theme_bw()
g <- g + ggtitle("Plot 3 : PM2.5 Emissions in Baltimore City from 1999 to 2008 per type")
g <- g + ylab("Emissions [ in tons ]") + xlab("Year") + scale_color_discrete(name = "Type")
print(g)
dev.off()