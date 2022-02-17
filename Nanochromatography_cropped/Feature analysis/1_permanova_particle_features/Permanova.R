rm(list = ls())
library(vegan)
library(permute)
library(lattice)
library(ggplot2)
library(grid)


list_ = list('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I')
sink('summary_permanova_total.txt')

for (val in list_){
  filename = paste('feature_', val, '.csv', sep = '')
  data <- read.csv(filename)
  
  data$class <- factor(data$class, labels = c('sample1','sample2','sample3',
                                              'sample4','sample5'), levels = c(1, 2, 3, 4, 5))
  # PERMANOVA test
  # The method can be changed by vegdist methods
  res = adonis(cbind(area_mean, area_std, eccen_mean, eccen_std, orien_mean, orien_std,  peri_mean, peri_std, centroid_mean, centroid_std)
               ~ class, method = 'manhattan', permutations = 999, data = data)
  
  print(paste('PERMANOVA test for condition ', val, sep = ''))
  print(res)
  # dispersion <- betadisper(data.dist, group=data$class)
  # Dissimilarity index, partial match to "manhattan", "euclidean", "canberra", 
  # "bray", "kulczynski", "jaccard", "gower", "altGower", "morisita", "horn", 
  # "mountford", "raup" , "binomial", "chao", "cao" or "mahalanobis".
  # plot(dispersion, hull=FALSE, ellipse=TRUE)
  
  all.mds <- metaMDS(data[, 1:8], distance = 'canberra')
  class<-rep(c("Sample A","Sample B","Sample C", "Sample D", "Sample E"),each = 5)
  
  data.scores <- as.data.frame(scores(all.mds, method = 'canberra'))  
  data.scores$site <- rownames(data.scores)  
  data.scores$grp<-class

  print(ggplot(data=data.scores) + stat_ellipse(aes(x=NMDS1,y=NMDS2,colour=class),level = 0.50) +
    geom_point(aes(x=NMDS1,y=NMDS2,shape=class,colour=class),size=4))
}
sink()