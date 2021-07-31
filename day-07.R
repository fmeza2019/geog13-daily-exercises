#Fernando Meza
#07-01-2021
#Implementing my knowledge on joint and pivots on a assignment.

url = "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"
covid = readr::read_csv(url)
head(covid)

covid %>%
  select(state.abb, state.name, state.region, deaths, cases) %>%
  states = readr::read_csv(url)
data.frame("state.abb"= 'State Code', "state.name"= 'State', "state.region"= 'Region')
  group_by(state.region) %>%
  summarize(cases = max(deaths)) %>%
  ungroup() %>%

full_join(x = covid, y = ) %>%
ggplot (aes(x = date, y = value/count)) +
geom_line(aes(color = state)) +
  facet_grid(type~cases, deaths = "cumalitive") +
theme_dark() +
  theme(legend_position = "none")

