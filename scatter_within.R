scatter_within <- function(x, today_date) {
  x %>%
    ggplot(
      aes(
        x = cases_recent_week_within, 
        y = change_within,
        text = 
          paste(
            paste0('Local Authority: ', area),
            '\n',
            paste0('Change in cases within time period: ', change_within)
          )
      )
    ) +
    geom_point(colour = "#00ad93", fill = "#00ad93", 
      size = abs(x$change_cumulative) / 50, alpha = 0.5) +
    labs(
      title = 
        paste0(
          "Change in cases between week ", 
          format(today_date - 15, "%a %b %d"), 
          " - ",
          format(today_date - 9, "%a %b %d"), 
          " and week ", 
          format(today_date - 22, "%a %b %d"),
          " - ",
          format(today_date - 16, "%a %b %d")
        ),
      subtitle = "",
      caption = "",
      x = 
        paste0(
          "Cases in week ", 
          format(today_date - 15, "%a %b %d"),
          " - ",
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