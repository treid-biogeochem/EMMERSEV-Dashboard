# Load module server scripts
source("server/upload_server.R", local = TRUE)
source("server/analysis_server.R", local = TRUE)
source("server/pathway_server.R", local = TRUE)
source("server/map_server.R", local = TRUE)

# Call modules using moduleServer syntax
upload_server("upload")
analysis_server("analysis")
pathway_server("pathway")
map_server("map")
