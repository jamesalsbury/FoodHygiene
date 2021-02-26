
#' @export
#' @importFrom httr content GET add_headers
#' @title A title
#' @description A description
#'
#'
get_authorities <- function(){

  path <- "http://api.ratings.food.gov.uk/Authorities"
  request <- GET(url = path,
                 query = list(
                   localAuthorityId =1,
                   pageNumber = 1,
                   pageSize = 10000),
                 add_headers("x-api-version" = "2"))

  # # parse the response and convert to a data frame
  response <- content(request, as = "text", encoding = "UTF-8") %>%
    fromJSON(flatten = TRUE) %>%
    pluck("authorities") %>%
    as_tibble()

  # # tidy the data
  df <- response %>%
    select(name = Name,
           region = RegionName,
           count = EstablishmentCount)

  AuthorityData <- df
}

new




