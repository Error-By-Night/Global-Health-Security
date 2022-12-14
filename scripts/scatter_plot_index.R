library(ggplot2)

# pass in sorted csv file with selected countries
sorted_data <- read.csv("data/sorted-GHS-Index-2019.csv")

# plot the dataframe as a scatterplot of values
scatterplot <- ggplot(sorted_data, aes(x = Country, y = OVERALL.SCORE)) +
                geom_point() +
                theme(axis.text.x=element_blank(), axis.ticks.x = element_blank()) + #remove x axis labels 
                labs(title="Countries and their GHS Index Score",
                x = "Country", y = "Index Score")
scatterplot
