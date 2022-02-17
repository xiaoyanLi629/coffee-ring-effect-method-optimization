rm(list = ls())
library(vegan)
library(permute)
library(lattice)

dir.create("ANOSIM")

list_ = list('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I')


sink('ANOSIM/MDS_anosim_total.txt')

for (val in list_){
  filename = paste(val, '_pixel_coordinates/', val, '_js_coordinates.csv', sep = '')
  data <- read.csv(filename)
  data$Class <- factor(data$Class, labels = c('1','2','3','4','5'), levels = c(1, 2, 3, 4, 5))
  data.dist = vegdist(data[, c(4,5,6)], method = 'canberra')
  # ANOSIM test
  # The method can be changed by vegdist methoids
  res <- anosim(data.dist, data$Class)
  print(summary(res))
  # Dissimilarity index, partial match to "manhattan", "euclidean", "canberra", 
  # "bray", "kulczynski", "jaccard", "gower", "altGower", "morisita", "horn", 
  # "mountford", "raup" , "binomial", "chao", "cao" or "mahalanobis".
  # plot(dispersion, hull=FALSE, ellipse=TRUE)
  filename_figure = paste('ANOSIM/MDS_plot_', val, '.tiff')
  tiff(filename_figure, units="in", width=10, height=7, res=600)
  plot(res)
  dev.off()
}
sink()


sink('ANOSIM/CMDS_anosim_total.txt')

for (val in list_){
  filename = paste(val, '_pixel_coordinates/', val, '_js_coordinates.csv', sep = '')
  data <- read.csv(filename)
  data$Class <- factor(data$Class, labels = c('1','2','3','4','5'), levels = c(1, 2, 3, 4, 5))
  data.dist = vegdist(data[, c(1,2,3)], method = 'canberra')
  # ANOSIM test
  # The method can be changed by vegdist methoids
  res <- anosim(data.dist, data$Class)
  print(summary(res))
  # Dissimilarity index, partial match to "manhattan", "euclidean", "canberra", 
  # "bray", "kulczynski", "jaccard", "gower", "altGower", "morisita", "horn", 
  # "mountford", "raup" , "binomial", "chao", "cao" or "mahalanobis".
  # plot(dispersion, hull=FALSE, ellipse=TRUE)
  filename_figure = paste('ANOSIM/CMDS_plot_', val, '.tiff')
  tiff(filename_figure, units="in", width=10, height=7, res=600)
  plot(res)
  dev.off()
}
sink()