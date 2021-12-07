
check_valid_layer <- function(layer) {

  if (!layer %in% layers_crosswalk$layer) {
    rlang::abort(paste0("`layer` must be a valid layer, not ", layer, ". See the `layers_crosswalk` data for valid layers."))
  }
}
