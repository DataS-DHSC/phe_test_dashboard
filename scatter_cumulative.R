scatter_cumulative <- function(x, today_date) {
  x %>%
    ggplot(
      aes(
        x = cases_recent_week_cumulative, 
        y = change_cumulative,
        text = 
          paste(
            paste0('Local Authority: ', area),
            '\n',
            paste0('Number of new cases within time period: ', change_cumulative)
          )
      )
    ) +
    geom_point(colour = "#00ad93", fill = "#00ad93", 
      size = abs(x$change_cumulative) / 50, alpha = 0.5) +
    labs(
      title = 
        paste0(
          "Increase in cumulative cases between ", 
          format(today_date - 9, "%a %b %d"), 
          " and ", 
          format(today_date - 16, "%a %b %d")
        ),
      subtitle = "",
      caption = "",
      x = 
        paste0(
          "Cumulative cases up to ", 
          format(today_date - 9, "%a %b %d")
        ),
      y =  "Change in cases"
    ) +
    theme_bw() + 
    theme(
      panel.grid.major = element_blank(), 
      panel.grid.minor = element_blank()
    )
}