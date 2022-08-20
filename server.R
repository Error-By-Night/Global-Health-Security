library(dplyr)
source("scripts/table.R")
source("scripts/top_10_scores_2021_barchart.R")
source("scripts/top_10_scores_2019_piechart.R")

GHSIndex <- read.csv("data/GHS-Index.csv")
top_10_scores_2021 <- read.csv("data/Top-10-GHS-Index-2021.csv")

server <- function(input, output) {
  output$GHS_final <- renderTable(GHS_final)
  output$scatterplot <- renderPlotly(scatterplot)
  output$piechart <- renderPlotly(piechart)
  output$barchart <- renderPlotly(barchart)
}