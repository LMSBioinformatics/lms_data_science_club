#!/usr/bin/env bash

# JU260503

# SLURM CONFIG ................................................................

#SBATCH --job-name=fastqc
#SBATCH --partition=nice
#SBATCH --qos=qos_batch
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=0-02:00:00
#SBATCH --output=../logs/slurm-fastqc-%j.log

# README ......................................................................

# Export FASTQ_DIR, then run from 2_scripts/ directory:
# export FASTQ_DIR="/path/to/fastq"
# for FQ in "${FASTQ_DIR}"/*.fastq.gz; do sbatch --export=FASTQ_DIR="${FASTQ_DIR}",FQ="${FQ}" 1_fastqc.sh; done

# MODULES .....................................................................

set -euo pipefail

# With available modules
# module load fastqc/0.12.1

# With dependencies installed in conda envs
module load miniconda3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate basic_qc


# PATHS .......................................................................

# Root directory
PROJECT_ROOT="$(cd .. && pwd)"

# Input file — one per job, passed via --export
FASTQ_DIR="${FASTQ_DIR:?ERROR: FASTQ_DIR not set}"
FQ="${FQ:?ERROR: FQ not set}"

# Output directory
OUTPUT_DIR="${PROJECT_ROOT}/results/fastqc"
mkdir -p "${OUTPUT_DIR}"

# RUN FASTQC ..................................................................

fastqc \
    --quiet \
    --outdir "${OUTPUT_DIR}" \
    --threads "${SLURM_CPUS_PER_TASK}" \
    "${FQ}"

# END .........................................................................
