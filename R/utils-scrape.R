
extract_resources <- function(url = "https://services3.arcgis.com/TsynfzBSE6sXfoLq/ArcGIS/rest/services",
                              services = TRUE) {
  res <- rvest::read_html(url) %>%
    rvest::html_elements("li") %>%
    rvest::html_elements("a")

  #ret <- purrr::map_chr(res, ~stringr::str_replace_all(as.character(.x), "^.*>(\\D+)<.*", "\\1"))

  # ret <- if (services == TRUE) {
  #   stringr::str_subset(ret, "href", negate = TRUE)
  # } else

  ret <- purrr::map_chr(res, ~extract_link_name(.x))

    return(ret)
}

#extract link name
extract_link_name <- function(x) {
  x <- as.character(x)

  m <- stringr::str_match_all(x, "<a href=\"(.*)\">")

  m <- m[[1]][,1]

  remove_vec <- paste0(m, "|</a>")

  stringr::str_remove_all(x, remove_vec)
}

service_url <- function(service) {
  baseurl <- "https://services3.arcgis.com/TsynfzBSE6sXfoLq/ArcGIS/rest/services"

  paste0(baseurl, "/", service, "/FeatureServer")
}

make_layers_crosswalk <- function(service) {
  url <- service_url(service)

  res <- extract_resources(url = url, services = FALSE)

  tibble(
    service = service,
    layer_num = 0:(length(res) - 1),
    layer = res
  )
}
