#Data Visualization with ggplot2


#load packages that we need
library(tidyverse)
library(ratdat)

#we are going to be using complete_old dataset from ratdat package

#find out more about complete_old with ?
?complete_old

#let's look at complete_old with View()
View(complete_old)

#Explore the structure of complete_old with str()
str(complete_old)


#let's make a ggplot
ggplot(data = complete_old)

#let's add x and y data to our ggplot
ggplot(data = complete_old,
       mapping = aes(x = weight, y = hindfoot_length))

#let's get data on our graph as a scatterplot
ggplot(data = complete_old,
       mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()

#let's make the points somewhat transparent so we can see more of them
ggplot(data = complete_old,
       mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.2)

#changing the colors of points
ggplot(data = complete_old,
       mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.2, color = "blue")

#making color of points dependent on plot_type
ggplot(data = complete_old,
       mapping = aes(x = weight, y = hindfoot_length, color = plot_type)) +
  geom_point()

#change to better color ramp
ggplot(data = complete_old,
       mapping = aes(x = weight, y = hindfoot_length, color = plot_type)) +
  geom_point(alpha = 0.2) +
  scale_color_viridis_d()

#let's try making boxplots!

#let's look at hindfoot_length by plot_type
ggplot(data = complete_old,
       mapping = aes(x = plot_type, y = hindfoot_length)) +
  geom_boxplot()

#let's color our boxplot by plot_type
ggplot(data = complete_old,
       mapping = aes(x = plot_type, y = hindfoot_length, color = plot_type)) +
  geom_boxplot()

#let's fill our boxplot by plot_type
ggplot(data = complete_old,
       mapping = aes(x = plot_type, y = hindfoot_length, fill = plot_type)) +
  geom_boxplot()

#adding geoms together
ggplot(data = complete_old,
       mapping = aes(x = plot_type, y = hindfoot_length)) +
  geom_boxplot() +
  geom_point(alpha = 0.2)

#let's jitter the points to make them easier to see
ggplot(data = complete_old,
       mapping = aes(x = plot_type, y = hindfoot_length)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.2)

#let's assing this plot to an "object"
myplot <- ggplot(data = complete_old,
                mapping = aes(x = plot_type, y = hindfoot_length)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.2)

myplot

#adding themes to make our plot prettier
myplot +
  theme_bw()

#making human friendly labels with "labs"
myplot +
  theme_bw() +
  labs(x = "Plot Type",
       y = "Hindfoot lenght (mm)")

#save the plot
finalplot <- myplot +
  theme_bw() +
  labs(x = "Plot Type",
       y = "Hindfoot lenght (mm)")

ggsave(filename = "images/rodent_size_plots.jpg",
       plot = finalplot,
       height = 6,
       width = 8)


