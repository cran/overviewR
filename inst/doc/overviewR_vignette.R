## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE,
                      comment = "#>")

## ----echo=FALSE,results='hide',message=FALSE,include=FALSE, eval=TRUE---------
if (!require(knitr))
  install.packages("knitr", repos = "http://cran.us.r-project.org")
if (!require(devtools))
  install.packages("devtools", repos = "http://cran.us.r-project.org")
if (!require(dplyr))
  install.packages("dplyr", repos = "http://cran.us.r-project.org")
if (!require(magrittr))
  install.packages("magrittr", repos = "http://cran.us.r-project.org")
if (!require(ggplot2))
  install.packages("ggplot2", repos = "http://cran.us.r-project.org")
if (!require(countrycode))
  install.packages("countrycode", repos = "http://cran.us.r-project.org")
if (!require(xtable))
  install.packages("xtable", repos = "http://cran.us.r-project.org"
  )

## ---- eval=FALSE--------------------------------------------------------------
#  install.packages("overviewR", force = TRUE)

## ---- message=FALSE, warning=FALSE, results = "hide", eval=TRUE---------------
library(devtools)
devtools::install_github("cosimameyer/overviewR")

## ---- include = FALSE, eval = FALSE-------------------------------------------
#  install.packages("overviewR")

## ---- message=FALSE, warning=FALSE--------------------------------------------
library(overviewR)

## -----------------------------------------------------------------------------
data(toydata)
head(toydata)

## ---- message=FALSE, warning=FALSE, eval=FALSE--------------------------------
#  output_table <- overview_tab(dat = toydata, id = ccode, time = year)

## ---- message=FALSE, eval=FALSE-----------------------------------------------
#  output_table

## ---- message=FALSE, warning=FALSE, eval=FALSE--------------------------------
#  output_crosstab <- overview_crosstab(
#    dat = toydata,
#    cond1 = gdp,
#    cond2 = population,
#    threshold1 = 25000,
#    threshold2 = 27000,
#    id = ccode,
#    time = year
#  )

## ---- message=FALSE, echo=FALSE, eval=FALSE-----------------------------------
#  output_crosstab

## ---- eval=FALSE--------------------------------------------------------------
#  overview_print(obj = output_table)

## ---- eval=FALSE, include=FALSE-----------------------------------------------
#  overview_print(obj = output_table)

## ---- eval = FALSE, eval=FALSE------------------------------------------------
#  overview_print(
#    obj = output_table,
#    id = "Countries",
#    time = "Years",
#    title = "Cool new title for our awesome table"
#  )

## ---- eval=FALSE, include=FALSE-----------------------------------------------
#  overview_print(
#    obj = output_table,
#    id = "Countries",
#    time = "Years",
#    title = "Cool new title for our awesome table"
#  )

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
#  overview_print(obj = output_table,
#                 fontsize = "scriptsize",
#                 label = "tab:overview")

## ---- eval = FALSE------------------------------------------------------------
#  overview_print(
#    obj = output_table,
#    save_out = TRUE,
#    path = "SET-YOUR-PATH",
#    file = "output.tex"
#  )

## ---- out.width = '50%', fig.align='center'-----------------------------------
data(toydata)
overview_plot(dat = toydata, id = ccode, time = year)

## ---- out.width = '50%', fig.align='center'-----------------------------------
overview_plot(
  dat = toydata,
  id = ccode,
  time = year,
  asc = FALSE
)

## ---- out.width = '50%', fig.align='center', include = TRUE, results = TRUE, message = FALSE, warning=FALSE----
# Load the GitHub version
library(devtools) # Tools to Make Developing R Packages Easier
devtools::install_github("cosimameyer/overviewR")
library(overviewR) # Easily Extracting Information About Your Data
library(magrittr) # A Forward-Pipe Operator for R

# Code whether a year was before 1995
toydata %<>%
  dplyr::mutate(before = ifelse(year < 1995, 1, 0))

# Plot using the `color` argument
overview_plot(
  dat = toydata,
  id = ccode,
  time = year,
  color = before
)

## ---- eval = FALSE------------------------------------------------------------
#  # Plot using the `color` argument
#  overview_plot(
#    dat = toydata,
#    id = ccode,
#    time = year,
#    dot_size = 5
#  )

