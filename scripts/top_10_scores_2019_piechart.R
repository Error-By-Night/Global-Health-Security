library(ggplot2)

# pass in dataset needed for pie chart chart
top_10_scores_2019 <- read.csv("data/Top-10-GHS-Index-2019.csv")

# create a piechart for the top 10 index scores in the year 2019
piechart <- pie(top_10_scores_2019$OVERALL.SCORE, labels = top_10_scores_2019$Country, radius = 1,
              col = c("#52D726", "#FFEC00", "#FF7300", "red", "#007ED6", "#7CDDDD", "#003F5C", 
                      "#58508D", "pink", "violet"))
