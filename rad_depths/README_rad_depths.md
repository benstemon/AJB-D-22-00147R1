## RAD depth summaries
In this directory are scripts and output used to estimate sequencing depth for individuals and loci. There are three subdirectories, one R script, and two .vcf files:

### [calcdepth_dfs_](calcdepth_dfs_/)
Contains outfiles (.idepth and .ldepth.mean) generated from vcftools necessary to produce plots. These were generated from each of the .vcf files used in the DFS analyses. Those files can be found in [`../making_DFS/1_vcfs/`](../making_DFS/1_vcfs/). Commands used are as follows:

``
module load vctools

for i in *.vcf
do
 infile=$i
 inname="${infile/unlinked_biallelic_/}"; inname="${inname/.recode.vcf/}"
 vcftools --vcf $infile --depth --out depth_$inname.txt
 vcftools --vcf $infile --site-depth --out depth_$inname.txt
 vcftools --vcf $infile --site-mean-depth --out depth_$inname.txt
done

mkdir calcdepth_dfs
mv depth_* calcdepth_dfs
``

### [calcdepth_faststructure](calcdepth_faststructure/)
Contains outfiles (.idepth and .ldepth.mean) generated from vcftools necessary to produce plots. These were generated from each of the .vcf files used in the faststructure analyses. Those files can be found in [`../running_faststructure_/infiles_unlinked/`](../running_faststructure_/infiles_unlinked/). Commands used are as follows:

``
module load vcftools

for i in *.vcf
do
 infile=$i
 inname="${infile/unlinked_biallelic_/}"; inname="${inname/.vcf/}"
 vcftools --vcf $infile --depth --out depth_$inname.txt
 vcftools --vcf $infile --site-depth --out depth_$inname.txt
 vcftools --vcf $infile --site-mean-depth --out depth_$inname.txt
done

mkdir calcdepth_faststructure
mv depth_* calcdepth_faststructure
``


### [calcdepth_hyde_svdq](calcdepth_hyde_svdq/)
Contains outfiles (.idepth and .ldepth.mean) generated from vcftools necessary to produce plots. These were generated from each of the .vcf files used in the hyde and SVDQuartets analyses. Those files can be found in this subdirectory as `hyde.vcf` and `svdq.vcf`. Commands used are as follows:

``
module load vcfools

for i in *.vcf
do
 infile=$i
 inname="${infile/.vcf/}"
 vcftools --vcf $infile --depth --out depth_$inname.txt
 vcftools --vcf $infile --site-depth --out depth_$inname.txt
 vcftools --vcf $infile --site-mean-depth --out depth_$inname.txt
done

mkdir calcdepth_hyde_svdq
mv depth_* calcdepth_hyde_svdq
``

### Generating plots
Plots of mean depth per individual and locus can be generated using `make_depth_plots_radseq.R`. These will generate plots that were ultimately published as supplementary material for this project.

