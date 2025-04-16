mod_map_ui <- function(id) {
  ns <- NS(id)
  box(
    title = "Sample Map", status = "success",
    leafletOutput(ns("map")),
    textOutput(ns("info"))
  )
}

mod_map_server <- function(id, shared) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$map <- renderLeaflet({
      req(shared$meta)
      leaflet(shared$meta) %>%
        addProviderTiles("CartoDB.Positron") %>%
        addCircleMarkers(~lon, ~lat, label = ~sample, layerId = ~sample)
    })

    observeEvent(input$map_marker_click, {
      click <- input$map_marker_click
      info <- shared$meta[shared$meta$sample == click$id, ]
      output$info <- renderText({
        paste("Sample:", info$sample, "| Condition:", info$condition)
      })
    })
  })
}