eval "$(conda shell.bash hook)"
conda activate faststructure
cd ~/Desktop/running_faststructure
#seed=(27537,31753,8296,11243)

for i in {1..5}
do
	for j in {1..10}
	do
		python /Users/Ben/programs/fastStructure/structure.py -K $j --input=infiles_unlinked/fs_infile_unlinked_biallelic_rep${i} --output=outfiles_unlinked_seed5/unlinked_rep${i} --full --seed=11243
	done
done