## Based on <https://github.com/hadley/r4ds/blob/main/_common.R>.

# library(here, quietly = TRUE)
# library(knitr, quietly = TRUE)
# library(ggplot2, quietly = TRUE)
# lybrary(yaml, quietly = TRUE)

# Load libraries

library(downlit, quietly = FALSE, verbose = FALSE)
library(magrittr, quietly = FALSE, verbose = FALSE)
library(ggplot2, quietly = FALSE, verbose = FALSE)
library(targets, quietly = FALSE, verbose = FALSE)
library(xml2, quietly = FALSE, verbose = FALSE)

# Set variables -----

set.seed(2024)
env_vars <- yaml::read_yaml(here::here("_variables.yml"))

# Set knitr -----

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  root.dir = here::here()
)

# Set general options -----

options(
  dplyr.print_min = 6,
  dplyr.print_max = 6,
  pillar.max_footer_lines = 2,
  pillar.min_chars = 15,
  stringr.view_n = 6,
  pillar.bold = TRUE,
  width = 77 # 80 - 3 for #> comment
)

# Set `ggplot2` -----

ggplot2::theme_set(
  ggplot2::theme_gray()
)
