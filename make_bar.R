make_bar <- function(x, chart_title) {
  
  x %>%
    ggplot(
      aes(
        reorder(area, key_var), 
        key_var, 
        text = 
          paste(
            paste0('Local Authority: ', area),
            '\n',
            paste0('Number of cases: ', key_var)
          )
      )
    ) +
    geom_bar(stat = "identity", width = 0.8, fill = '#00ad93', alpha = 0.5) +
    coord_flip() +
    labs(x = "", y = "Number of positive cases", title = chart_title) +
    theme_bw() +
    theme(
      legend.position = 'none',
      axis.title = element_text(size = 14, colour = "black"),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank()
    )
}