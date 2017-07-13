setwd("~/Desktop/DATA/exdata%2Fdata%2FNEI_data.zip Folder")
library(plyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##subsets data
aggregate.data <- with(NEI, aggregate(Emissions, by = list(year), sum))
##plot 1
plot(aggregate.data, type = "o", ylab = expression("Total Emissions, PM2.5"), 
     xlab = "Year", main = "Total Emissions in the United States")
polygon(aggregate.data, col = "blue", border = "red")

