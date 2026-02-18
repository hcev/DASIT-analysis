#!/bin/bash
#SBATCH -N 1      
#SBATCH --mail-type=END           # Type of email notification- BEGIN,END,FAIL,ALL. Equivalent to the -m option in SGE 
#SBATCH --mail-user=hcevasco@mit.edu           # Email to which notifications will be sent. Equivalent to the -M option in SGE. You must replace [] with your email address.
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

set -e  # exit on error

echo "Job started on $(hostname)"
date

# Load conda
module load miniconda3/v4
source /home/software/conda/miniconda3/bin/condainit

# Ensure strict channel priority (important)
conda config --set channel_priority strict

# Activate base
conda activate base

# Install mamba if not present (fast, safe)
conda install -n base -c conda-forge mamba --yes --quiet || true

# Create the environment
conda env create -n crispresso_env -f ./crispresso_environment.yml

echo "Environment install finished"
date
