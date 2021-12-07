
#' Layers Crosswalk
#'
#' Lookup table for services and layers in the Chesterfield OpenGeospace. Note that layers are nested within services, and this table is mostly useful to navigate making requests to the API
#'
#'
#' @format A tibble with 3 columns
#' \describe{
#'   \item{service}{name of the service}
#'   \item{layer_num}{number of the layer within the service}
#'   \item{layer}{name of the layer}
#' }
"layers_crosswalk"
