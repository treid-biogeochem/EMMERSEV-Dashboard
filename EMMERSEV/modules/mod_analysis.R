mod_analysis_ui <- function(id) {
  ns <- NS(id)
  box(
    title = "Multivariate Analysis", status = "info",
    actionButton(ns("run"), "Run DESeq2"),
    plotOutput(ns("pca")),
    plotOutput(ns("nmds"))
  )
}

mod_analysis_server <- function(id, shared) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$run, {
      req(shared$dds)
      dds_res <- DESeq(shared$dds)
      pca_data <- plotPCA(dds_res, returnData = TRUE)

      output$pca <- renderPlot({
        ggplot(pca_data, aes(PC1, PC2, color = condition)) +
          geom_point(size = 3) +
          theme_minimal() +
          labs(title = "PCA Plot")
      })

      output$nmds <- renderPlot({
        nmds <- metaMDS(assay(dds_res))
        plot(nmds, type = "t")
      })
    })
  })
}