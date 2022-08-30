#!/usr/bin/env bash

#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --job-name=treemix_m0_25min
#SBATCH --mail-type=NONE
#SBATCH --mail-user=stone.494@osu.edu

cd $SLURM_SUBMIT_DIR

#array script. Submit with sbatch --array [0-5] array_run_treemix_25min.sh


#set up array
command_dir="path/to/command.py/scripts/"
cd $command_dir
cmdfiles=(command_*.py)
infile="${cmdfiles[$SLURM_ARRAY_TASK_ID]}"


#call python script
python $infile

