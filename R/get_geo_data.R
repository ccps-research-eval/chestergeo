
#' Get Geography Data
#'
#' @description This function retrieves data for the requested layer from the Chesterfield County Open Geospace API
#'
#' @param layer character. The name of the layer to retrieve data from. See \code{\link{layers_crosswalk}} for possible layers
#'
#' @returns An `sf` object with information about the given layer, including a geometry column
#' @export
#'
#' @examples \dontrun{
#' ms_bounds <- get_geo_data(layer = "MiddleSchoolBoundary")
#' }
get_geo_data <- function(layer) {

  check_valid_layer(layer)

  cw <- chestergeo::layers_crosswalk

  num <- cw$layer_num[cw$layer == layer]

  service <- cw$service[cw$layer == layer]

  url <- paste0("https://services3.arcgis.com/TsynfzBSE6sXfoLq/ArcGIS/rest/services/", service, "/FeatureServer/", num, "/query?outFields=*&where=1%3D1&f=geojson")

  sf::st_read(url)

}
