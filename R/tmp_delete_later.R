
library(httr)

fetch_geospace_nms <- function(feature_num) {

  url <- paste0('https://services3.arcgis.com/TsynfzBSE6sXfoLq/ArcGIS/rest/services/Administrative/FeatureServer/', feature_num, '?f=pjson')

  tmp <- GET(url)

  cont <- content(tmp, as = "parsed", type = "application/json")

  cont$name

}

safe_fetch_geospace_nms <- purrr::safely(fetch_geospace_nms)

#trying to explore names
out <- purrr::map(1:100, safe_fetch_geospace_nms)

out2 <- purrr::transpose(out)
#alright -- this is the process for when I return to this

res <- unlist(out2$result)
#this is eventually what I want, but I need to see which numbers return NULL results first


#parcels
a <- 'https://services3.arcgis.com/TsynfzBSE6sXfoLq/ArcGIS/rest/services/Cadastral/FeatureServer/3/query?outFields=*&where=1%3D1'

#subdivisions
b <- 'https://services3.arcgis.com/TsynfzBSE6sXfoLq/ArcGIS/rest/services/Cadastral/FeatureServer/4/query?outFields=*&where=1%3D1'

#state senate
c <- 'https://services3.arcgis.com/TsynfzBSE6sXfoLq/ArcGIS/rest/services/Political/FeatureServer/2/query?outFields=*&where=1%3D1'


#see this link for different service directories
# https://services3.arcgis.com/TsynfzBSE6sXfoLq/ArcGIS/rest/services/
