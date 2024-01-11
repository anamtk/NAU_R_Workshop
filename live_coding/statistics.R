#load the tidyverse package
library(tidyverse)

#install.packages(c("palmerpenguins", "multcomp"))

#load the palmerpenguins and multcomp packages
library(palmerpenguins)
library(multcomp)

#load the penguins dataset
penguins <- palmerpenguins::penguins
# :: is a way to tell R exactly what package you want it to look in for something

#Look at the structure of penguins
str(penguins)

#Summary statistics

#look at the mean value of penguin body mass
# $ makes a column of a dataframe into a vector
mean(penguins$body_mass_g)

#tell mean function how to deal with missing data
mean(penguins$body_mass_g, na.rm = TRUE)

#Let's look at the means across groups, here thinking about sex differences
# %>% = "and then"
penguins %>%
  #group the penguins dataset by sex
  group_by(sex) %>%
  #look at the mean body mass by sex
  summarize(mean = mean(body_mass_g, na.rm = TRUE))

#t-test to compare weight between female and male penguins
#Hypothesis: Does sex have an influence on weight?
#Null hypothesis: Sex does not have an influence on weight
#Alternative hypothesis: Sex does have an influence on weight

#t-tests are for TWO groups
#~ is an operator letting R know this is a "formula" (relationship between two things)
t.test(penguins$body_mass_g ~ penguins$sex)

#Let's look at the means across groups, here thinking about sex differences
# %>% = "and then"
penguins %>%
  #group the penguins dataset by sex
  group_by(sex) %>%
  #look at the mean body mass by sex
  #and then the sample size by sex
  summarize(mean = mean(body_mass_g, na.rm = TRUE),
            N = n())

#Let's plot the body masses by sex in the penguins dataset
penguins2 <- penguins %>%
  #filter() out the missing data from the sex column
  filter(!is.na(sex)) 

#plot with the ggplot() function
ggplot(data = penguins2,
       mapping = aes(x = sex,
                     y = body_mass_g)) +
  geom_boxplot()

#One-way ANOVA
#comparing means across a set of groups
# Hypothesis: Penguins of different species have different sizes
# Null hypothesis: That species are not different sizes
# Alternative hypothesis: Species are different sizes

#oneway.test() function for a one-way ANOVA
oneway.test(body_mass_g ~ species,
            data = penguins)












