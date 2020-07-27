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
          ),
        alpha = 0.5
      )
    ) +
    geom_bar(stat = "identity", width = 0.8, fill = '#00ad93') +
    coord_flip() +
    labs(y = "", x = "Local authority", title = chart_title) +
    theme_bw() +
    theme(
      legend.position = 'none',
      axis.title = element_text(size = 14, colour = "black"),
      axis.text.y = element_blank(),
      axis.ticks.y = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank()
    )
}