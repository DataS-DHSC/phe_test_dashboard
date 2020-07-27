split_las_in_batches <- function(nrows_in_data, batch_size) {
  batch_ranges <- 1:batch_size
  batch_tags <- rep(
    paste0(min(batch_ranges), '-', max(batch_ranges)), batch_size
  )
  
  repeat {
    batch_ranges <- batch_ranges + batch_size
    batch_tags <- c(
      batch_tags, 
      rep(paste0(min(batch_ranges), '-', max(batch_ranges)), batch_size)
    )
    if (length(batch_tags) > nrows_in_data) {
      break
    }
  }
  
  batch_tags <- batch_tags[1:nrows_in_data]
  max_value_of_last_batch <- endsWith(batch_tags, as.character(max(batch_ranges)))
  batch_tags[max_value_of_last_batch] <- 
    sub(
      max(batch_ranges), 
      nrows_in_data, 
      batch_tags[max_value_of_last_batch]
  )
  return(batch_tags)
}