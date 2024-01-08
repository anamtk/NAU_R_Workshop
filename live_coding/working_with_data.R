#load the tidyverse package
#install.packages("tidyverse")
library(tidyverse)

#import our surveys csv into R
surveys <- read_csv("data/cleaned/surveys_complete_77_89.csv")

#see what kind of data surveys is
class(surveys)

#Manipulating Data

#I only want some columns from my dataframe: select()
select(surveys, plot_id, species_id, hindfoot_length)

#select numbers of columns
select(surveys, c(3:5, 10))

#select all numeric columns
select(surveys, where(is.numeric))

#select all columns with missing data
select(surveys, where(anyNA))

#filter() rows that we want out of our dataset
filter(surveys, year == 1985)

#there are lots of operators in R
# == equal to
# > greater than
# >= greater than or equal
#<= less than or equal to
# < less than
# != not equal to
# %in% - looks for matches in a vector

filter(surveys, species_id %in% c("RM", "DO"))

#filter by multiple rows
filter(surveys, year <= 1998 & !is.na(hindfoot_length))

#How to string multiple data manipulation steps together

#First option: save intermediate objects
surveys_noday <- select(surveys, -day)
filter(surveys_noday, month >= 7)

#Second option: the pipe operator %>% 
#keyboard shortcut Shift+Cmd+M, Shift+Ctrl+M
surveys %>%
  select(-day) %>% #select everything but day
  #filter all months including july and after
  filter(month >= 7)

surveys_sub <- surveys %>%
  select(-day) %>%
  filter(month >= 7)

#Create new columns: mutate()

#make a weight in kilograms column in the surveys dataset
surveys %>%
  mutate(weight_kg = weight/1000)

#make multiple new columns in the same mutate() function
surveys %>%
  mutate(weight_kg = weight/1000,
         weight_lbs = weight_kg*2.2)

#date column by combining multiple other columns
surveys %>%
  mutate(date = paste(year, month, day, sep = "-")) %>%
  select(date)

#dates in the lubridate package
library(lubridate)
surveys %>%
  mutate(date = paste(year, month, day, sep = "-"),
         date = ymd(date)) %>%
  select(date)


#Split-Apply-Combine approach
#group_by()
#summarize()

#find the mean weight by sex in the survey dataset
surveys %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

#make more than one column within the summarize function
surveys %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE),
            n = n())

#can group by multiple columns at once
surveys %>%
  group_by(species_id, sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE),
            n = n())

#remove rows where weight is missing prior to summarizing
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(species_id, sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE),
            n = n())

#save as object and ungroup
survey_sum <- surveys %>%
  filter(!is.na(weight)) %>%
  group_by(species_id, sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE),
            n = n()) %>%
  ungroup()

#export this new data object from R
write_csv(survey_sum, 'data/cleaned/surveys_meanweight_species.csv')



