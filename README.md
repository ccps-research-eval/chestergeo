chestergeo
================

`{chestergeo}` provides an interface for accessing data from
[Chesterfield County’s
OpenGeoSpace](https://opengeospace.chesterfield.gov/). This includes
publicly-available data describing county infrastructure, school and
voting boundaries, utility locations, and locations of police/fire/EMS
responses, among others.

# Installation

You can install `{chestergeo}` from Github via the following:

``` r
devtools::install_github("ccps-research-eval/chestergeo")
```

# Basic Usage

The core function provided by the package is `get_geo_data()`. This
function takes a “layer” argument, which defines the OpenGeoSpace layer
to retrieve data from. You can see all layers available in the
`available_layers` object (as well as within the `layers_crosswalk`
data).

For example, we might be interested in retrieving the middle school
boundary data:

``` r
library(chestergeo)

ms_bounds <- get_geo_data("MiddleSchoolBoundary")
```

    ## Reading layer `ESRIJSON' from data source 
    ##   `https://services3.arcgis.com/TsynfzBSE6sXfoLq/ArcGIS/rest/services/Administrative/FeatureServer/10/query?outFields=*&where=1%3D1&f=json' 
    ##   using driver `ESRIJSON'
    ## Simple feature collection with 12 features and 6 fields
    ## Geometry type: MULTIPOLYGON
    ## Dimension:     XY
    ## Bounding box:  xmin: -8669398 ymin: 4469362 xmax: -8599011 ymax: 4517806
    ## Projected CRS: WGS 84 / Pseudo-Mercator

This returns a `sf` object:

``` r
library(dplyr)

glimpse(ms_bounds)
```

    ## Rows: 12
    ## Columns: 7
    ## $ OBJECTID      <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
    ## $ SchoolName    <chr> "TOMAHAWK CREEK", "SWIFT CREEK", "BAILEY BRIDGE", "SALEM~
    ## $ GlobalID      <chr> "4d8990b4-8fa1-4aa6-927c-d0095192c0ca", "c7cb87c5-736d-4~
    ## $ SchoolNum     <int> 88, 27, 63, 72, 87, 11, 42, 76, 32, 69, 67, 25
    ## $ Shape__Area   <dbl> 292504601, 56354869, 292016506, 96218314, 186982820, 427~
    ## $ Shape__Length <dbl> 115768.99, 57269.36, 121169.37, 71727.80, 112616.58, 128~
    ## $ geometry      <MULTIPOLYGON [m]> MULTIPOLYGON (((-8643267 45..., MULTIPOLYGON (((-8640863~

We can then plot this object just as we would any other `sf` object.

``` r
library(ggplot2)

ggplot(ms_bounds) +
  geom_sf(aes(fill = SchoolName)) +
  labs(title = "CCPS Middle School Boundaries") +
  theme_void()
```

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

Likewise, if we wanted to see bus routes in the county:

``` r
bus_routes <- get_geo_data("GRTC_Bus_Routes")
```

    ## Reading layer `ESRIJSON' from data source 
    ##   `https://services3.arcgis.com/TsynfzBSE6sXfoLq/ArcGIS/rest/services/GRTC_Bus_Routes/FeatureServer/0/query?outFields=*&where=1%3D1&f=json' 
    ##   using driver `ESRIJSON'
    ## Simple feature collection with 45 features and 7 fields
    ## Geometry type: MULTILINESTRING
    ## Dimension:     XY
    ## Bounding box:  xmin: -8645904 ymin: 4470615 xmax: -8605291 ymax: 4557932
    ## Projected CRS: WGS 84 / Pseudo-Mercator

``` r
ggplot(bus_routes) +
  geom_sf(aes(color = objectid)) +
  theme_void()
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

## Wrapping Functions

I am currently implementing some functions that wrap the
`get_geo_data()` function so that users do not necessarily need to know
the names of the layers they’re accessing (which names aren’t always
super straightforward). Currently, the only wrapper function is
`get_school_boundaries()`, which allows users to request school boundary
lines.

The following code is equivalent:

``` r
ms_bounds <- get_geo_data("MiddleSchoolBoundary")

#same as
ms_bounds2 <- get_school_boundaries(level = "middle")
```
