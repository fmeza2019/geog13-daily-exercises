#Fernando Meza
#OpenStreetMap and Data Extraction
#07/26/2021

#installing osmdata and lib packages
install.packages("osmdata")
library(leaflet)
library(osmdata)
library(sf)
library(raster)

#Value Extraction (For the Goleta area, extract all OSM point data for restaurants)
AOI = Goleta

bb = st_bbox(s) %>%
  st_as_sfc() %>%
  st_transform(4326)

osm = osmdata::opq(bb) %>%
  add_osm_feature(key = 'amenity', value = "restaurant") %>%
  osmdata_sf()

print(osm)

restaurant = restaurant %>%
  st_transform(crs(s)) %>%
  st_intersection(st_as_sfc(st_bbox(r))) %>%
