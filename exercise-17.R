#Fernando Meza
#My First Raster
#07-21-2021

#Installing new file
remotes::install_github("jhollist/elevatr")
#also installed elevatr

#libraries needed
library(readr)
library(tidyverse)
library(sf)
library(elevatr)
#Work
cities <- read_csv("C:/Users/fmeza/github/geog13-daily-exercises/exercise-04/data/uscities.csv")

cities %>%
  filter(city == "Goleta") %>%
  st_transform(crs(5070),st_buffer(5000)) %>%
  st_sf() %>%
  st_bbox(st_sfc(st_sf())) %>%
  elevatr::get_elev_raster %>%
  Z = zoom %>%
raster::crop %>%
plot(cities, main = "Goleta Raster")
