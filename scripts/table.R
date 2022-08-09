library("dplyr")
library("tidyr")

GHS <- read.csv("GHSindex.csv")

names(GHS)
names(GHS)[3] <- "Overall.Score"


GHS_simple <- group_by(GHS, Country, Year, Overall.Score)

GHS_row <- select(GHS, Year, Country, Overall.Score)

GHS_column <- GHS_row[ 371:390, ]

GHS_final < - arrange(GHS_column, -Overall.Score)

View("GHS_final")
