library("dplyr")
library("tidyr")

GHS <- read.csv("GHSindex.csv")

names(GHS)
names(GHS)[3] <- "Overall.Score"


GHS_simple <- group_by(GHS, Country, Year, Overall.Score)

GHS_row <- select(GHS, Year, Country, Overall.Score)

GHS_final <- GHS_row[ 371:390, ]

arrange(GHS_final, -Overall.Score)


## This table shows the global health index score of a pool of countries along with the year that the data was gathered. We extracted a random pool of 20 countries to give an example of how drastic the difference of safety can be within countries and even continents. The information displays how in countries within Africa there is a much lower index score versus those in Europe or North America. 
