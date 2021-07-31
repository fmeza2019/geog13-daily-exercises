remotes::install_github("mikejohnson51/climateR")
install_packages(climateR)
library(sf)
library(dplyr)
library(tidyverse)
library(raster)
library(climateR)

```{r}

parameters <- c("prcp", "wind")
AOI <- USAboundaries::us_states() %>%
  filter(name == Wisconsin)

WI <- climateR::getTerraClim(AOI, parameters, startdate = "2018-10-1") %>%
  stack() %>%
  setNames(parameters)
plot(WI)

elev <- elevatr::get_elev_raster(AOI, Z = 5) %>%
  crop(AOI)

elev <- projectRaster(elev, WI)
  values()

idx = which(!is.na(values))
v = na.omit(values)
vs = scale(v)

WI_kmeans = kmeans(vs, 5, iter.max = 100)
clus_raster = elev(1)
values(clus_raster) = NA
clus_raster(idx) <- WI_kmeans$cluster

plot(clus_raster, col = palette("Okabe-Ito"))

```

