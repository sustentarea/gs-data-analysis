# # For development use only (comment the code after use (Ctrl + Shift + C)).
#
# .rs.restartR()
# .libPaths()
# cffr::cff_validate()
# knitr::clean_cache()
# knitr:::webshot_available()
# lintr::use_lintr()
# lintr::lint_dir("R")
# normalizePath(readClipboard(), "/", mustWork = FALSE)
# targets::tar_manifest()
# targets::tar_visnetwork(targets_only = TRUE)
# targets::tar_make()
# targets::tar_outdated()
# data <- targets::tar_read(geocoded_data)
# renv::init()
# utils::install.packages("renv", dependencies = TRUE)
# renv::equip()
# renv::activate()
# renv::deactivate()
# renv::status()
# renv::dependencies("R/_setup.R")
# renv::install()
# renv::update()
# renv::restore()
# renv::snapshot()
# renv::clean(actions = "unsed.packages")
# rutils:::bbt_scan_citation_keys()
# rutils:::bbt_write_quarto_bib()
# rutils:::set_quarto_speel_check()
# rutils:::gather_words_from_spell_check(pattern = "\\.qmd$|\\.Rmd$")
# rutils:::spell_check_quarto(dir = c("", "qmd"), pattern = "\\.qmd$|\\.Rmd$")
# rutils:::update_quarto_wordlist(
#   dir = c("", "qmd"), pattern = "\\.qmd$|\\.Rmd$"
# )
# rutils:::clean_quarto_mess()
# rutils:::quarto_status("drafting")
# spelling::spell_check_files("index.qmd")
# urlchecker::url_check()
# urlchecker::url_update()

# # Quarto (see <https://quarto.org/docs/projects/quarto-projects.html>)
#
# quarto render
#
# ## html
# source(here::here("R", "_pre-render-html.R"))
# quarto render --profile html
#
# ## revealjs
# source(here::here("R", "_pre-render-revealjs.R"))
# quarto render --profile revealjs
#
# ## pdf
# source(here::here("R", "_pre-render-pdf.R"))
# quarto render --profile pdf
