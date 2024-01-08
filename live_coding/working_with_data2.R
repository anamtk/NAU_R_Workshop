#load libraries that we'll need
library(tidyverse)

#load our datasets
data <- read_csv('data/raw/data.csv')
surveys <- read_csv('data/cleaned/surveys_complete_77_89.csv')

#str() to look at dataframes
str(surveys)

#i want an average by year
surveys %>%
  group_by(year) %>%
  summarize(mean_wt = mean(weight, na.rm = TRUE))
  
#make data longer
#dataset has a tree ID column and three columns for needle lengths/tree
data %>%
  pivot_longer(cols = c(needle1, needle2, needle3),
               names_to = "needle_num",
               values_to = "length")

  
  