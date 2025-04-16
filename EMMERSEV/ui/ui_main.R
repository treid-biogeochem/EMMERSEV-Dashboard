source("modules/mod_upload.R")
source("modules/mod_analysis.R")
source("modules/mod_pathway.R")
source("modules/mod_map.R")

ui <- dashboardPage(
  dashboardHeader(title = "EMMERSEV"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Upload", tabName = "upload", icon = icon("upload")),
      menuItem("Analysis", tabName = "analysis", icon = icon("chart-bar")),
      menuItem("Pathways", tabName = "pathway", icon = icon("flask")),
      menuItem("Map", tabName = "map", icon = icon("map-marker-alt"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "upload", mod_upload_ui("upload")),
      tabItem(tabName = "analysis", mod_analysis_ui("analysis")),
      tabItem(tabName = "pathway", mod_pathway_ui("pathway")),
      tabItem(tabName = "map", mod_map_ui("map"))
    )
  )
)