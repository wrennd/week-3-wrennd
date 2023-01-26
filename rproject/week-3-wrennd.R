library(tidyverse)
library(haven)
library(ggplot2)


baseball <- read_csv("baseball.csv")
read.csv("baseball.csv")


# color coded point/scatter plot
ggplot(data = baseball) +
  geom_point(mapping = aes(x = Payroll, y = Wins, color = Team))

# histogram for non-categorical data)
ggplot(data = baseball) +
  geom_histogram(mapping = aes(x = Wins), binwidth = 2)

# density (does not work due to limited sample size)
ggplot(data = baseball) +
  geom_density(mapping = aes(x = Payroll.millions), color = "blue", fill = "lightblue") +
  geom_density(mapping = aes(x = Wins, color = Wins)

# stylization of bar charts
ggplot(data = baseball) +
  geom_bar(mapping = aes(x = Payroll.millions, color = Team))

ggplot(data = baseball) +
  geom_bar(mapping = aes(x = Wins, fill = Team)) +
  labs(title = "Wins per Team") +
  theme_minimal() +
  theme(legend.title.align = 0.5)



