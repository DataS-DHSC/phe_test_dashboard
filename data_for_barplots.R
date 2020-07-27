data_for_barplots <- function(x, key_var, batch_size = 20, FUN = mean,
  dates_filter = c(today_date - 9, today_date - 3)) {
  
  require(dplyr)
  source('split_las_in_batches.R')
  
  x %>%
    filter(
      date >= dates_filter[1],
      date <= dates_filter[2]
    ) %>%
    select(area, all_of(key_var)) %>%
    group_by(area) %>%
    summarize_all(FUN) %>%
    ungroup %>%
    rename(key_var = all_of(key_var)) %>%
    arrange(desc(key_var)) %>%
    mutate(
      key_var = round(key_var),
      area = factor(area, levels = area),
      batch_tag = split_las_in_batches(nrow(.), batch_size),
      batch_tag = factor(batch_tag, levels = unique(batch_tag))
    )
}
