# Fernando Meza
# Day 06 Daily Exercise
# 06-30-2021
# Making a visual representation of data using R studio and ggplot elements
# Libraries
library(dplyr)
library (ggplot2)

#QUESTION 1

# Data we're using
url = "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"
covid = readr::read_csv(url)
head(covid)

# Step 1
cc = covid %>%
  filter(date == max(date)) %>%
  group_by(state) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_max(cases, n = 6) %>%

# Step 2
cc2 =
  covid %>%
  filter(state %in% cc) %>%
  group_by(state, date) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup()

# Step 3
g = ggplot(data = cc2, aes(x = date, y = cases)) +
  geom_line(aes(color = state)) +
  facet_wrap(~state) +
  theme(legend.position = "right") +
  labs(title = "COVID By States",
       subtitle = "Top 6 States", x = "Date", y = "Cases") +
ggsave(g, filename = "img/test-img-thurs.png")

#QUESTION 2

covid %>%
  group_by(data)
  summarize(cases = sum(cases)) %>%
  ggplot(aes(x = date, y = cases)) +
  geom_col(fill = "darkred", color = "darkred", alpha = .25) +
