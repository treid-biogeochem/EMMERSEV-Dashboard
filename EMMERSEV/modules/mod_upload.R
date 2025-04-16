mod_upload_ui <- function(id) {
  ns <- NS(id)
  box(
    title = "Upload Data", status = "primary", solidHeader = TRUE,
    fileInput(ns("counts"), "Count Matrix (.csv)", accept = ".csv"),
    fileInput(ns("meta"), "Metadata (.csv)", accept = ".csv"),
    fileInput(ns("pathway"), "Pathway Table (.csv)", accept = ".csv"),
    actionButton(ns("upload_btn"), "Upload", icon = icon("upload"))
  )
}

mod_upload_server <- function(id, shared) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$upload_btn, {
      req(input$counts, input$meta, input$pathway)
      shared$counts <- read.csv(input$counts$datapath, row.names = 1)
      shared$meta <- read.csv(input$meta$datapath)
      shared$pathway <- read.csv(input$pathway$datapath)

      shared$dds <- DESeqDataSetFromMatrix(
        countData = shared$counts,
        colData = shared$meta,
        design = ~ condition
      )
    })
  })
}