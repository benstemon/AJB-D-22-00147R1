library(tidyverse)
library(plyr)
setwd('~/Desktop/rad_depths/')

#####
#DFS MENZIESII
#####
##############################
ind_infile <- read.delim(file = 'calcdepth_dfs/depth_menziesii.txt.idepth')
loc_infile <- read.delim(file = 'calcdepth_dfs/depth_menziesii.txt.ldepth.mean')

max_scale_ind <- round_any(max(ind_infile$MEAN_DEPTH), 100, f = ceiling)
max_scale_loc <- round_any(max(loc_infile$MEAN_DEPTH), 100, f = ceiling)

#individual depth
pdf("depth_dfs_menziesii.pdf")
print(
ggplot(ind_infile, mapping = aes(x = MEAN_DEPTH)) +
  geom_histogram(binwidth = 50, boundary = 0, colour = "black") +
  coord_cartesian(xlim=c(0,max_scale_ind), ylim = c(0,15)) +
  scale_y_continuous(breaks = seq(0,14,2)) +
  scale_x_continuous(breaks = seq(0,max_scale_ind,100)) + 
  theme_bw() +
  xlab("Mean Depth") +
  ylab("Count (number of individuals)") +
  ggtitle("Individual depth: dfs menziesii")
)


#Mean locus depth
print(
ggplot(loc_infile, mapping = aes(x = MEAN_DEPTH)) +
  geom_histogram(binwidth = 200, boundary = 0, colour = "black") +
  coord_cartesian(xlim=c(0,max_scale_loc), ylim = c(0,2500)) +
  scale_y_continuous(breaks = seq(0,2500,500)) +
  scale_x_continuous(breaks = seq(0,max_scale_loc,2000)) + 
  theme_bw() +
  xlab("Mean Depth") +
  ylab("Count (number of loci)") +
  ggtitle("Locus depth: dfs menziesii")
)
dev.off()
##############################

#####
#DFS SCOULERI
#####
##############################
ind_infile <- read.delim(file = 'calcdepth_dfs/depth_scouleri.txt.idepth')
loc_infile <- read.delim(file = 'calcdepth_dfs/depth_scouleri.txt.ldepth.mean')

max_scale_ind <- round_any(max(ind_infile$MEAN_DEPTH), 100, f = ceiling)
max_scale_loc <- round_any(max(loc_infile$MEAN_DEPTH), 100, f = ceiling)

#individual depth
pdf('depth_dfs_scouleri.pdf')
print(
ggplot(ind_infile, mapping = aes(x = MEAN_DEPTH)) +
  geom_histogram(binwidth = 50, boundary = 0, colour = "black") +
  coord_cartesian(xlim=c(0,max_scale_ind), ylim = c(0,15)) +
  scale_y_continuous(breaks = seq(0,14,2)) +
  scale_x_continuous(breaks = seq(0,max_scale_ind,100)) + 
  theme_bw() +
  xlab("Mean Depth") +
  ylab("Count (number of individuals)") +
  ggtitle("Individual depth: dfs scouleri")
)

#Mean locus depth
print(
ggplot(loc_infile, mapping = aes(x = MEAN_DEPTH)) +
  geom_histogram(binwidth = 200, boundary = 0, colour = "black") +
  coord_cartesian(xlim=c(0,max_scale_loc), ylim = c(0,2500)) +
  scale_y_continuous(breaks = seq(0,2500,500)) +
  scale_x_continuous(breaks = seq(0,max_scale_loc,2000)) + 
  theme_bw() +
  xlab("Mean Depth") +
  ylab("Count (number of loci)") +
  ggtitle("Locus depth: dfs scouleri")
)
dev.off()
##############################


#####
#DFS PRAETERITUS
#####
##############################
ind_infile <- read.delim(file = 'calcdepth_dfs/depth_praeteritus.txt.idepth')
loc_infile <- read.delim(file = 'calcdepth_dfs/depth_praeteritus.txt.ldepth.mean')

max_scale_ind <- round_any(max(ind_infile$MEAN_DEPTH), 100, f = ceiling)
max_scale_loc <- round_any(max(loc_infile$MEAN_DEPTH), 100, f = ceiling)

#individual depth
pdf('depth_dfs_praeteritus.pdf')
print(
ggplot(ind_infile, mapping = aes(x = MEAN_DEPTH)) +
  geom_histogram(binwidth = 50, boundary = 0, colour = "black") +
  coord_cartesian(xlim=c(0,max_scale_ind), ylim = c(0,15)) +
  scale_y_continuous(breaks = seq(0,14,2)) +
  scale_x_continuous(breaks = seq(0,max_scale_ind,100)) + 
  theme_bw() +
  xlab("Mean Depth") +
  ylab("Count (number of individuals)") +
  ggtitle("Individual depth: dfs praeteritus")
)
#Mean locus depth
print(
ggplot(loc_infile, mapping = aes(x = MEAN_DEPTH)) +
  geom_histogram(binwidth = 200, boundary = 0, colour = "black") +
  coord_cartesian(xlim=c(0,max_scale_loc), ylim = c(0,2500)) +
  scale_y_continuous(breaks = seq(0,2500,500)) +
  scale_x_continuous(breaks = seq(0,max_scale_loc,2000)) + 
  theme_bw() +
  xlab("Mean Depth") +
  ylab("Count (number of loci)") +
  ggtitle("Locus depth: dfs prateritus")
)
dev.off()
##############################



