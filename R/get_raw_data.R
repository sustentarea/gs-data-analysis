# library(checkmate, quietly = TRUE)
# library(cli, quietly = TRUE)
# library(curl, quietly = TRUE)
# library(dplyr, quietly = TRUE)
# library(here, quietly = TRUE)
# library(rutils, quietly = TRUE)

#' Download and read the SISVAN raw data
#'
#' @description
#'
#' `get_raw_data()` download, saves locally and reads SINAVAN raw data.
#'
#' @return An invisible [arrow dataset][arrow::open_dataset()].
#'
#' @family data wrangling functions
#'
#' @noRd
#'
#' @examples
#' \dontrun{
#' if (requireNamespace("utils", quietly = TRUE)) {
#'   raw <- get_raw_data()
#'
#'   raw
#' }
#' }
get_raw_data <- function() {
}
