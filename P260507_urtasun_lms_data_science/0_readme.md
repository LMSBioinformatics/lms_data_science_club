# P260507_urtasun_lms_data_science

## General background
researcher:
group:
data type:
species:
biological background:

## Input data
`/home/jurtasun/mnt/network/isilon_genix/NEXTSEQ/Runs/260501_VH00409_62_AAJ3YFWM5/Analysis/1/Data/fastq`

## Analysis

1. Run fastqc
`export FASTQ_DIR="/home/jurtasun/mnt/network/isilon_genix/NEXTSEQ/Runs/260501_VH00409_62_AAJ3YFWM5/Analysis/1/Data/fastq"`
`for FQ in "${FASTQ_DIR}"/*.fastq.gz; do sbatch --export=FASTQ_DIR="${FASTQ_DIR}",FQ="${FQ}" 1_fastqc.sh; done`

2. Check execution
`ls -l /home/jurtasun/mnt/network/isilon_genix/NEXTSEQ/Runs/260501_VH00409_62_AAJ3YFWM5/Analysis/1/Data/fastq/*fastq.gz | wc -l`
`ls -l results/fastqc/*.html | wc -l`

