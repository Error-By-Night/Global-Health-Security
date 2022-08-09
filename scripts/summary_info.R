library(dplyr)

# dataset is in a different folder, must call folder in order to access
# sort the dataframe and select the wanted columns and write into a new csv file
# old_df <- read.csv("data/2021-GHS-Index-April-2022.csv")
# sorted_df <- old_df %>%
# select(Country, Year, OVERALL.SCORE) %>% 
# as.data.frame()
# GHSindex_summary <- write.csv(sorted_df,"GHSINDEX.csv")

# pass in dataset and store in a dataframe variable
GHSINDEX <- read.csv("data/GHS-Index.csv")

# create a function that takes in a dataset as a parameter and returns a list in 
# the form of a table. Here, the table shows overall scores, the lowest score,
# highest score, average score, and
summary_info <- function(dataset) {
  summary <- list()
  summary$total_observations <- nrow(dataset) 
  summary$lowest_Score_S <- dataset %>%
    group_by(OVERALL.SCORE) %>%
    summarise(low = n()) %>%
    arrange(low) %>%
    head(1) %>%
    select(OVERALL.SCORE)
  summary$lowest_Score <- dataset %>%
    group_by(OVERALL.SCORE) %>%
    summarise(low = n()) %>%
    arrange(low) %>%
    head(1) %>%
    select(Country)
  summary$highest_Score_S <- dataset %>%
    group_by(OVERALL.SCORE) %>%
    summarise(high = n()) %>%
    arrange(desc(high)) %>%
    head(1) %>%
    select(OVERALL.SCORE)
  summary$highest_Score <- dataset %>%
    group_by(OVERALL.SCORE) %>%
    summarise(high = n()) %>%
    arrange(desc(high)) %>%
    head(1) %>%
    select(Country)
  summary$avg_Score_2019 <- dataset %>%
    group_by(OVERALL.SCORE) %>%
    filter(Year == 2019) %>%
    summarise(avg = mean(OVERALL.SCORE)) %>%
    arrange(avg) %>%
    head(1) %>%
    select(OVERALL.SCORE)
  summary$avg_Score_2021 <- dataset %>%
    group_by(OVERALL.SCORE) %>%
    filter(Year == 2021) %>%
    summarise(avg = mean(OVERALL.SCORE)) %>%
    arrange(avg) %>%
    head(1) %>%
    select(OVERALL.SCORE)
  
  return(summary)
}
