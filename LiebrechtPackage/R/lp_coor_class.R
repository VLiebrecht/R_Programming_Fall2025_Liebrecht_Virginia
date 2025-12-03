#' Creating a custom s3 class for correlation matrices
#'
#' @description
#' Computes a correlation matrix for the numeric columns in a dataframe and returns the object in the lp_cor (LiebrechtPackage correlation) class
#' @param df A data frame with numeric columns
#' @return An object of class 'lp_cor'
#' @examples
#' lp_cor(iris)
#' @export
lp_cor <-function(df){
  num_df <- dplyr::select(df, dplyr::where(is.numeric))
  if (ncol(num_df) < 2L){
    stop("Need at least two numeric columns to comppute correlations.")
  }
  cor_mat <- stats::cor(num_df, use = "pairwise.complete.obs")
  structure(list(mat = cor_mat), class = "lp_cor")
}

#' Print method for the lp_cor objects
#' @param x An object of class 'lp_cor'.
#' @param ... Not used.
#' @method print lp_cor
#' @export
print.lp_cor <- function(x, ...){
  cat("<lp_cor: correlation matrix>", nrow(x$mat), "x", ncol(x$mat), "\n")
  print(round(x$mat, 2))
  invisible(x)
}



#' Plot method for lp_cor objects
#' @param x An object of class 'lp_cor'.
#' @param ... Additional arguments passed to the plot.
#' @return a ggplot2 heatmap of the correaltion matrix.
#' @examples
#' plot(lp_cor(iris))
#' @method plot lp_cor
#' @export
plot.lp_cor <- function(x, ...) {
  cor_df <- as.data.frame(as.table(x$mat), stringAsFactors = FALSE)
  names(cor_df) <- c("Var1", "Var2", "value")

  ggplot2::ggplot(cor_df, ggplot2::aes(Var1, Var2, fill = value)) +
    ggplot2::geom_tile() +
    ggplot2::scale_fill_gradient2(limits = c(-1, 1)) +
    ggplot2::coord_equal() +
    ggplot2::theme_minimal() +
    ggplot2::labs(title = "Correlation Heatmap", fill = "corr") +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))
}
