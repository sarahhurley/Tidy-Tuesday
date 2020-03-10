library(tidyverse)

rm(list = ls())

tuition_cost <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-10/tuition_cost.csv')

tuition_income <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-10/tuition_income.csv') 

salary_potential <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-10/salary_potential.csv')

historical_tuition <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-10/historical_tuition.csv')

diversity_school <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-10/diversity_school.csv')



q <- salary_potential %>% 
  left_join(tuition_cost, by = "name") %>% 
  drop_na(out_of_state_tuition)

q %>% 
  ggplot(aes(in_state_tuition, early_career_pay, color = stem_percent)) +
  geom_point() +
  geom_smooth(method = "lm", color = "darkgrey") +
  scale_color_gradient(low = "gold", high = "red", name = "% students \n in STEM") +
  theme_minimal() +
  labs(title = "Does a more expensive school mean a higher salary?", x = "In-state tuition (USD)", y = "Early career salary (USD)")

ggsave("P:/Other/college.png")
