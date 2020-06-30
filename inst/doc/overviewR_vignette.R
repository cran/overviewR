## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
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

