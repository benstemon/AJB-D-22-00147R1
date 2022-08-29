#because subsampling scheme in sfs.py is non-random, performing multiple iterations of this is not necessary.
#therefore, i should be fixed at 1, and subsampling should use the maximum number of available samples
#except for p1 and -2, which must be equal. Max for davidsonii = 50, max for fruticosus = 104

# SET THESE VARIABLES PRIOR TO RUNNING:

############
# set temporary path so genomics libraries can be found in python
export PYTHONPATH=$PYTHONPATH:/Users/bejo/programs/python_libs/genomics_general

# list pwd for the basecount files 
basecountwd="/Users/bejo/Desktop/making_DFS/3_basecounts"

# list pwd for the python script sfs.py
scriptwd="/Users/bejo/Desktop/making_DFS/sfs.py"

# list pwd for the directories to which sfs files will be written
praetdir="/Users/bejo/Desktop/sfs_praeteritus_10s"
menzdir="/Users/bejo/Desktop/sfs_menziesii_10s"
scouldir="/Users/bejo/Desktop/sfs_scouleri_10s"
serrdir="/Users/bejo/Desktop/sfs_serratus_10s"
############

# run the code to generate sfs for x replicates
rm -r $praetdir; mkdir $praetdir
rm -r $menzdir; mkdir $menzdir
rm -r $scouldir; mkdir $scouldir
rm -r $serrdir; mkdir $serrdir

for i in 1
do
    cd $praetdir
    python3 "$scriptwd" -i "$basecountwd"/praeteritus.basecounts.tsv.gz --inputType baseCounts --outgroup outgroup --FSpops fruticosus praeteritus davidsonii --subsample 10 10 10 --pref rep_"$i"_ --suff .sfs
    cd $menzdir
    python3 "$scriptwd" -i "$basecountwd"/menziesii.basecounts.tsv.gz --inputType baseCounts --outgroup outgroup --FSpops davidsonii menziesii fruticosus --subsample 10 10 10 --pref rep_"$i"_ --suff .sfs
    cd $scouldir
    python3 "$scriptwd" -i "$basecountwd"/scouleri.basecounts.tsv.gz --inputType baseCounts --outgroup outgroup --FSpops fruticosus scouleri davidsonii --subsample 10 10 10 --pref rep_"$i"_ --suff .sfs
    cd $serrdir
    python3 "$scriptwd" -i "$basecountwd"/serratus.basecounts.tsv.gz --inputType baseCounts --outgroup outgroup --FSpops fruticosus serratus davidsonii --subsample 6 6 10 --pref rep_"$i"_ --suff .sfs
done