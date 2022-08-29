##############
#PRELIMINARY STEP
##############

#use vcftools to generate vcf with only biallelic snps (from appropriate varietal directory)
../vcftools-vcftools-581c231/src/cpp/./vcftools --vcf dfs_menziesii_paramsfile.vcf --min-alleles 2 --max-alleles 2 --recode --out linked_biallelic_menziesii
../vcftools-vcftools-581c231/src/cpp/./vcftools --vcf dfs_praeteritus_paramsfile.vcf --min-alleles 2 --max-alleles 2 --recode --out linked_biallelic_praeteritus
../vcftools-vcftools-581c231/src/cpp/./vcftools --vcf dfs_scouleri_paramsfile.vcf --min-alleles 2 --max-alleles 2 --recode --out linked_biallelic_scouleri
../vcftools-vcftools-581c231/src/cpp/./vcftools --vcf dfs_serratus_paramsfile.vcf --min-alleles 2 --max-alleles 2 --recode --out linked_biallelic_serratus

##############

##############
#STEP 1
##############

#randomly sample unlinked SNPs (single SNP per RAD locus)
#use R script unlink_snps_DFS_vcf.R

##############



##############
#STEP 2
##############

#Create GENO files from VCF files

#set temporary path so all libraries can be found in python
export PYTHONPATH=$PYTHONPATH:/Users/bejo/programs/python_libs/genomics_general

#make repository dir
mkdir 2_genos

#use parseVCF python script from Martin et al. 
python parseVCF.py -i 1_vcfs/unlinked_biallelic_menziesii.recode.vcf --skipIndels --gtf flag=DP min=8 -o 2_genos/menziesii.geno.gz
python parseVCF.py -i 1_vcfs/unlinked_biallelic_praeteritus.recode.vcf --skipIndels --gtf flag=DP min=8 -o 2_genos/praeteritus.geno.gz
python parseVCF.py -i 1_vcfs/unlinked_biallelic_scouleri.recode.vcf --skipIndels --gtf flag=DP min=8 -o 2_genos/scouleri.geno.gz
python parseVCF.py -i 1_vcfs/unlinked_biallelic_serratus.recode.vcf --skipIndels --gtf flag=DP min=8 -o 2_genos/serratus.geno.gz

##############


##############
#STEP 3
##############

#make respository
mkdir 3_basecounts

#compute allele frequencies at each site in each population
#requires population file -- first column = sample name, second = population name

python2 freq.py --threads 2 -g 2_genos/praeteritus.geno.gz -p outgroup -p davidsonii -p fruticosus -p praeteritus --popsFile popsfiles/popsfile_praeteritus.txt | gzip > 3_basecounts/praeteritus.basecounts.tsv.gz
python2 freq.py --threads 2 -g 2_genos/menziesii.geno.gz -p outgroup -p davidsonii -p fruticosus -p menziesii --popsFile popsfiles/popsfile_menziesii.txt | gzip > 3_basecounts/menziesii.basecounts.tsv.gz
python2 freq.py --threads 2 -g 2_genos/scouleri.geno.gz -p outgroup -p davidsonii -p fruticosus -p scouleri --popsFile popsfiles/popsfile_scouleri.txt | gzip > 3_basecounts/scouleri.basecounts.tsv.gz
python2 freq.py --threads 2 -g 2_genos/serratus.geno.gz -p outgroup -p davidsonii -p fruticosus -p serratus --popsFile popsfiles/popsfile_serratus.txt | gzip > 3_basecounts/serratus.basecounts.tsv.gz

##############


##############
#STEP 4
##############

#produce SFS files
#subsample the data down to haplotypes. Useful for large sample size but lots of missing data
#SFS must have the same number of samples for P1 and P2 (here haploid counts, davidsonii == 50 and fruticosus == 104)
#other data: praet = 26, menz = 20, scoul = 20, serr = 6
#use subsample_sfs_loop.sh script

bash subsample_sfs_loop.sh

##############


##############
#STEP 5
##############
#calculate the Dfs from the SFS file, using R script plot_DFS_from_SFS.R






