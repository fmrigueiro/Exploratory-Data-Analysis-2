##File downloaded already to the directory bellow
setwd("~/Desktop/DATA/exdata%2Fdata%2FNEI_data.zip Folder")
library(lattice)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.coal <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
SCC.coal <- SCC[SCC.coal, ]
SCC.identifiers <- as.character(SCC.coal$SCC)

NEI$SCC <- as.character(NEI$SCC)
NEI.coal <- NEI[NEI$SCC %in% SCC.identifiers, ]

aggregate.coal <- with(NEI.coal, aggregate(Emissions, by = list(year), sum))
colnames(aggregate.coal) <- c("year", "Emissions")
#plot the date
plot(aggregate.coal, type = "o", ylab = expression("Total Emissions, PM25"), 
     xlab = "Year", main = "Emissions and Total Coal Combustion for the USA", 
     xlim = c(1999, 2008))
polygon(aggregate.coal, col = "blue", border = "black")
##Save png file
dev.copy(png,'Plot4.png')
dev.off()
