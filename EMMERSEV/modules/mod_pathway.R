mod_pathway_ui <- function(id) {
  ns <- NS(id)
  box(
    title = "KEGG Pathway", status = "warning",
    textInput(ns("pathway_id"), "Enter KEGG Pathway ID"),
    actionButton(ns("view"), "Generate"),
    imageOutput(ns("img"))
  )
}

mod_pathway_server <- function(id, shared) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$view, {
      req(shared$dds, input$pathway_id)
      gene_fc <- results(shared$dds)$log2FoldChange
      names(gene_fc) <- rownames(results(shared$dds))

      pathview(gene.data = gene_fc, 
               pathway.id = input$pathway_id, 
               species = "eco", 
               out.suffix = paste0("pathview_", input$pathway_id))

      output$img <- renderImage({
        file <- paste0("pathview_", input$pathway_id, ".png")
        list(src = file, contentType = "image/png", width = 800)
      }, deleteFile = FALSE)
    })
  })
}