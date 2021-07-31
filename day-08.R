#Fernando Meza
#07-06-2021
#Week 3 assignment plotting the daily new cases overlaid with a 7-day rolling mean for a state
install.packages("zoo")
library(zoo)
library(dplyr)
rollmean
covid <- readr::read_csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")
state.of.interest = "Wisconsin"
covid %>%
  filter(state == state.of.interest) %>%
  group_by(date = max(date)) %>%
  summarise(cases = sum(cases)) %>%
  mutate(newCases = cases - lag(cases),
         roll7 = rollmean(newCases, 7, fill = NA, allign = "right")) %>%
  ggplot(aes(x = date)) +
  geom_line(aes(y = newCases), col = NA, fill = "darkred") +
  geom_line(aes(y = roll7), col = "lightblue", size = 1) +
  ggthemes::theme_wsj() +
  labs(title = paste("Week Forecast of Wisconsin Cases", state.of.interest)) +
