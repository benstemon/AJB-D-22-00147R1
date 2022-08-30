## DFS analysis
This directory contains files necessary to estimate Dfs (Martin & Amos 2021). In this directory there are 6 subdirectories:


### [1_vcfs](1_vcfs/)
All files here are the result of initial vcf filtering steps. All files beginning with "linked" are files generated from filtering initial .vcf files (from ipyrad) with vcftools to retain only biallelic SNPs.

``
#use vcftools to generate vcf with only biallelic snps (from appropriate varietal directory)
../vcftools-vcftools-581c231/src/cpp/./vcftools --vcf dfs_menziesii_paramsfile.vcf --min-alleles 2 --max-alleles 2 --recode --out linked_biallelic_menziesii
../vcftools-vcftools-581c231/src/cpp/./vcftools --vcf dfs_praeteritus_paramsfile.vcf --min-alleles 2 --max-alleles 2 --recode --out linked_biallelic_praeteritus
../vcftools-vcftools-581c231/src/cpp/./vcftools --vcf dfs_scouleri_paramsfile.vcf --min-alleles 2 --max-alleles 2 --recode --out linked_biallelic_scouleri
../vcftools-vcftools-581c231/src/cpp/./vcftools --vcf dfs_serratus_paramsfile.vcf --min-alleles 2 --max-alleles 2 --recode --out linked_biallelic_serratus
``

* `linked_biallelic_menziesii.recode.vcf`
* `linked_biallelic_praeteritus.recode.vcf`
* `linked_biallelic_scouleri.recode.vcf`
* `linked_biallelic_serratus.recode.vcf`

These linked SNPs files were then randomly sampled for unlinked SNPs using [`scripts/unlink_snps_DFS_vcf.R`](scripts/unlink_snps_DFS_vcf.R). This created all files starting with "unlinked".
* `unlinked_biallelic_menziesii.recode.vcf`
* `unlinked_biallelic_praeteritus.recode.vcf`
* `unlinked_biallelic_scouleri.recode.vcf`
* `unlinked_biallelic_serratus.recode.vcf`


### [2_genos](2_genos/)
Contains four files, which are effectively intermediate files in the creation of Dfs:
* `menziesii.geno.gz`
* `praeteritus.geno.gz`
* `scouleri.geno.gz`
* `serratus.geno.gz`
Created using the following commands:

``
#Create GENO files from VCF files

#set temporary path so all libraries can be found in python
export PYTHONPATH=$PYTHONPATH:/Users/Ben/programs/python_libs/genomics_general

#make repository dir
mkdir 2_genos

#use parseVCF python script from Martin et al. 
python parseVCF.py -i 1_vcfs/unlinked_biallelic_menziesii.recode.vcf --skipIndels --gtf flag=DP min=8 -o 2_genos/menziesii.geno.gz
python parseVCF.py -i 1_vcfs/unlinked_biallelic_praeteritus.recode.vcf --skipIndels --gtf flag=DP min=8 -o 2_genos/praeteritus.geno.gz
python parseVCF.py -i 1_vcfs/unlinked_biallelic_scouleri.recode.vcf --skipIndels --gtf flag=DP min=8 -o 2_genos/scouleri.geno.gz
python parseVCF.py -i 1_vcfs/unlinked_biallelic_serratus.recode.vcf --skipIndels --gtf flag=DP min=8 -o 2_genos/serratus.geno.gz
``


### [popsfiles](popsfiles/)
Contains four files, which are used in the creation of basecounts during construction of the site frequency spectrum for Dfs. These files are maps linking the sequence name to the population.
* `popsfile_menziesii.txt`
* `popsfile_praeteritus.txt`
* `popsfile_scouleri.txt`
* `popsfile_serratus.txt`


### [3_basecounts](3_basecounts/)
Contains four files, which are effectively intermediate files in the creation of Dfs:
* `menziesii.basecounts.tsv.gz`
* `praeteritus.basecounts.tsv.gz`
* `scouleri.basecounts.tsv.gz`
* `serratus.basecounts.tsv.gz`

