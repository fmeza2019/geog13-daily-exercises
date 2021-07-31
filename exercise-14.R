#Fernando Meza
#07/15/2021
#Exercise 14 computing and plotting the number of cities in each US county as a PIP plot
library(ggplot2)
library(dplyr)
library(tidyverse)
library(sf)
library(readr)

uscities <- read_csv("C:/Users/fmeza/github/geog13-daily-exercises/exercise-04/data/uscities.csv")
view(uscities)

uscities %>%
ggplot(data = uscities,mapping = aes(county_name, population))+
geom_point(size = 2, alpha = 0.5)+
ggsave()

polygons <- USAboundaries::us_states()
polygons %>%
select(name, geoid, geometry) %>%
