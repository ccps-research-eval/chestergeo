
#' Autoplot methods for chester_geo objects
#'
#'
#' @param object An object of class chester_geo
#' @param title Optional. Title of the plot
#' @param ... Additional arguments passed to aes. Useful for fill, color, and size mostly
#'
#' @importFrom ggplot2 ggplot geom_sf aes theme_void labs
#' @importFrom rlang !!!
#'
#' @return
#' @export
#'
#' @examples \dontrun{
#' #get middle school boundaries
#' ms_bounds <- get_school_boundaries("middle")
#'
#' #plot the boundaries and fill polygons by school name
#' autoplot(ms_bounds, fill = SchoolName)
#' }

autoplot.chester_geo <- function(object, title = NULL, ...) {

  dots <- rlang::enquos(...)

  ggplot(object) +
    geom_sf(aes(,, !!!dots)) +
    theme_void() +
    labs(
      title = title
    )

}
