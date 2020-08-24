## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE,
                      comment = "#>")

## ----echo=FALSE,results='hide',message=FALSE,include=FALSE, eval=TRUE---------
if (!require(knitr))
  install.packages("knitr", repos = "http://cran.us.r-project.org")
if (!require(devtools))
  install.packages("devtools", repos = "http://cran.us.r-project.org")
if (!require(dplyr))
  install.packages("dplyr", repos = "http://cran.us.r-project.org"
  )

## ---- message=FALSE, warning=FALSE, eval=FALSE--------------------------------
#  devtools::install_github("cosimameyer/overviewR")
#  library(overviewR)

## ---- eval=FALSE--------------------------------------------------------------
#  data(toydata)
#  head(toydata)

## ---- message=FALSE, warning=FALSE, eval=FALSE--------------------------------
#  output_table <- overview_tab(dat = toydata, id = ccode, time = year)

## ---- message=FALSE, eval=FALSE-----------------------------------------------
#  output_table

## ---- message=FALSE, warning=FALSE, eval=FALSE--------------------------------
#  output_crosstab <- overview_crosstab(
#      dat = toydata,
#      cond1 = gdp,
#      cond2 = population,
#      threshold1 = 25000,
#      threshold2 = 27000,
#      id = ccode,
#      time = year
#    )

## ---- message=FALSE, echo=FALSE, eval=FALSE-----------------------------------
#  output_crosstab

## ---- eval=FALSE--------------------------------------------------------------
#  overview_print(obj = output_table)

## ---- eval=FALSE, include=FALSE-----------------------------------------------
#  overview_print(obj = output_table)

## ---- eval = FALSE, eval=FALSE------------------------------------------------
#  overview_print(obj = output_table, id = "Countries", time = "Years",
#                 title = "Cool new title for our awesome table")

## ---- eval=FALSE, include=FALSE-----------------------------------------------
#  overview_print(obj = output_table, id = "Countries", time = "Years",
#                 title = "Cool new title for our awesome table")

## ---- eval = FALSE------------------------------------------------------------
#  overview_print(
#    obj = output_crosstab,
#    title = "Cross table of the sample",
#    crosstab = TRUE,
#    cond1 = "GDP",
#    cond2 = "Population"
#  )

## ---- eval=FALSE, include=FALSE-----------------------------------------------
#  overview_print(
#    obj = output_crosstab,
#    title = "Cross table of the sample",
#    crosstab = TRUE,
#    cond1 = "GDP",
#    cond2 = "Population"
#  )

## ---- eval = FALSE------------------------------------------------------------
#  overview_print(obj = output_table, save_out = TRUE)

## ---- eval=FALSE--------------------------------------------------------------
#  library(flextable)
#  table_output <- qflextable(output_table)
#  table_output <-
#    set_header_labels(table_output,
#                      ccode = "Countries",
#                      time_frame = "Time frame")
#  set_table_properties(
#    table_output,
#    width = .4,
#    layout = "autofit"
#  )

## ---- echo=FALSE, include=FALSE-----------------------------------------------
output_table <-
  data.frame(
    ccode = c("RWA", "AGO", "BEN", "GBR", "FRA"),
    time_frame = c(
      "1990-1995",
      "1990-1992",
      "1995-1999",
      "1991, 1993, 1995, 1997, 1999",
      "1993, 1996, 1999"
    )
  )

## -----------------------------------------------------------------------------
library(knitr)
knitr::kable(output_table)

## ---- message=FALSE, warning=FALSE, results = "hide", eval=TRUE---------------
library(devtools)
devtools::install_github("cosimameyer/overviewR")
library(overviewR)

## ---- fig.align='center', eval = FALSE----------------------------------------
#  data(toydata)
#  overview_plot(dat = toydata, id = ccode, time = year)

## ---- include = FALSE---------------------------------------------------------
toydata_red <- toydata[-sample(seq_len(nrow(toydata)), 64), ]

## ---- fig.align='center', eval = FALSE----------------------------------------
#  overview_heat(toydata_red,
#                  ccode,
#                  year,
#                  perc = TRUE,
#                  exp_total = 12)

## ---- include=FALSE-----------------------------------------------------------
toydata_with_na <- toydata %>%
  dplyr::mutate(year = ifelse(year < 1992, NA, year),
                month = ifelse(month %in% c("Jan", "Jun", "Aug"), NA, month),
                gdp = ifelse(gdp < 20000, NA, gdp))

## ----  fig.align='center', eval= FALSE----------------------------------------
#  overview_na(toydata_with_na)

## ---- fig.align='center', eval = FALSE----------------------------------------
#  overview_na(toydata_with_na, perc = FALSE)

