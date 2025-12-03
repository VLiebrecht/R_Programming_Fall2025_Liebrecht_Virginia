#' Detect outliers using the IQR rule
#' @param x A numeric vector
#' @return A logical vector indicating which values are outliers
#' @export
detect_outlier <- function(x) {
  q1 <- stats::quantile(x, 0.25, na.rm = TRUE)
  q3 <- stats::quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  (x < (q1 - 1.5 * iqr)) | (x > (q3 + 1.5 * iqr))
}
