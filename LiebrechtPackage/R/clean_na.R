#' Cleaning numeric NAs by replacing them with column medians
#' @param df a data frame containing numeric and/or non-numeric colums.
#' @return a data frame with numer NA replaced by median values
#' @export
#' @importFrom dplyr %>%
clean_na <- function(df) {
  df %>%
    dplyr:: mutate(dplyr::across(
      dplyr::where(is.numeric),
      ~ifelse(is.na(.x), stats::median(.x, na.rm = TRUE), .x)
    ))
}
