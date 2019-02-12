#Dataset sourse
#https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results

library(tidyverse)
# loading code goes here
athlete_events <- read_csv('./Athlete_events.csv')
athlete_events %>% slice(1:10)

## Wrangling
#My pipeline computes average age of sportsmen who won gold medal for each sport at the team of USA and writes them in increasing order
mean_ages <- athlete_events %>%
  filter(Medal == 'Gold', Team == 'Netherlands')  %>%
  group_by(Sport) %>%
  summarise(mean_age = mean(Age,  na.rm = TRUE)) %>%
  arrange(mean_age)
mean_ages

## Plotting
#This plot shows the average age of sportsmen from the team of Netherlands who won gold medal for each sport
mean_ages %>%
  ggplot(aes(x = Sport, y = mean_age)) +
  geom_bar(stat = 'identity', fill = "#FF6666") +
  coord_flip() +
  labs(y = 'Average age', title = 'Average age of Gold medal winners from the team of Netherlands')