library(ggplot2)
library(plotly)

# pass in dataset needed for bar chart
top_10_scores_2021 <- read.csv("data/Top-10-GHS-Index-2021.csv")
top_10_scores_2019 <- read.csv("data/Top-10-GHS-Index-2019.csv")

GHS_row_bar <- select(top_10_scores_2021, Year, Country, OVERALL.SCORE)

# create a bar chart for the top 10 index scores in the year 2021
barchart <- ggplot(top_10_scores_2021, aes(x = Country, y = OVERALL.SCORE)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label=OVERALL.SCORE), vjust = 1.6, color = "black", size = 3.5) +
  labs(
    x = "Countries", 
    y = "Index Score",
    title = "Top 10 Countries by Index Score in 2021"
  )
