#!/usr/bin/env bash

#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --job-name=svdq_species
#SBATCH --mail-type=ALL
#SBATCH --mail-user=stone.494@osu.edu

cd $SLURM_SUBMIT_DIR

module load paup
paup -n cmds_svdq_species.nex