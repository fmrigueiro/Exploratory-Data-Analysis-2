##File downloaded already to the directory bellow
setwd("~/Desktop/DATA/exdata%2Fdata%2FNEI_data.zip Folder")
library(plyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.24510 <- NEI[which(NEI$fips == "24510"), ]
aggregate.24510 <- with(NEI.24510, aggregate(Emissions, by = list(year), sum))
colnames(aggregate.24510) <- c("year", "Emissions")


plot(aggregate.24510, type = "o", ylab = expression("Total Emissions, PM25"), 
     xlab = "Year", main = "Total Emissions for Baltimore city", xlim = c(1999, 2008))
##saving the file in png
dev.copy(png,'Plot2.png')
dev.off()
