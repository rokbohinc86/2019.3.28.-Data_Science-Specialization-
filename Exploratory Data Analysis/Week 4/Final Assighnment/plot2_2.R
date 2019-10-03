## Plot 2
# Total Emissions from PM2.5 in Baltimore City (fips == "24510") per years from 1999 to 2008
#
library(dplyr)

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

# Summarise NEI.Baltimore, per year
NEI.Baltimore <- NEI.Baltimore %>% group_by(year)
NEI.Baltimore <- as.data.frame(NEI.Baltimore %>% summarise(sum(Emissions)))
names(NEI.Baltimore) <- c("year","total_baltimore_emissions")
NEI.Baltimore$year <- as.character(NEI.Baltimore$year)

# Plot png file "plot2.png"
# Plot NEI.Baltimore
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
par(mfrow = c(1,1), mar = c(4,4,3,1), oma = c(1,1,0.5,2), fg="black")
plot(
        x = NEI.Baltimore$year,
        y = NEI.Baltimore$total_baltimore_emissions,
        type = "l",
        lwd=3,
        col="red",
        main="Plot 2 : PM2.5 Emissions in Baltimore from 1999 to 2008",
        ylab ="Emissions [ in tons ]",
        xlab ="Year",
        xlim = c(1999,2008),
        ylim = c( 0,4000)
)
dev.off()