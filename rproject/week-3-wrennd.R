#import libraries

library(tidyverse) 
library(haven)
library(ggplot2)


baseball <- read_csv("baseball.csv") #importing csv file
read.csv("baseball.csv")


# color coded point/scatter plot
ggplot(data = baseball) +
  geom_point(mapping = aes(x = Payroll.millions, y = Wins, color = Team))

# histogram for non-categorical data)
ggplot(data = baseball) +
  geom_histogram(mapping = aes(x = Wins), binwidth = 2)

# density (does not work due to limited sample size)
ggplot(data = baseball) +
  geom_density(mapping = aes(x = Payroll.millions, 
              color = "Payroll(millions)"), fill = "lightblue") +
  geom_density(mapping = aes(x = Wins, color = "Wins"),
              fill = "green", alpha = 0.3) +
  labs(x = "Payroll(millions)",
       y = "frequency")

# bar charts + customization
ggplot(data = baseball, mapping = aes(x = Payroll.millions, color = Team)) +
  geom_bar() +
  labs(x = "Payroll(millions)",
       y = "Frequeny",
       title = "Payroll(millions) by Franchise") +
  theme_minimal() + 
  theme(legend.position = "bottom")

ggplot(data = baseball) +
  geom_bar(mapping = aes(x = Wins, fill = Team)) +
  labs(title = "Wins per Team") +
  theme_minimal() +
  theme(legend.title.align = 0.5)

# combining graphs for better data visualization

ggplot(data = baseball, mapping = aes(x = Payroll.millions, y = Wins)) +
  geom_point(mapping = aes(color = Team)) +
  geom_smooth() + # no filtering is needed as the data cannot be grouped
  labs(x = "Payroll (millions)",
       title = "Wins in relation to Payroll(millions)")

# statistical review 
# null : The team payroll amount has an effect on games won
# alternative : The team payroll has no affect on games won

baseball %>%
  summarise(avg_Payroll = mean(Payroll.millions, na.rm = TRUE))

#retrieving values stored under 'Payroll.millions'

payr <- baseball$Payroll.millions 

sd(payr) # calculating standard deviation of Payroll(millions)

payr = baseball$Payroll.millions # designating variables
wins = baseball$Wins

cor(payr, wins) #finding correlation coefficient between payroll and wins


# Central Limit Theorem

set.seed(2)

sample_size <- 10 # choosing a sample size

get_mean <- function(df, sample_size) {
  df <- sample_n(df, sample_size) %>%
    summarise(avg_Payroll = mean(Payroll.millions, na.rm = TRUE))
  df$avg_Payroll
}


sample_of_avg <- as_tibble(replicate(100, get_mean(baseball, sample_size)))

ggplot(sample_of_avg, aes(x = value)) +
  geom_histogram(binwidth = 1)

mean(sample_of_avg$value)
