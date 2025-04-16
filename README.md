# EMMERSEV

**EMMERSEV** is a Shiny web dashboard designed to analyze, visualize, and explore environmental microbial metatranscriptomics datasets from Canadian freshwater ecosystems. It supports biogeochemical modelling within the National Water Quality Modelling Framework (NWQMF) at Environment and Climate Change Canada (ECCC).

🌊 **EMMERSEV**: *Environmental Metatranscriptomic and Multivariate Exploration with R for Statistical and Ecological Visualization*

---

## ✨ Features

- Upload count matrices and metadata with geolocation support
- Perform DESeq2-based statistical testing
- Generate PCA, NMDS, and (optionally) CCA ordinations
- Filter genes by KEGG or SEED pathways
- Visualize functional data using KEGG pathway maps via `pathview`
- View datasets on an interactive map of Canada
- Clickable markers to reload/reanalyze datasets

## 🧬 Input Format

### 1. Count Matrix CSV
```
gene_id,S1,S2,S3
geneA,23,11,42
```
- Rows: Gene IDs
- Columns: Sample IDs

### 2. Metadata CSV
```
sample,condition,lat,lon
S1,control,45.1,-75.6
S2,treated,52.0,-90.2
```

### 3. Pathway Table CSV
```
gene_id,type,pathway
gene1,KEGG,Sulfur metabolism
gene2,SEED,Nitrogen metabolism
```

## 🧪 KEGG Pathway Mapping

If your gene IDs follow the KEGG format (e.g., `eco:b1234`), EMMERSEV can visualize selected pathways with `pathview`.

## 🗺️ Map Integration

Samples with `lat`/`lon` metadata are mapped on an interactive leaflet map of Canada. Clicking a sample:
- Reloads the dataset
- Re-runs the previous analysis

## 📦 Running Locally

Install required packages:
```r
install.packages(c("shiny", "shinydashboard", "leaflet", "DT", "plotly", "vegan", "readr", "ggplot2"))
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("pathview")
```

Run the app:
```r
shiny::runApp("EMMERSEV")
```
