#!/bin/bash
#
# Gregory Way 2019
# Cellular Morphology Resistance Mechanisms
#
# Analysis Pipeline

# Step 0 - Convert all notebooks to scripts
jupyter nbconvert --to=script --FilesWriter.build_directory=scripts/nbconverted *.ipynb

# Step 1 - Merge two batches of data together into one dataset
Rscript --vanilla scripts/nbconverted/merge-batch-data.r

# Step 2 - Visualize merged batches with UMAP
jupyter nbconvert --to=html \
        --FilesWriter.build_directory=scripts/html \
        --ExecutePreprocessor.kernel_name=python3 \
        --ExecutePreprocessor.timeout=10000000 \
        --execute umap-visualize.ipynb

# Step 3 - Observe feature differences between doses
Rscript --vanilla scripts/nbconverted/discover-feature-differences.r
