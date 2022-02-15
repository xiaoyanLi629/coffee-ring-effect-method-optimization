rm(list = ls())
library(vegan)
library(permute)
library(lattice)

list_ = list('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I')

sink('summary_anosim_image_properties.txt')
for (val in list_){
  filename = paste(val, '_total_image_properties.csv')
  data <- read.csv(filename)
  data$Class <- factor(data$Class, labels = c('sample1','sample2','sample3',
                                              'sample4','sample5'), levels = c(1, 2, 3, 4, 5))
  data.dist = vegdist(data[, 1:4], method = 'euclidean')
  # ANOSIM test
  # The method can be changed by vegdist methoids
  # Dissimilarity index, partial match to "manhattan", "euclidean", "canberra", 
  # "bray", "kulczynski", "jaccard", "gower", "altGower", "morisita", "horn", 
  # "mountford", "raup" , "binomial", "chao", "cao" or "mahalanobis".
  # plot(dispersion, hull=FALSE, ellipse=TRUE)
  res <- anosim(data.dist, data$Class)
  
  print(paste('ANOSIM for condition ', val))
  print(summary(res))
}

sink()
plot(res)