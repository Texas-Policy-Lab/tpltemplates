library(shiny)
library(shinydashboard)

rm(list = ls())
options(encoding = "UTF-8")

sapply(list.files("R", full.names = TRUE, recursive = TRUE), source, .GlobalEnv)

config <- yaml::read_yaml("./mainDashboard.yaml")

## GLOBALS
TPL_URL <- config$tpl_url
DASHBOARD_TITLE <- config$ui$title
CSS_PTH <- config$css_pth
JS_PTH <- config$js_pth
FAVICON_PTH <- config$favicon_pth
TABS <- config$ui$tabs
