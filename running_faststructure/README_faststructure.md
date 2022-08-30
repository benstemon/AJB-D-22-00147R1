## Faststructure analyses
In this directory are all input and scripts needed to reproduce faststructure analyses. Additionally, all relevant output associated with these analyses for input into CLUMPAK are included.


### [infiles_linked](infiles_linked/)
* `linked_biallelic.recode.vcf`. This file contains linked, biallelic SNPS used as initial input.


### [infiles_unlinked](infiles_unlinked/)
This directory contains 5 replicates of randomly selected unlinked SNPs, produced from `scripts/unlink_snps_vcf.R`.
* `unlinked_biallelic_rep1.vcf`
* `unlinked_biallelic_rep2.vcf`
* `unlinked_biallelic_rep3.vcf`
* `unlinked_biallelic_rep4.vcf`
* `unlinked_biallelic_rep5.vcf`

These files are then used as input into plink2 to convert to plink bed format. This produces the remainder of files in this directory, for each replicate data set (.bed, .bim, .fam, and .log files). Commands to produce these files are as follows (after installing plink2):


```
#use plink2 to convert to a plink bed format
#--double-id because we have single sequence for RAD loci -- use the name twice
#--allow-extra-chr ignore chromosome config
#--make-bed makes a bed file

plink2 --vcf unlinked_biallelic_rep1.vcf --double-id --allow-extra-chr --make-bed --out fs_infile_unlinked_biallelic_rep1

plink2 --vcf unlinked_biallelic_rep2.vcf --double-id --allow-extra-chr --make-bed --out fs_infile_unlinked_biallelic_rep2

plink2 --vcf unlinked_biallelic_rep3.vcf --double-id --allow-extra-chr --make-bed --out fs_infile_unlinked_biallelic_rep3

plink2 --vcf unlinked_biallelic_rep4.vcf --double-id --allow-extra-chr --make-bed --out fs_infile_unlinked_biallelic_rep4

plink2 --vcf unlinked_biallelic_rep5.vcf --double-id --allow-extra-chr --make-bed --out fs_infile_unlinked_biallelic_rep5
```


### [outfiles_unlinked](outfiles_unlinked/)
In this directory are outfiles produced from running faststructure. This software was ultimately run for each replicate using a bash script found at `scripts/loop_faststructure.sh`. Using `bash ../scripts/loop_faststructure.sh` after ensuring paths in that script are set correctly will produce:
* `rep1.zip`
* `rep2.zip`
* `rep3.zip`
* `rep4.zip`
* `rep5.zip`

These files, in tandem with other user-generated files in `distruct_files/` can be used as input for CLUMPAK (http://clumpak.tau.ac.il/) to produce plots and summarize output.


### [distruct_files](distruct_files/)
In this directory are files used as additional input for plotting and summarizing using the CLUMPAK server. The files are:
* `indfile_faststructure.txt`. Names of all individuals in the analysis.
* `labelfile.txt`. Names and order of populations for individual rearrangement on plot.
* `popcolors.txt`. The colors of population clusters.
* `popfile_faststructure.txt`. File assigning individuals to populations for rearrangement on the plot.


### [scripts](scripts/)
This directory contains two scripts essential for analyses:
* `unlink_snps_vcf.R`. Used to randomly select a single SNP per RADtag (produces files in `infiles_unlinked/`).
* `loop_faststructure.sh`. A for loop in bash used to run faststructure on each of the replicate data sets. Produces files in `outfiles_unlinked/`.


