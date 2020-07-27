make_hist <- function(x) {
  x %>%
    ggplot(
      aes(
        date, 
        daily_cases, 
        text = 
          paste(
            paste0('Local Authority: ', area),
            '\n',
            paste0('Number of cases on ', 
              format(date, format = "%d/%m/%Y"), ': ', daily_cases),
            '\n',
            paste0('Seven-day rolling mean (this LA): ', 
              daily_cases_rolling_mean_7_days_per_la)
            ,
            '\n',
            paste0('Seven-day rolling mean (all LAs): ', 
              daily_cases_rolling_mean_7_days_all_las)
          ),
        alpha = 0.5,
        group = area
      )
    ) +
    geom_bar(stat = "identity", position = "identity", fill = "#00ad93") +
    geom_line(aes(date, daily_cases_rolling_mean_7_days_per_la)) +
    geom_line(aes(date, daily_cases_rolling_mean_7_days_all_las), linetype = "dotted") +
    theme_bw() +
    theme(
      legend.position = 'none',
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank()
    ) + 
    xlab('') + 
    ylab('Daily cases')
}