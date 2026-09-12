# Optimizer's dilemma

Reproduction of:

Crawford, Chikina, Greene (2024)  
*Optimizer's dilemma: optimization strongly influences model selection in transcriptomic prediction*

---

## 📁 Overview

This repository contains a reproduction of the experiments from the paper using the original codebase:

https://github.com/greenelab/pancancer-evaluation

The goal is to evaluate how the choice of optimizer (liblinear vs. SGD) influences model selection and performance in transcriptomic prediction tasks.

---

## ⚙️ Setup

### Create and activate the conda environment:

```bash
conda env create -f environment.yml
conda activate pc-eval
```

### Data Access & Preprocessing

⚠️ Large data files (e.g., .tsv.gz, expression matrices) are not included in this repository due to GitHub file size limitations.

Instead, the required data can be generated using the provided preprocessing notebook:
```bash
cd 00_process_data
jupyter notebook download_data.ipynb
```
Run all cells in the notebook to automatically download and preprocess:

Gene expression data (RNA-seq)
Mutation data (MC3)
Copy number data (GISTIC2)
Data sources
TCGA Pan-Cancer Atlas (GDC):
https://gdc.cancer.gov/about-data/publications/pancanatlas
Copy number data (Figshare):
https://figshare.com/articles/dataset/TCGA_PanCanAtlas_Copy_Number_Data/6144122

⚠️ Note: This preprocessing step is required before running the experiments but is not clearly referenced in the original repository README.

## Experiments

Due to computational constraints, experiments were performed with a reduced setup:

50 genes (instead of 84)
2 cross-validation folds (instead of 4×2 repetitions)
Reduced hyperparameter search
#### Run liblinear (baseline)
cd 01_stratified_classification

```
python run_stratified_lasso_penalty.py \
    --genes top_50 \
    --num_folds 2 \
    --results_dir ../results
```
#### Run SGD
```
python run_stratified_lasso_penalty.py \
    --genes top_50 \
    --sgd \
    --num_folds 2 \
    --results_dir ../results_sgd_small
```
## 📈 Results

The results (with these changes:

- Smaller gene set
- Reduced cross-validation
- Limited computational resources)

can be found in:
```
pancancer-evaluation\01_stratified_classification
```