## ---- out.width = '50%', fig.align='center', include = TRUE, results = TRUE, message = FALSE, warning=FALSE----
# Load the GitHub version
library(devtools) # Tools to Make Developing R Packages Easier
devtools::install_github("cosimameyer/overviewR")
library(overviewR) # Easily Extracting Information About Your Data
overview_crossplot(
  toydata,
  id = ccode,
  time = year,
  cond1 = gdp,
  cond2 = population,
  threshold1 = 25000,
  threshold2 = 27000,
  color = TRUE,
  label = TRUE
)

## ---- include = FALSE---------------------------------------------------------
toydata_red <- toydata[-sample(seq_len(nrow(toydata)), 64),]

## ---- out.width = '50%', fig.align='center'-----------------------------------
overview_heat(toydata_red,
              ccode,
              year,
              perc = TRUE,
              exp_total = 12)

## ---- include=FALSE-----------------------------------------------------------
toydata_with_na <- toydata %>%
  dplyr::mutate(
    year = ifelse(year < 1992, NA, year),
    month = ifelse(month %in% c("Jan", "Jun", "Aug"), NA, month),
    gdp = ifelse(gdp < 20000, NA, gdp)
  )

## ---- out.width = '50%', fig.align='center'-----------------------------------
overview_na(toydata_with_na)

## ---- out.width = '50%', fig.align='center'-----------------------------------
overview_na(toydata_with_na, perc = FALSE)

## ---- out.width = '50%', fig.align='center', eval = TRUE----------------------
library(dplyr)

# Subset one data set for comparison
toydata2 <- toydata %>% dplyr::filter(year > 1992)

overview_overlap(
  dat1 = toydata,
  dat2 = toydata2,
  dat1_id = ccode,
  dat2_id = ccode,
  plot_type = "bar" # This is the default
)

## ---- out.width = '50%', fig.align='center'-----------------------------------
library(ggplot2) # Create Elegant Data Visualisations Using the Grammar of Graphics

overview_na(toydata_with_na) +
  ggplot2::theme_minimal() 

## ---- out.width = '50%', fig.align='center'-----------------------------------
library(dplyr) # A Grammar of Data Manipulation # A Grammar of Data Manipulation

toydata_with_na %>%
  dplyr::filter(year > 1993) %>%
  overview_na()

## ---- out.width = '50%', fig.align='center'-----------------------------------
library(countrycode) # Convert Country Names and Country Codes
library(dplyr) # A Grammar of Data Manipulation # A Grammar of Data Manipulation

toydata %>%
  # Transform the country code (ISO3 character code) into a country name using
  # the `countrycode` package
  dplyr::mutate(country =
                  countrycode::countrycode(ccode, "iso3c", "country.name")) %>%
  overview_plot(id = country, time = year)

## ---- eval = FALSE------------------------------------------------------------
#  # Produces a printable LaTeX output
#  toydata %>%
#    overview_tab(id = ccode, time = year) %>%
#    overview_print()

## ---- eval=FALSE--------------------------------------------------------------
#  library(flextable) # not installed on this machine
#  table_output <- qflextable(output_table)
#  table_output <-
#    set_header_labels(table_output,
#                      ccode = "Countries",
#                      time_frame = "Time frame")
#  set_table_properties(table_output,
#                       width = .4,
#                       layout = "autofit")

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
library(knitr) # A General-Purpose Package for Dynamic Report Generation in R
knitr::kable(output_table)

## ---- out.width = '50%', fig.align='center'-----------------------------------
library(ggplot2) # Create Elegant Data Visualisations Using the
# Grammar of Graphics

overview_na(toydata_with_na) +
  ggplot2::theme_minimal()

## ---- eval=TRUE---------------------------------------------------------------
library(overviewR)
library(dplyr)
library(xtable)

# Load data
data(toydata)

# Restrict the data so that we have something to compare :-)
toydata_res <- toydata %>%
  dplyr::filter(year > 1992)

# Generate two overview_tab objects
dat1 <- overview_tab(toydata, id = ccode, time = year)
dat2 <- overview_tab(toydata_res, id = ccode, time = year)

# And now we use full_join to combine both
dat_full <- dat1 %>%
  dplyr::full_join(dat2, by = "ccode") %>%
  dplyr::rename(time_dat1 = time_frame.x,
                time_dat2 = time_frame.y)

## ---- eval=FALSE--------------------------------------------------------------
#  head(dat_full)

## ---- eval=FALSE--------------------------------------------------------------
#  print(xtable(dat_full), include.rownames = FALSE)

