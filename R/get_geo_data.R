
#' Get Geography Data
#'
#' @description This function retrieves data for the requested layer from the Chesterfield County Open Geospace API
#'
#' @param layer character. The name of the layer to retrieve data from. See \code{\link{layers_crosswalk}} for possible layers
#'
#' @return
#' @export
#'
#' @examples \dontrun{
#' ms_bounds <- get_geo_data(layer = "MiddleSchoolBoundary")
#' }
get_geo_data <- function(layer) {

  check_valid_layer(layer)

  num <- layers_crosswalk$layer_num[layers_crosswalk$layer == layer]

  service <- layers_crosswalk$service[layers_crosswalk$layer == layer]

  url <- glue::glue("https://services3.arcgis.com/TsynfzBSE6sXfoLq/ArcGIS/rest/services/{service}/FeatureServer/{num}/query?outFields=*&where=1%3D1&f=json")

  ret <- sf::st_read(url)

  class(ret) <- append(class(ret), "chester_geo")

  return(ret)

}
