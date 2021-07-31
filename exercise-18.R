#Fernando Meza
#M
#07-22-2021

#Installing new file
remotes::install_github("jhollist/elevatr")
#also installed elevatr

#libraries needed
library(readr)
library(tidyverse)
library(sf)
library(elevatr)
library(ggplot2)
#Work
cities <- read_csv("C:/Users/fmeza/github/geog13-daily-exercises/exercise-04/data/uscities.csv")

cities %>%
  st_as_sf(coords = c("lng", "lat"), crs = 4326)
  filter(city == "Goleta") %>%
  st_transform(crs(5070) %>%
  st_buffer(5000)) %>%
  st_bbox() %>%
  st_as_sfc() %>%
  st_as_sf()

  elev = elevatr::get_elev_raster(bb, z = 11) %>% crop(bb)
  elevatr::get_elev_raster %>%
  Z = zoom %>%
  raster::crop %>%
  plot(cities, main = "Goleta Raster")

cities = calc(raster, values) %>%
  cellStats(raster, values) %>%
  mean(values(elev), na.rm = TRUE)
(rcl = raster(intervals[6:100], intervals[6:100], 1:6))
