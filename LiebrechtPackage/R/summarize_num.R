#' Summarize numeric variables
#' @param df A data frame.
#' @return A tibble containing summary statistics (min, q1, median, mean, q3, max, and sd) for numeric variables.
#' @examples
#' summarize_num(iris)
#' @export
summarize_num <-function(df) {
  df %>%
    dplyr::summarise(dplyr::across(
      dplyr::where(is.numeric),
      list(
        min = function(v) min (v, na.rm = TRUE),
        q1 = function(v) stats::quantile(v, 0.25, na.rm = TRUE),
        median = function(v) stats::median (v, na.rm = TRUE),
        mean = function(v) mean(v, na.rm = TRUE),
        q3 = function(v) stats::quantile(v, 0.75, na.rm = TRUE),
        max = function(v) max(v, na.rm = TRUE),
        sd = function(v) stats::sd(v, na.rm = TRUE)
      ),
      .names = "{.col}_{.fn}"
    ))
}
