#!/usr/bin/env bash

#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --job-name=svdq_lineage
#SBATCH --mail-type=ALL
#SBATCH --mail-user=stone.494@osu.edu

cd $SLURM_SUBMIT_DIR

module load paup
paup -n cmds_svdq_lineage.nex