#' Get Chesterfield Addresses 
#'
#' @description Fetches all of the addresses in Chesterfield County from the county address service. This is a light wrapper around \code{\link{get_geo_data}} 
#'
#'
#' @returns A 75-column dataframe and `sf` object containing various pieces of information about each address in the county, including the geographical coordinates, address, zoned schools, and more
#'
#' @export
#'
#' @examples
#' \dontrun{
#' #this will take a while to run
#' adrs <- get_chesterfield_addresses()
#' }
get_chesterfield_addresses <- function() {
    get_geo_data("County_Address_Service")
}