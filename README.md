# Antarctic Nutrients and Snow Algae Analysis
This repository contains data processing, statistical analyses, and visualization workflows used to assess relationships between nutrient availability and snow algae dynamics along the West Antarctic Peninsula.

## Project Overview
This project examines relationships between dissolved snow nutrient concentrations, nutrient ratios, and algal biomass and pigment composition across multiple field sites along the West Antarctic Peninsula. 

Analyses include: 
- Cell density and biomass
- Bulk and normalized (per-cell) pigment concentrations
- Pigment composition and ratios
- Nutrient (anion) concentrations
- Nutrient source indicators
- Phosphate binning and ratio analysis

## Repository Structure
Each folder represents a self-contained analysis workflow: 

Each folder represents a self-contained analysis workflow:

- `01_CellDensity/` – Cell density calculations and visualization  
- `02_PigmentConcentration/` – Bulk and normalized pigment concentrations  
- `03_PigmentComposition/` – Pigment ratios and composition analysis  
- `04_AnionConcentration/` – Nutrient (anion) concentration analysis  
- `05_APNutrientSource/` – Nutrient source indicators (Antarctic Peninsula)  
- `06_BinnedPhosphate/` – Phosphate binning and ratio-based analysis  

Within each folder:
- `data/` – Input datasets  
- `scripts/` – R scripts and/or R Markdown workflows  
- `.Rproj` – R project file for that analysis

Each sub-project is self-contained and can be run independently. Data and scripts may need to be pulled from their respective `data/` and `script/` folders into the containing sub-folder with the R Project file in order to successfully run. 

## Methods Summary
All analyses were conducted in R. Data were assessed for normality and homogeneity of variance, and nonparametric methods were applied due to violations of parametric assumptions.

Key analytical components include:
- Nonparametric statistical testing (e.g., Kruskal-Wallis, Dunn’s tests)  
- Data visualization using ggplot2  
- Nutrient ratio calculations (e.g., N:P)  
- Pigment normalization and ratio analysis

## Citation
If using this repository or associated data, please cite the associated manuscript.

