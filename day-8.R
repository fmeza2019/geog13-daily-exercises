#Fernando Meza
#Thursday 07-08-2021
#Feature Geometries
library(dplyr) %>%
library(tidyverse) %>%
USAboundaries::us_states() %>%
view(conus) %>%
filter(!state_name %in% c("Puerto Rico", "Alaska", "Hawaii")) %>%
length(st_geometry(conus)) %>%
us_c_ml = st_combine(conus) %>%

