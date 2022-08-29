#!/usr/bin/env bash

#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --job-name=treemix_m5_25min
#SBATCH --mail-type=NONE
#SBATCH --mail-user=stone.494@osu.edu

cd $SLURM_SUBMIT_DIR

python command_m5_25min.py
