setwd('~/Desktop/WORKING_treemix/')
source('plotting/plotting_funcs.R')


#set wd to the location of the treemix output files:
setwd('min25/')

#compare likelihoods
liks <- read.csv('logliks_min25.csv', row.names = 1)

#AIC = -2*loglik + 2k
AICs <- matrix(nrow = nrow(liks), ncol = ncol(liks))
rownames(AICs) <- rownames(liks); colnames(AICs) <- colnames(liks)
for (i in 1:ncol(liks)){
  AICs[,i] <- (-2*liks[,i]) + 2*(i-1)
}

bestmodel <- which.min(AICs)
#best model is 8: m1, rep3 (several other models close)
setwd('~/Desktop/WORKING_treemix/min25/m2')


#visualize graphs for two best m events
#Migration edges colored according to weight
par(mfrow=c(3,2))
pdf('tree_plots.pdf')
for (i in 2:length(list.dirs())){
  plot_tree(paste(noquote(list.dirs()[i]), '/test', sep=''))
}
dev.off()


#specific to best plot
setwd('~/Desktop/')
pdf('best_tree.pdf')
plot_tree('~/Desktop/WORKING_treemix/min25/m1/rep3/test')
dev.off()

#second-best
setwd('~/Desktop/')
pdf('fourth-best_tree.pdf')
plot_tree('~/Desktop/WORKING_treemix/min25/m2/rep3/test')
dev.off()


write.csv(file='min25_AICs.csv', AICs)

#visualize residuals
#file 'poporder' is a list of names of populations, in order to be plotted
#values >0 represent populations more closely related to one another in the data than in the tree:
#those pops represent candidates for admixture
pdf(file='best_tree_resids.pdf')
plot_resid('~/Desktop/WORKING_treemix/min25/m1/rep3/test', 'poporder')
dev.off()

pdf(file='fourth-best_tree_resids.pdf')
plot_resid('~/Desktop/WORKING_treemix/min25/m2/rep4/test', 'poporder')
dev.off()
