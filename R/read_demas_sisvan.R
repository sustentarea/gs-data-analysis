read_demas_sisvan <- function(
    file = file.choose(), skip = 0, n_max = 1000, lazy = FALSE,
    show_progress = TRUE
  ) {
  checkmate::assert_file(file, access = "r", extension = "csv")
  checkmate::assert_integerish(skip, lower = 0)
  checkmate::assert_integerish(n_max, lower = 1)
  checkmate::assert_flag(lazy)
  checkmate::assert_flag(show_progress)

  out <-
    file |>
    readr::read_delim(
      delim = ";",
      quote = "\"",
      escape_backslash = FALSE,
      escape_double = TRUE,
      col_names = FALSE,
      col_types = readr::cols(.default = "c"),
      col_select = NULL,
      id = NULL,
      locale = readr::locale(
        date_names = "pt",
        date_format = "%d/%m/%Y",
        time_format = "%H:%M:%S",
        decimal_mark = ",",
        grouping_mark = ".",
        tz = "America/Sao_Paulo",
        encoding = readr::guess_encoding(file)$encoding[1],
        asciify = FALSE
      ),
      na = c("", "NA"),
      comment = "",
      trim_ws = FALSE,
      skip = ifelse(skip == 0, 1, skip + 1),
      n_max = n_max,
      guess_max = min(1000, n_max),
      name_repair = "unique",
      num_threads = readr::readr_threads(),
      progress = show_progress,
      show_col_types = FALSE,
      skip_empty_rows = TRUE,
      lazy = FALSE
  )

  names(out) <- extract_col_names(file, fns = read_demas_sisvan)

  out
}

extract_col_names <- function(file, fns) {
  checkmate::assert_file(file, access = "r")
  checkmate::assert_function(fns, args = "n_max")

  readr::read_delim(
    file,
    delim = ";",
    col_names = TRUE,
    col_types = readr::cols(.default = "c"),
    n_max = 1,
    progress = FALSE,
    show_col_types = FALSE
  ) |>
    names()
}

read_and_filter <- function(
    file = file.choose(), fns, filter_statement, skip = 0, batch_n = 10000,
    batch_max = 50, has_header = TRUE, ...
  ) {
  args <- c("file", "skip", "n_max", "lazy", "show_progress")

  checkmate::assert_file(file, access = "r")
  checkmate::assert_function(fns, args = args)
  checkmate::assert_string(filter_statement)
  checkmate::assert_integerish(skip, lower = 0)
  checkmate::assert_integerish(batch_n, lower = 1)
  checkmate::assert_number(batch_max, lower = 1)
  checkmate::assert_flag(has_header)

  out <- dplyr::tibble()
  nrows <- peek_count_lines(file) - ifelse(isTRUE(has_header), 1, 0)
  if (!batch_max == Inf) batch_max <- floor(batch_max)
  if (batch_max * batch_n >= nrows) batch_max <- Inf

  cli::cli_alert_info(paste0(
    "The file has ",
    "{.strong {cli::col_red(prettyNum(nrows, big.mark = ','))}} ",
    "rows."
  ))
  cli::cli_alert_info(paste0(
    "Skipping ",
    "{.strong {cli::col_red(prettyNum(skip, big.mark = ','))}} ",
    "rows."
  ))
  cli::cli_alert_info(paste0(
    "The file will be read and filtered in batches of ",
    "{.strong {cli::col_red(prettyNum(batch_n, big.mark = ','))}} ",
    "rows, resulting in ",
    "{.strong {prettyNum(floor((nrows - skip) / batch_n), big.mark = ',')}} ",
    "batches."
  ))
  cli::cli_alert_info(paste0(
    "Maximum number of batches set to {.strong {cli::col_red(batch_max)}}."
  ))

  cli::cli_progress_bar(
    name = "Reading and filtering",
    total = ifelse(
      batch_max == Inf,
      floor((nrows - skip) / batch_n),
      batch_max
    ),
    clear = FALSE
  )

  while (skip < nrows && !batch_max == 0) {
    out <-
      fns(
        file,
        skip = skip,
        n_max = batch_n,
        lazy = TRUE,
        show_progress = FALSE,
        ...
        ) |>
      dplyr::filter(eval(rlang::parse_expr((filter_statement)))) |>
      dplyr::bind_rows(out)

    skip <- skip + batch_n
    batch_max <- batch_max - 1

    cli::cli_progress_update()
  }

  out
}
