library(ggplot2)
library(plotly)

# pass in dataset needed for pie chart chart
top_10_scores_2019 <- read.csv("data/Top-10-GHS-Index-2019.csv")

GHS_row_pie <- select(top_10_scores_2021, Year, Country, OVERALL.SCORE)

# convert into a data frame
scores2019 <- data.frame("Country"=rownames(top_10_scores_2019), top_10_scores_2019)
data <- scores2019[,c('Country', 'OVERALL.SCORE')]

colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')

piechart <- plot_ly(data, labels = c("US", "Australia", "Finalnd", "Thailand", "Slovenia", 
                                     "United Kingdon", "Netherlands", "Canada", "Denmark", "Sweden"), 
               values = ~OVERALL.SCORE, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste(OVERALL.SCORE),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               showlegend = FALSE)
piechart <- piechart %>% layout(title = 'Top 10 Index Scores by Country',
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
piechart

