# Discovering Morphological Markers of Drug Resistance

**Gregory Way, Shantanu Singh, Beth Cimini, and Anne Carpenter, 2019**

_(A collaboration with Adi Berman, Megan Elizabeth Kelley, and Tarun Kapoor)_

In this repository we analyze preliminary [Cell Painting](https://doi.org/10.1038/nprot.2016.105) data generated by the Kapoor lab and processed by the Carpenter lab.

## Data Collection and Processing

We cultured a colon cancer cell line (HCT116), treated with a proteosome inhibitor (Bortezomib), and selected two resistant clones.
We applied Cell Painting to these cell lines (in triplicate) under four conditions (DMSO, 0.7nm, 7nm, and 70nm Bortezomib).

The cell painting assay captures several cellular morphology features (described in more detail [here](https://github.com/carpenterlab/2016_bray_natprot/wiki/What-do-Cell-Painting-features-mean%3F)).
Our hypothesis was that morphological features could distinguish wildtype from resistant clones.

We processed the cell painting data using [CellProfiler](https://cellprofiler.org/).
We use CellProfiler to test quality control, segment images to extract nuclei, and measure features captured by cell painting.

## Downstream Analysis and Visualization

This repository ingests the processed Cell Painting data and performs several downstream analyses.

### Pilot Analysis

Using the triplicate measurements, and two batches, we perform the following pilot analyses:

* Obtain similarity matrices for each batch independently and combined; perform hierarchical clustering; visualize heatmaps.
  * These analyses were performed using the [Morpheus](https://software.broadinstitute.org/morpheus/) WebApp
  * An outline of the results can be viewed [here](figures/morpheus).
* Apply [UMAP](https://github.com/lmcinnes/umap) to the batched data to observe large differences across variables
* Apply t-tests to determine cell morphology differences between conditions:
  * We test for differences between resistant clones at two doses of Bortezomib (`0.7nm` and `7nm`)
  * We also test for differences between wildtype and resistant clones at a low dose of Bortezomib (`0.7nm`)

#### UMAP Batch Analysis

[UMAP](https://raw.githubusercontent.com/broadinstitute/2018_05_30_ResistanceMechanisms_Kapoor/master/figures/merged_umap.png)

#### T-test to Determine Morphological Differences

[ttest](https://raw.githubusercontent.com/broadinstitute/2018_05_30_ResistanceMechanisms_Kapoor/master/figures/dosage_feature_figure.png)

## Reproducibility

We use [conda](https://conda.io/en/latest/) to manage package versions.
After installing conda, obtain all required packages:

```bash
conda env create --force --file environment.yml

# Activate environment
conda activate resistance-mechansisms
```

Clone the github repository.
First, generate and enable [SSH Keys](https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) if you haven't already.

```bash
# Then clone and enter repo
git clone git@github.com:broadinstitute/2018_05_30_ResistanceMechanisms_Kapoor.git
cd 2018_05_30_ResistanceMechanisms_Kapoor
```

All analyses are presented in [`analysis.sh`](analysis.sh).
To reproduce, perform the following:

```bash
./analysis.sh
```

## Bug Reporting

Please file an [issue](https://github.com/broadinstitute/2018_05_30_ResistanceMechanisms_Kapoor/issues) with any questions or bug reports.
