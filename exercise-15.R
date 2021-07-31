knitr::opts_chunk$set(echo = TRUE)

library(tidyverse)
library(sf)
library(USAboundaries)
library(knitr)
library(gghighlight)
library(ggplot2)
library(leaflet)
library(readxl)

```
#Question 1

```{r}
counties <- USAboundaries::us_counties() %>%
  filter(!state_name %in% c("Hawaii", "Puerto Rico", "Alaska",
                            "Guam")) %>%
  st_transform(5070) %>% st_as_sf()

centroids <- counties %>% st_centroid()
nrow(centroids)

cent_union <- centroids %>% st_union()
cent_union

````
```{r warning = FALSE}

boundary <- counties %>% st_union() %>% st_cast()

voronois <- st_voronoi(cent_union) %>% st_as_sf() %>% mutate(id = 1:n()) %>% st_cast() %>% st_intersection(boundary)

plot(voronois)
