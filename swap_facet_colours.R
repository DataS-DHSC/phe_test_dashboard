swap_facet_colours <- function(x) {
  x_midway <- round(length(x) / 2)
  if ((x_midway * 2) == length(x)) {
    rep(c('colour_a', 'colour_b'), x_midway)
  } else {
    c(rep(c('colour_a', 'colour_b'), x_midway), 'colour_a')
  }
}