#####
#FASTSTRUCTURE
#####
##############################
pdf('depth_faststructure.pdf')
for (i in 1:5){
  ind_infile <- read.delim(file = paste('calcdepth_faststructure/depth_rep',i,'.txt.idepth', sep=''))
  loc_infile <- read.delim(file = paste('calcdepth_faststructure/depth_rep',i,'.txt.ldepth.mean', sep=''))
  
  max_scale_ind <- round_any(max(ind_infile$MEAN_DEPTH), 100, f = ceiling)
  max_scale_loc <- round_any(max(loc_infile$MEAN_DEPTH), 100, f = ceiling)
  
  #individual depth
  print(
  ggplot(ind_infile, mapping = aes(x = MEAN_DEPTH)) +
    geom_histogram(binwidth = 50, boundary = 0, colour = "black") +
    coord_cartesian(xlim=c(0,max_scale_ind), ylim = c(0,20)) +
    scale_y_continuous(breaks = seq(0,20,2)) +
    scale_x_continuous(breaks = seq(0,max_scale_ind,100)) + 
    theme_bw() +
    xlab("Mean Depth") +
    ylab("Count (number of individuals)") +
    ggtitle(paste("Individual depth: faststructure rep ",i, sep=''))
  )
  #Mean locus depth
  print(
  ggplot(loc_infile, mapping = aes(x = MEAN_DEPTH)) +
    geom_histogram(binwidth = 200, boundary = 0, colour = "black") +
    coord_cartesian(xlim=c(0,max_scale_loc), ylim = c(0,2500)) +
    scale_y_continuous(breaks = seq(0,2500,500)) +
    scale_x_continuous(breaks = seq(0,max_scale_loc,200)) + 
    theme_bw() +
    xlab("Mean Depth") +
    ylab("Count (number of loci)") +
    ggtitle(paste("Locus depth: faststructure rep ",i, sep=''))
  )
}
dev.off()
##############################




#####
#DFS HYDE
#####
##############################
ind_infile <- read.delim(file = 'calcdepth_hyde_svdq/depth_hyde.txt.idepth')
loc_infile <- read.delim(file = 'calcdepth_hyde_svdq/depth_hyde.txt.ldepth.mean')

max_scale_ind <- round_any(max(ind_infile$MEAN_DEPTH), 100, f = ceiling)
max_scale_loc <- round_any(max(loc_infile$MEAN_DEPTH), 100, f = ceiling)

#individual depth
pdf('depth_hyde.pdf')
print(
ggplot(ind_infile, mapping = aes(x = MEAN_DEPTH)) +
  geom_histogram(binwidth = 50, boundary = 0, colour = "black") +
  coord_cartesian(xlim=c(0,max_scale_ind), ylim = c(0,16)) +
  scale_y_continuous(breaks = seq(0,16,2)) +
  scale_x_continuous(breaks = seq(0,max_scale_ind,100)) + 
  theme_bw() +
  xlab("Mean Depth") +
  ylab("Count (number of individuals)") +
  ggtitle("Individual depth: HyDe")
)

#Mean locus depth
print(
ggplot(loc_infile, mapping = aes(x = MEAN_DEPTH)) +
  geom_histogram(binwidth = 200, boundary = 0, colour = "black") +
  coord_cartesian(xlim=c(0,max_scale_loc), ylim = c(0,10000)) +
  scale_y_continuous(breaks = seq(0,10000,500)) +
  scale_x_continuous(breaks = seq(0,max_scale_loc,500)) + 
  theme_bw() +
  xlab("Mean Depth") +
  ylab("Count (number of loci)") +
  ggtitle("Locus depth: HyDe")
)
dev.off()
##############################



#####
#DFS SVDQ
#####
##############################
ind_infile <- read.delim(file = 'calcdepth_hyde_svdq/depth_svdq.txt.idepth')
loc_infile <- read.delim(file = 'calcdepth_hyde_svdq/depth_svdq.txt.ldepth.mean')

max_scale_ind <- round_any(max(ind_infile$MEAN_DEPTH), 100, f = ceiling)
max_scale_loc <- round_any(max(loc_infile$MEAN_DEPTH), 100, f = ceiling)

#individual depth
pdf('depth_svdq.pdf')
print(
ggplot(ind_infile, mapping = aes(x = MEAN_DEPTH)) +
  geom_histogram(binwidth = 50, boundary = 0, colour = "black") +
  coord_cartesian(xlim=c(0,max_scale_ind), ylim = c(0,24)) +
  scale_y_continuous(breaks = seq(0,24,2)) +
  scale_x_continuous(breaks = seq(0,max_scale_ind,100)) + 
  theme_bw() +
  xlab("Mean Depth") +
  ylab("Count (number of individuals)") +
  ggtitle("Individual depth: SVDQuartets")
)

#Mean locus depth
print(
ggplot(loc_infile, mapping = aes(x = MEAN_DEPTH)) +
  geom_histogram(binwidth = 200, boundary = 0, colour = "black") +
  coord_cartesian(xlim=c(0,max_scale_loc), ylim = c(0,12000)) +
  scale_y_continuous(breaks = seq(0,12000,500)) +
  scale_x_continuous(breaks = seq(0,max_scale_loc,2000)) + 
  theme_bw() +
  xlab("Mean Depth") +
  ylab("Count (number of loci)") +
  ggtitle("Locus depth: SVDQuartets")
)
dev.off()
##############################