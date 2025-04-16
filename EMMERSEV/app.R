# EMMERSEV: Modular Shiny App Launcher

# Load required libraries
library(shiny)
library(shinydashboard)
library(leaflet)
library(DT)
library(plotly)
library(vegan)
library(readr)
library(ggplot2)
library(pathview)
library(dplyr)
library(DESeq2)

# Source modular components
source("ui/ui_main.R")
source("server/server_main.R")

# Launch the Shiny app
shinyApp(ui = ui, server = server)