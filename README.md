# EMMERSEV

**EMMERSEV** is a [Shiny](https://shiny.posit.co/) web dashboard designed to analyze, visualize, and explore environmental microbial metatranscriptomics datasets from Canadian freshwater ecosystems. It supports biogeochemical modelling within the National Water Quality Modelling Framework (NWQMF) at Environment and Climate Change Canada (ECCC).

🌊 **EMMERSEV**: *Environmental Microbial MEtatranscriptomic Research for Statistical Exploration and Visualization*

![ChatGPT Image Apr 16, 2025, 09_45_53 AM](https://github.com/user-attachments/assets/a8d8a3e8-45dd-4153-a7ba-ed7ebaab29ca)

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

Folder Structure

EMMERSEV/
- │
- ├── app.R
- ├── README.md
- ├── DESCRIPTION (optional)
- │
- ├── ui/
- │   └── ui_main.R
- │
- ├── server/
- │   ├── server_main.R
- │   ├── upload_server.R
- │   ├── analysis_server.R
- │   ├── pathway_server.R
- │   └── map_server.R
- │
- └── www/          # For pathview image output (optional)


Run the app:
```r
shiny::runApp("EMMERSEV")
```
