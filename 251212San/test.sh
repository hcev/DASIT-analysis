#!/bin/bash
#SBATCH --time=00:05:00
#SBATCH --mem=2G
#SBATCH --output=test_mm_%j.out

source ~/.bashrc
eval "$(micromamba shell hook --shell bash --root-prefix /home/hcevasco/conda_envs/y)"

micromamba run -n crispresso_env python -c "import pandas; print('Pandas OK:', pandas.__version__)"
micromamba run -n crispresso_env CRISPResso --version