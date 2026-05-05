# P260508_urtasun_lms_data_science

# Input data
`/mnt/network/isilon_genix/NEXTSEQ/Runs/260422_VH00409_61_AAHTGY7M5/Analysis/1/Data/fastq/`

# Analysis summary
researcher:
group:
data type:
scpecies:
general background:

# Setup for conda environments

1. Check and load conda
`module availe conda`
`module load miniconda3`

2. Create and environment using yml file in `1_envs/`

3. Run again but with
```bash
# With dependencies installed in conda envs
module load miniconda3
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate basic_qc
```

# Analysis steps

1. Check number of files in input directory
`ls -l ~/mnt/network/isilon_genix/NEXTSEQ/Runs/260422_VH00409_61_AAHTGY7M5/Analysis/1/Data/fastq/*fastq.gz | wc -l`

2. Run FastQC from `2_scripts/1_fastqc.sh`
`export FASTQ_DIR="/home/jurtasun/mnt/network/isilon_genix/NEXTSEQ/Runs/260422_VH00409_61_AAHTGY7M5/Analysis/1/Data/fastq/"`
`for FQ in "${FASTQ_DIR}"/*fastq.gz; do sbatch --export=FASTQ_DIR="${FASTQ_DIR}",FQ="${FQ}" 1_fastqc.sh; done`

3. Verify all outputs generated correctly
`ls -l ../results/fastqc/*html | wc -l`
`ls -l ../results/fastqc/*zip | wc -l`

