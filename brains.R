library(tidyverse)
library(gridExtra)

rm(list = ls())


tbi_age <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-24/tbi_age.csv')
tbi_year <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-24/tbi_year.csv')
tbi_military <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-24/tbi_military.csv')


plot1 <- tbi_year %>% 
  filter(injury_mechanism != "Total") %>% 
  group_by(type) %>% 
  ggplot(aes(x = year, y = rate_est, color = type)) +
  geom_point() + geom_line() + facet_grid(vars(injury_mechanism), scales = "free_y") +
  theme(legend.position="none") +
  labs(x = "year", y = "rate per 100,000 individuals", title = "Number of outcomes over time")

plot2 <- tbi_age %>% 
  filter(age_group != "Total") %>% 
  ggplot() +
  geom_bar(aes(x = age_group, y = rate_est), stat = "identity") +
  facet_grid(rows = vars(injury_mechanism), scales = "free_y") +
  labs(x = "age group", y = "", title = "Distribution of age groups")
  


grid.arrange(plot1, plot2, nrow = 1)






