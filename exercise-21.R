library(tidyverse)
library(sf)
library(evevatr)
library(AOI)
library(raster)

mo = AOI::aoi_get("Mount Saint Helens") %>%
  AOI::aoi_buffer(.5)

elev = elevatr::get_elev_raster(mo, z = 12) %>%
  crop(mo)
writeRaster(elev, "data/mo-elev.tif", overwrite = TRUE)

wbt_slope("data/mo-elev.tif", "data/mo-slope.tif")
wbt_aspect("data/mo-elev.tif",  "data/mo-aspect.tif")

r = raster("data/mo-aspect.tif")
plot(r, box - FALSE, axes = FALSE)

wbt_hillshade("data/mo-elev.tif", "data/mo-hillshade.tif")
rl = raster("data/mo-hillshade.tif")
plot(r1, box = FALSE, axes = FALSE, col = gray.colors(256))
