library(dplyr)
source("scripts/table.R")
source("scripts/top_10_scores_2021_barchart.R")

GHSIndex <- read.csv("data/GHS-Index.csv")
top_10_scores_2021 <- read.csv("data/Top-10-GHS-Index-2021.csv")

server <- function(input, output) {
  
}