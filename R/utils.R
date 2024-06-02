peek_count_lines <- function(file = file.choose) {
  checkmate::assert_file(file, access = "r")

  fpeek::peek_count_lines(file)
}

tidy_names <- function(names, tag_duplicates = FALSE) {
  checkmate::assert_character(names, min.len = 1)

  out <-
    names |>
    tolower() |>
    stringr::str_replace_all("_", " ") |>
    stringr::str_replace_all("[[:punct:]]", "") |>
    iconv(from = 'UTF-8', to = 'ASCII//TRANSLIT') |>
    stringr::str_replace_all(" - |-| ",  "_")

  if (isTRUE(tag_duplicates) && any(duplicated(out), na.rm = TRUE)) {
    n_dup <- length(out[duplicated(out)])
    out[duplicated(out)] <- paste0(
      out[duplicated(names)], "_dup_", seq(from = 1, to = n_dup)
    )
  }

  out
}

rename_state_to_uf <- function(x) {
  checkmate::assert_character(x, min.len = 1)

  dplyr::case_when(
    tidy_names(x) == "acre" ~ "AC",
    tidy_names(x) == "alagoas" ~ "AL",
    tidy_names(x) == "amapa" ~ "AP",
    tidy_names(x) == "amazonas" ~ "AM",
    tidy_names(x) == "bahia" ~ "BA",
    tidy_names(x) == "ceara" ~ "CE",
    tidy_names(x) == "distrito_federal" ~ "DF",
    tidy_names(x) == "espirito_santo" ~ "ES",
    tidy_names(x) == "goias" ~ "GO",
    tidy_names(x) == "maranhao" ~ "MA",
    tidy_names(x) == "mato_grosso" ~ "MT",
    tidy_names(x) == "mato_grosso_do_sul" ~ "MS",
    tidy_names(x) == "minas_gerais" ~ "MG",
    tidy_names(x) == "parana" ~ "PR",
    tidy_names(x) == "paraiba" ~ "PB",
    tidy_names(x) == "para" ~ "PA",
    tidy_names(x) == "pernambuco" ~ "PE",
    tidy_names(x) == "piaui" ~ "PI",
    tidy_names(x) == "rio_de_janeiro" ~ "RJ",
    tidy_names(x) == "rio_grande_do_norte" ~ "RN",
    tidy_names(x) == "rio_grande_do_sul" ~ "RS",
    tidy_names(x) == "rondonia" ~ "RO",
    tidy_names(x) == "roraima" ~ "RR",
    tidy_names(x) == "santa_catarina" ~ "SC",
    tidy_names(x) == "sergipe" ~ "SE",
    tidy_names(x) == "sao_paulo" ~ "SP",
    tidy_names(x) == "tocantins" ~ "TO"
  )
}
