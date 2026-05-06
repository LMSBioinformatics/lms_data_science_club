#!/usr/bin/env bash

# JU260503

# SLURM CONFIG ................................................................

#SBATCH --job-name=multiqc
#SBATCH --partition=nice
#SBATCH --qos=qos_batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=4G
#SBATCH --time=0-00:30:00
#SBATCH --output=../logs/slurm-multiqc-%j.log

# README ......................................................................

# Run from 2_scripts/ directory:
# sbatch 2_multiqc.sh

# MODULES .....................................................................

set -euo pipefail

# # With available modules
# module load py-multiqc/1.15-jtstpap

# With dependencies installed in conda envs
module load miniconda3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate env_integral 

# PATHS .......................................................................

# Root directory
PROJECT_ROOT="$(cd .. && pwd)"

# Input/output directories
FASTQC_DIR="${PROJECT_ROOT}/results/fastqc"
OUTPUT_DIR="${PROJECT_ROOT}/results/multiqc"
mkdir -p "${OUTPUT_DIR}"

# RUN MULTIQC .................................................................

multiqc \
    "${FASTQC_DIR}" \
    --outdir "${OUTPUT_DIR}" \
    --filename "multiqc_report"

# END .........................................................................
