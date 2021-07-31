#Fernando Meza
#Creating a Leaflet Map
#07-20-2021

library(leaflet)
library(tidyverse)
library(dplyr)

```{r}

states <- USAboundaries::us_states() %>%
  filter(stusps %in% "CA")

homeleaflet <- leaflet(states) %>%
  addTiles() %>%
  addMarkers(lng = -118.261340, lat = 34.007470, popup = "home")
homeleaflet

```
