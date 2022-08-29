library(data.table)
library(dplyr)

setwd('~/Desktop/1_vcfs')

#read in data
infile <- list.files(getwd())

for (i in 1:length(infile)){
  outfile <- fread(infile[i]) %>%
    group_by(`#CHROM`) %>%
    do(sample_n(.,1))
  
  write.table(outfile, file = paste('un',infile[i], sep = ''),
              sep = '\t', row.names = F, quote = F)
}
