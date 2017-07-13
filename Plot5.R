##File downloaded already to the directory bellow
setwd("~/Desktop/DATA/exdata%2Fdata%2FNEI_data.zip Folder")
library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.motor <- grep("motor", SCC$Short.Name, ignore.case = TRUE)
SCC.motor <- SCC[SCC.motor, ]
SCC.identifiers <- as.character(SCC.motor$SCC)
NEI$SCC <- as.character(NEI$SCC)
NEI.motor <- NEI[NEI$SCC %in% SCC.identifiers, ]

NEI.motor.24510 <- NEI.motor[which(NEI.motor$fips == "24510"), ]

aggregate.motor.24510 <- with(NEI.motor.24510, aggregate(Emissions, by = list(year), 
                                                         sum))

plot(aggregate.motor.24510, type = "o", ylab = expression("Total Emissions, PM"), 
     xlab = "Year", main = "Total Emissions from Motor Vehicle")
##save the png
dev.copy(png,'Plot5.png')
dev.off()
