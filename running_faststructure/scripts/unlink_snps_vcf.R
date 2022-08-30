library(data.table)
library(dplyr)

setwd('~/Desktop')

#read in data
infile <- fread('linked_biallelic.recode.vcf')


#for loop for multiple reps
for (i in 1:5){
  #dplyr to filter for only one row per ID
  outfile <- infile %>% 
    group_by(`#CHROM`) %>% 
    do(sample_n(.,1))
  
  #write the vcf file (without header)
  write.table(outfile, file = paste('unlinked_biallelic_rep',i,'.vcf', sep = ''),
              sep = '\t', row.names = F, quote = F)
}



#without for loop:

#outfile <- infile %>% 
#  group_by(`#CHROM`) %>% 
#  do(sample_n(.,1))
#
#
#write.table(outfile, file = 'unlinked_nobiallelic_rep5.vcf',
#            sep = '\t', row.names = F, quote = F)