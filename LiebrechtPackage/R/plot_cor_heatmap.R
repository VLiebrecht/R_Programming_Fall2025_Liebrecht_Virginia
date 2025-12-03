#' Plot a correlation heatmap
#' @param df A data frame with numeric columns
#' @return a ggplot2 heatmap of the correlation matrix
#' @export
plot_cor_heatmap <- function(df) {
  cor_mat <- stats::cor(df, use = "pairwise.complete.obs")

  cor_df <- as.data.frame(as.table(cor_mat))
  names(cor_df) <- c("Var1", "Var2", "value")

  ggplot2::ggplot(cor_df, ggplot2:: aes(Var1, Var2, fill = value)) +
    ggplot2::geom_tile() +
    ggplot2::scale_fill_gradient2() +
    ggplot2::theme_minimal() +
    ggplot2::labs(title = "Correlation Heatmap", fill = "corr")
}
