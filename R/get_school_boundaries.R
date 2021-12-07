
#' Get School Boundaries
#'
#' @description This function allows you to retrieve the school boundaries for a given level. Note that it is a wrapper around the \code{\link{get_geo_data}} function
#'
#' @param level Either 'elem', 'middle', or 'high'
#'
#' @return
#' @export
#'
#' @examples \dontrun{
#' a <- get_school_boundaries("elem")
#' }
get_school_boundaries <- function(level = c("elem", "middle", "high")) {

  if (!level %in% c("elem", "middle", "high")) {
    rlang::abort(paste0("`level` must be either 'elem', 'middle', or 'high', not ", level))
  }

  layer <- switch(level,
                  elem = "ElementarySchoolBoundary",
                  middle = "MiddleSchoolBoundary",
                  high = "HighSchoolBoundary")

  get_geo_data(layer)

}
