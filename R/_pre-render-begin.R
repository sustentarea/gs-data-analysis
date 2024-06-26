# library(checkmate, quietly = TRUE)
# library(here, quietly = TRUE)
# library(lubridate, quietly = TRUE)
# library(rutils, quietly = TRUE)
# lybrary(stringr, quietly = TRUE)
# lybrary(yaml, quietly = TRUE)

# Load common render -----

source(here::here("R", "_render-common.R"))

# Create environment variables -----

env_vars <- list()

var_files <- c(
  "quarto_yml_vars", "quarto_yml_html_vars", "quarto_yml_pdf_vars",
  "quarto_yml_revealjs_vars"
)

var_patterns <- c(
  "author", "^book.url$", "date", "keyword", "language", "institute",
  "^book.title$"
)

# Move to {qutils}
for (i in var_files){
  values <- unlist(get(i))

  for (j in var_patterns) {
    test <- grepl(j, names(values))

    if (any(test, na.rm = TRUE)) {
      if (grepl("^\\^", j) || grepl("\\$$", j)) {
        j <- sub("^\\^", "", j)
        j <- sub("\\$$", "", j)
      }

      if (grepl("\\.", j)) j <- sub("^.+\\.", "", j)

      if (j == "date") {
        if (!grepl("\\d{4}", values[test][1]) &&
            !any(values[test][1] == "today", na.rm = TRUE)) {
          next()
        } else if (any(values[test][1] == "today", na.rm = TRUE)) {
          env_vars[[j]] <- as.character(Sys.Date())
          env_vars[["year"]] <- as.character(lubridate::year(Sys.Date()))
          next()
        } else {
          env_vars[["year"]] <-
            as.character(stringr::str_extract(values[test][1], "\\d{4}"))
        }
      }

      if (j == "language" &&
          !grepl("^[a-z]{2}$|^[a-z]{2}\\-[a-zA-Z]{2}$", values[test][1])) {
        next()
      }

      if (j == "author") {
        if (!grepl(" ", values[test][1])) {
          env_vars[["author-surname"]] <- values[test][1]
          env_vars[["author-given-name"]] <- values[test][1]
        } else{
          env_vars[["author-surname"]] <-
            stringr::str_extract(values[test][1], "(?i)(?<= )[a-zÀ-ÿ]+$")

          env_vars[["author-given-name"]] <-
            stringr::str_extract(values[test][1], "^(?i)[a-zÀ-ÿ]+(?= )")

          env_vars[["author-minus-surname"]] <-
            stringr::str_extract(values[test][1], "^.+(?= )")
        }

        env_vars[["author-initials"]] <-
          rutils:::extract_initials(values[test][1])
      }

      env_vars[[j]] <- values[test][1] |> unname()
    }
  }
}

env_vars |> yaml::write_yaml(env_vars_file_path)

# Scan Quarto files for citations and add them to references.bib -----

# (2024-06-05)
# This function only works with BetterBibTeX (BBT) for Zotero version v6.7.140
# or lower.

rutils:::bbt_write_quarto_bib(
    bib_file = "references.bib",
    dir = c("", "qmd"),
    pattern = "\\.qmd$",
    wd = here::here()
)
