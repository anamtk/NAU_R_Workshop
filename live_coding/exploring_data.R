#load packages
library(tidyverse)
library(ratdat)

#Let's explore the complete_old dataframe

#What kind of data object is complete_old?
class(complete_old)

#Let's look at the data that is in complete_old
#top of dataset:
head(complete_old)

#bottom of dataset:
tail(complete_old)

#Let's get some help with the head function
?head

#I want to look at the first 10 observations in complete_old
head(complete_old, n=10)

#if we define all the arguments, we can put them in any order
head(n = 10, x = complete_old)

#summary function to summarize every column in teh dataset
summary(complete_old)

#use the str() function to explore our dataframe
str(complete_old)

#use the $ operator to look at the year column 
complete_old$year

#Explore Vectors
c(1,2,5, 12, 4)

#let's assign this vector to an object
num <- c(1,2,5,12,4)

#what type of data is the num vector?
class(num)

#let's make a character vector
char <- c("apple", "pear", "grape")

#let's make a logical vector
logi <- c(TRUE, FALSE, T, F)
logi

#MISSING Data

weights <- c(25, 34, 12, NA, 42)

#what is the minimum weight in our vector?
min(weights)

#let's ignore missing data now
min(weights, na.rm = TRUE)

#VECTORS as arguments

#let's compute the 25% quantile of the weights in complete_old
quantile(complete_old$weight, probs = 0.25, na.rm = TRUE)

#feed quantile a vector of probs to get more than one quantile
quantile(complete_old$weight, probs = c(0.25, 0.5, 0.75), na.rm = TRUE)

#Other ways to create vectors

#use a colon to get a sequence of numbers
1:10

#create sequences of numbers in a vector
seq(from = 0, to  = 1, by = 0.1)

#set the number of elements in teh vector that I want from seq()
seq(from = 0, to = 1, length.out = 20)

#let's create vectors of repeating values
rep("a", times = 12)

#let's repeat a small vector a number of times
rep(c("a", "b", "c"), times = 4)

#FACTORS

sex <- factor(c("male", "female", "female", "male", NA))

#what are the levels of the sex vector?

levels(sex)

#forcats package lets you work well with factors

#want to re-order the levels in the sex vector
fct_relevel(sex, c("male", "female"))

#change the names of the levels
fct_recode(sex, "M" = "male", "F" = "female")

#make NA values a level of a factor
fct_explicit_na(sex)

#make sex a character vector
as.character(sex)

#how to convert years from factor to numeric
f_num <- factor(c(1990, 1983, 1998, 1990))

#try to get our years to numeric
as.numeric(f_num)
#this didn't work as expected! 

#get our years back in numeric
as.numeric(as.character(f_num))

#Assignment of objects
x <- 5
y <- x 
x <- 10

#you can sequentially create objects related to each other
x <- 5
y <- x/2
sqrt(y)

#re-assign objects
x <- x^2

#weight_kg
#weightKg