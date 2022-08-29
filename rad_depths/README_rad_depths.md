module load vctools


####
#dfs infiles
####
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


scp -r unity:/fs/project/wolfe.205/stone.494/project_davidsonii_x_fruticosus/infiles_dfs/calcdepth_dfs /home/stone.494



####
#faststructure infiles
####
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

scp -r unity:/fs/project/wolfe.205/stone.494/project_davidsonii_x_fruticosus/infiles_faststructure/calcdepth_faststructure /home/stone.494



####
#hyde and svdq infiles
####
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

scp -r unity:/fs/project/wolfe.205/stone.494/project_davidsonii_x_fruticosus/infiles_hyde_svdq/calcdepth_hyde_svdq /home/stone.494