Created using the following commands:

``
#Make repository
mkdir 3_basecounts

#compute allele frequencies at each site in each population
#requires population file -- first column = sample name, second = population name

python2 freq.py --threads 2 -g 2_genos/praeteritus.geno.gz -p outgroup -p davidsonii -p fruticosus -p praeteritus --popsFile popsfiles/popsfile_praeteritus.txt | gzip > 3_basecounts/praeteritus.basecounts.tsv.gz
python2 freq.py --threads 2 -g 2_genos/menziesii.geno.gz -p outgroup -p davidsonii -p fruticosus -p menziesii --popsFile popsfiles/popsfile_menziesii.txt | gzip > 3_basecounts/menziesii.basecounts.tsv.gz
python2 freq.py --threads 2 -g 2_genos/scouleri.geno.gz -p outgroup -p davidsonii -p fruticosus -p scouleri --popsFile popsfiles/popsfile_scouleri.txt | gzip > 3_basecounts/scouleri.basecounts.tsv.gz
python2 freq.py --threads 2 -g 2_genos/serratus.geno.gz -p outgroup -p davidsonii -p fruticosus -p serratus --popsFile popsfiles/popsfile_serratus.txt | gzip > 3_basecounts/serratus.basecounts.tsv.gz
``

### [4_outputs](4_outputs/)
Contains four subdirectories:
* `sfs_menziesii_10s`
	* `D_menziesii.txt`
	* `dfs_menziesii.csv`
	* `dfs_menziesii.pdf`
	* `rep_1_davidsonii_menziesii_fruticosus.sfs`
* `sfs_praeteritus_10s`
	* `D_praeteritus.txt`
	* `dfs_praeteritus.csv`
	* `dfs_praeteritus.pdf`
	* `rep_1_fruticosus_praeteritus_davidsonii.sfs`
* `sfs_scouleri_10s`
	* `D_scouleri.txt`
	* `dfs_scouleri.csv`
	* `dfs_scouleri.pdf`
	* `rep_1_fruticosus_scouleri_davidsonii.sfs`
* `sfs_serratus_10s`
	* `D_serratus.txt`
	* `dfs_serratus.csv`
	* `dfs_serratus.pdf`
	* `rep_1_fruticosus_serratus_davidsonii.sfs`

All of the .sfs files are the result of using the script `subsample_sfs_loop.sh`, which can be found in the [scripts](scripts/) directory. Use of that script is as follows:

``
#produce SFS files
#subsample the data down to haplotypes. Useful for large sample size but lots of missing data
#SFS must have the same number of samples for P1 and P2 (here haploid counts, davidsonii == 50 and fruticosus == 104)
#other data: praet = 26, menz = 20, scoul = 20, serr = 6
#use subsample_sfs_loop.sh script

bash subsample_sfs_loop.sh
``

The .csv, .txt, and .pdf files are final output from the use of the script `plot_Dfs_10s.R`, found in [scripts](scripts/).


### [scripts](scripts/)
This directory contains all scripts used for the generation and visualization of Dfs. Files and directory structure are as follows:
* `unlink_snps_DFS_vcf.R`. Used after biallelic SNPs are produced with vcftools to sample a single SNP per RADtag. Generates "unlinked" files found in `1_vcfs/`
* `MartinAmos_scripts`. This directory contains scripts not written by the author, but are essential to construction of the Dfs.
	* `parseVCF.py`. Used to generate genotype files found in `2_genos/`
	* `freq.py`. Used to compute allele frequencies and generate files found in `3_basecounts/`
	* `sfs.py`. Used to construct .sfs files found in `4_outputs/`
* `subsample_10_sfs_loop.sh`. Used to subsample individuals to produce the SFS. 
* `plot_Dfs_10s.R`. Used in the final stage to produce estimates of Dfs and plot results.


