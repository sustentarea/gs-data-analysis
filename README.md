
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gs-data-analysis

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![License:
MIT](https://img.shields.io/badge/license-MIT-green)](https://choosealicense.com/licenses/mit/)
[![License: CC BY
4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
<!-- badges: end -->

## Overview

This repository contains the [Quarto
book](https://quarto.org/docs/books/) of the project: *Impact of climate
change on child nutrition: data analysis and database development*. Its
aim is to facilitate research work and to improve reproducibility.

Click [here](https://osf.io/frwmq/) to access the research compendium
and [here](https://sustentarea.github.io/gs-data-analysis/) to access
the report.

The assemble of this repository was inspired by Ben Marwick, Carl
Boettiger & Lincoln Mullen’s article [Packaging Data Analytical Work
Reproducibly Using R (and
Friends)](https://doi.org/10.1080/00031305.2017.1375986).

## How to use

The analyses contained in this repository are 100% reproducible. They
were made using the [R programming language](https://www.r-project.org/)
and the [Quarto](https://quarto.org/) publishing system. The
[`renv`](https://rstudio.github.io/renv/) package was used to ensure
that the R environment used can be restored (see `renv.lock`). The
computational notebooks can be found in the `qmd` directory.

To reproduce the analyses do the following steps:

1.  Clone this repository.
2.  Open the R project (`gs-data-analysis.Rproj`).
3.  Run
    [`renv::restore()`](https://rstudio.github.io/renv//reference/restore.html)
    to install all software dependencies.
4.  Open and run the analysis in the computational notebooks.

If you don’t feel comfortable with R, we strongly recommend checking
Hadley Wickham and Garrett Grolemund’s free and online book [R for Data
Science](https://r4ds.had.co.nz/) and the Coursera course from Johns
Hopkins University [Data Science: Foundations using
R](https://www.coursera.org/specializations/data-science-foundations-r).

## License

[![License:
MIT](https://img.shields.io/badge/license-MIT-green)](https://opensource.org/license/mit/)
[![License: CC BY
4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

Code related to this repository is released under the [MIT
license](https://opensource.org/license/mit/). Documents are released
under the [Creative Commons Attribution 4.0 International
license](https://creativecommons.org/licenses/by/4.0/).

## Citation

You can find the compendium citation below.

    Magalhães, A. R., Vartanian, D., & Carvalho, A. M. (2024). Impact of climate change on child nutrition: data analysis and database development. https://github.com/sustentarea/gs-data-analysis

A BibTeX entry for LaTeX users is

    @techreport{magalhaes_2024,
      title = {Impact of climate change on child nutrition: data analysis and database development},
      author = {{Arthur Ramalho Magalhães}, {Daniel Vartanian} and {Aline Martins de Carvalho}},
      year = {2024},
      institution = "Sustentarea",
      langid = {en-us},
      url = {https://github.com/sustentarea/gs-data-analysis}
    }

## Acknowledgments

The research reported here was supported by the Conselho Nacional de
Desenvolvimento Científico e Tecnológico - Brazil
([CNPq](https://www.gov.br/cnpq/)).
