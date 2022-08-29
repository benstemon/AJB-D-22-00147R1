#make the Dfs from Martin and Amos 2020

#source the DFS.R functions from Martin & Amos 2020
basedir <- '~/Desktop/';setwd(basedir)
source('dfs/DFS.R')

#Haploid sample sizes for:
praethap = 10 #praeteritus
menzhap = 10 #menziesii
scoulhap = 10 #scouleri
serrhap = 6 #serratus
davidhap = 10 #davidsonii
fruthap = 10

#praeteritus
##############################################################################
#make matrices for output

#import frequency spectrum files
fs <- read.table(paste(basedir, 'sfs_praeteritus_10s/rep_1_fruticosus_praeteritus_davidsonii.sfs', sep = ''))
#construct dfs
dfs <- get.DFS(base_counts = fs[,1:3],
               site_counts = fs[,4],
               Ns = c(praethap, praethap, davidhap))
#write dfs information to respective tables
write.csv(dfs[,1:2], file = 'dfs_praeteritus.csv')

#make Dfs plot
pdf('dfs_praeteritus.pdf')
plotDFS(dfs$DFS, dfs$weights, method = 'lines', col_D = 'red', no_xlab = F)
dev.off()

#save estimate of D from base counts
write.table(get.D.from.base.counts(base_counts = fs[,1:3],
                                   site_counts = fs[,4],
                                   Ns = c(praethap, praethap, davidhap)),
            file = 'D_praeteritus.txt')
##############################################################################


#serratus
##############################################################################
#make matrices for output

#import frequency spectrum files
fs <- read.table(paste(basedir, 'sfs_serratus_10s/rep_1_fruticosus_serratus_davidsonii.sfs', sep = ''))
#construct dfs
dfs <- get.DFS(base_counts = fs[,1:3],
               site_counts = fs[,4],
               Ns = c(serrhap, serrhap, davidhap))
#write dfs information to respective tables
write.csv(dfs[,1:2], file = 'dfs_serratus.csv')

#make Dfs plot
pdf('dfs_serratus.pdf')
plotDFS(dfs$DFS, dfs$weights, method = 'lines', col_D = 'red', no_xlab = F)
dev.off()

#save estimate of D from base counts
write.table(get.D.from.base.counts(base_counts = fs[,1:3],
                                   site_counts = fs[,4],
                                   Ns = c(serrhap, serrhap, davidhap)),
            file = 'D_serratus.txt')
##############################################################################


#scouleri
##############################################################################
#make matrices for output

#import frequency spectrum files
fs <- read.table(paste(basedir, 'sfs_scouleri_10s/rep_1_fruticosus_scouleri_davidsonii.sfs', sep = ''))
#construct dfs
dfs <- get.DFS(base_counts = fs[,1:3],
               site_counts = fs[,4],
               Ns = c(scoulhap, scoulhap, davidhap))
#write dfs information to respective tables
write.csv(dfs[,1:2], file = 'dfs_scouleri.csv')

#make Dfs plot
pdf('dfs_scouleri.pdf')
plotDFS(dfs$DFS, dfs$weights, method = 'lines', col_D = 'red', no_xlab = F)
dev.off()

#save estimate of D from base counts
write.table(get.D.from.base.counts(base_counts = fs[,1:3],
                                   site_counts = fs[,4],
                                   Ns = c(scoulhap, scoulhap, davidhap)),
            file = 'D_scouleri.txt')
##############################################################################

#menziesii
##############################################################################
#make matrices for output

#import frequency spectrum files
fs <- read.table(paste(basedir, 'sfs_menziesii_10s/rep_1_davidsonii_menziesii_fruticosus.sfs', sep = ''))
#construct dfs
dfs <- get.DFS(base_counts = fs[,1:3],
               site_counts = fs[,4],
               Ns = c(menzhap, menzhap, fruthap))
#write dfs information to respective tables
write.csv(dfs[,1:2], file = 'dfs_menziesii.csv')

#make Dfs plot
pdf('dfs_menziesii.pdf')
plotDFS(dfs$DFS, dfs$weights, method = 'lines', col_D = 'red', no_xlab = F)
dev.off()

#save estimate of D from base counts
write.table(get.D.from.base.counts(base_counts = fs[,1:3],
                                   site_counts = fs[,4],
                                   Ns = c(menzhap, menzhap, fruthap)),
            file = 'D_menziesii.txt')
##############################################################################


