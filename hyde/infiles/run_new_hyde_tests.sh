#!/usr/bin/env bash

#SBATCH --time=8:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=intersections
#SBATCH --mail-type=NONE
#SBATCH --mail-user=stone.494@osu.edu

cd $SLURM_SUBMIT_DIR

#run regular full hyde analysis
run_hyde.py -i allseqs_min25.phy -m popmap_allseqs_min25.txt -tr triplets.txt -o outgroup -n 149 -t 17 -s 153747 --prefix allseq_full

#run hyde individual tests
individual_hyde.py -i allseqs_min25.phy -m popmap_allseqs_min25.txt -tr triplets.txt -o outgroup -n 149 -t 17 -s 153747 --prefix allseq_ind
