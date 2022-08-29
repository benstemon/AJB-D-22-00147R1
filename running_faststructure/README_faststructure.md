##############
#STEP 1
##############

#use vcftools to generate vcf with only biallelic snps (from focalseqs_min25 -- also one with linked)
../vcftools-vcftools-581c231/src/cpp/./vcftools --vcf focalseqs_min25.vcf --min-alleles 2 --max-alleles 2 --recode --remove remove_inds_vcf --out linked_biallelic

##############

##############
#STEP 2
##############

#randomly sample unlinked SNPs (single SNP per RAD locus)
#use R script unlink_snps_vcf.R

##############


##############
#STEP 3
##############

#use plink2 to convert to a plink bed format
#--double-id because we have single sequence for RAD loci -- use the name twice
#--allow-extra-chr ignore chromosome config
#--make-bed makes a bed file
plink2 --vcf linked_biallelic.recode.vcf --double-id --allow-extra-chr --make-bed --out fs_infile_linked_biallelic

plink2 --vcf unlinked_biallelic_rep1.vcf --double-id --allow-extra-chr --make-bed --out fs_infile_unlinked_biallelic_rep1
plink2 --vcf unlinked_biallelic_rep2.vcf --double-id --allow-extra-chr --make-bed --out fs_infile_unlinked_biallelic_rep2
plink2 --vcf unlinked_biallelic_rep3.vcf --double-id --allow-extra-chr --make-bed --out fs_infile_unlinked_biallelic_rep3
plink2 --vcf unlinked_biallelic_rep4.vcf --double-id --allow-extra-chr --make-bed --out fs_infile_unlinked_biallelic_rep4
plink2 --vcf unlinked_biallelic_rep5.vcf --double-id --allow-extra-chr --make-bed --out fs_infile_unlinked_biallelic_rep5


##############

##############
#STEP 3.1 (setting up conda environment; skip if done already)
##############

#activate the conda environment set up (with python2 as default python)
conda activate faststructure

#install faststructure using conda
#first, add necessary channels
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

#then, install faststructure
#this ensures all the dependencies are installed and are the correct versions, etc.
conda install -c bioconda faststructure

#next, just clone the faststructure repo
git clone https://github.com/rajanil/fastStructure

#in /vars, build library extensions
python setup.py build_ext --inplace

#in the fastStructure main directory, compile main cython scripts
python setup.py build_ext --inplace
##############


##############
#STEP 4
##############
conda activate faststructure

#run faststructure for k values 1-10 on unlinked biallelic snps
#CLEAN THIS UP LATER -- SIMPLE BASH FOR LOOP WOULD WORK GREAT
python /Users/bejo/programs/fastStructure/structure.py -K 1 --input=infiles_unlinked/fs_infile_unlinked_biallelic_rep1 --output=outfiles_unlinked_seed2/unlinked_seed2 --full --seed=27537
python /Users/bejo/programs/fastStructure/structure.py -K 2 --input=infiles_unlinked/fs_infile_unlinked_biallelic_rep1 --output=outfiles_unlinked_seed2/unlinked_seed2 --full --seed=27537
python /Users/bejo/programs/fastStructure/structure.py -K 3 --input=infiles_unlinked/fs_infile_unlinked_biallelic_rep1 --output=outfiles_unlinked_seed2/unlinked_seed2 --full --seed=27537
python /Users/bejo/programs/fastStructure/structure.py -K 4 --input=infiles_unlinked/fs_infile_unlinked_biallelic_rep1 --output=outfiles_unlinked_seed2/unlinked_seed2 --full --seed=27537
python /Users/bejo/programs/fastStructure/structure.py -K 5 --input=infiles_unlinked/fs_infile_unlinked_biallelic_rep1 --output=outfiles_unlinked_seed2/unlinked_seed2 --full --seed=27537
python /Users/bejo/programs/fastStructure/structure.py -K 6 --input=infiles_unlinked/fs_infile_unlinked_biallelic_rep1 --output=outfiles_unlinked_seed2/unlinked_seed2 --full --seed=27537
python /Users/bejo/programs/fastStructure/structure.py -K 7 --input=infiles_unlinked/fs_infile_unlinked_biallelic_rep1 --output=outfiles_unlinked_seed2/unlinked_seed2 --full --seed=27537
python /Users/bejo/programs/fastStructure/structure.py -K 8 --input=infiles_unlinked/fs_infile_unlinked_biallelic_rep1 --output=outfiles_unlinked_seed2/unlinked_seed2 --full --seed=27537
python /Users/bejo/programs/fastStructure/structure.py -K 9 --input=infiles_unlinked/fs_infile_unlinked_biallelic_rep1 --output=outfiles_unlinked_seed2/unlinked_seed2 --full --seed=27537
python /Users/bejo/programs/fastStructure/structure.py -K 10 --input=infiles_unlinked/fs_infile_unlinked_biallelic_rep1 --output=outfiles_unlinked_seed2/unlinked_seed2 --full --seed=27537

1234
27537
31753
8296
11243


#parse through runs and provide range of values most appropriate for the dataset
python /Users/bejo/programs/fastStructure/chooseK.py --input=outfiles_unlinked_seed2/unlinked_rep1
#Model complexity that maximizes marginal likelihood = 2
#Model components used to explain structure in data = 3


#visualize admixture proportions
#using distruct v 2.3 (Chhatre 2018, Raj et al. 2014)
#URL:https://vc.popgen.org/software/distruct/

cd ~/Desktop/running_faststructure
python distruct2.3.py -K 2 --input=outfiles_unlinked_seed1/unlinked_rep1 --output=outfiles_unlinked_seed1/distruct_K2_rep1 --title="K = 2" --popfile=popfile_faststructure.txt --poporder=poporder_faststructure.txt
python distruct2.3.py -K 3 --input=outfiles_unlinked_seed1/unlinked_rep1 --output=outfiles_unlinked_seed1/distruct_K3_rep1 --title="K = 3" --popfile=popfile_faststructure.txt --poporder=poporder_faststructure.txt
python distruct2.3.py -K 4 --input=outfiles_unlinked_seed1/unlinked_rep1 --output=outfiles_unlinked_seed1/distruct_K4_rep1 --title="K = 4" --popfile=popfile_faststructure.txt --poporder=poporder_faststructure.txt











