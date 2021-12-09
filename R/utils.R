
#check to see if a layer is valid
check_valid_layer <- function(layer) {

  if (!layer %in% available_layers) {
    rlang::abort(paste0("`layer` must be a valid layer, not ", layer, ". See the `available_layers` data for valid layers."))
  }
}
