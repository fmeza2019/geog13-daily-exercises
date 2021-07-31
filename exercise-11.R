#Fernando Meza
#07-12-2021
#Daily Exercise with projections
library(ggplot2)
library(dplyr)
library(sf)
library(units)

data = readr::read_csv("C:/Users/fmeza/github/geog13-daily-exercises/exercise-04/data/uscities.csv")
pts = st_as_sf(data, coords = c("lng", "lat"), crs = 4326) %>%
filter(city %in% c("Santa Barbara","Los Angeles")) %>%
data = st_transform(conus = 5070) %>%
st_distance(pts, which = "Euclidean") %>%
set_distance("km") %>%
drop_units()

