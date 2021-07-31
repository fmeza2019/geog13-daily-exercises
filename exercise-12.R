#Fernando Meza
#Exercise 12
library(dplyr)
library(zoo)
library(tidyverse)
library(sf)
states = USAboundaries::us_states()

states %>%
states = filter(us_states(), stusps %in% c("WA", "OR", "MT", "ID")) %>%
select(name) %>%
filter(name == "Wisconsin") %>%
mutate(states, deim9 = st_relate(state, wi), st_touche(states, wi, sparse = F)) %>%
