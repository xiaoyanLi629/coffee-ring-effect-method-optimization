rm(list = ls())
library(vegan)
library(permute)
library(lattice)
library(rstudioapi)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

list_ = list('G')

sink('Anosim_G_image_properties.txt')
for (val in list_){
  filename = paste(val, '.csv', sep = '')
  data <- read.csv(filename)
  data$Class <- factor(data$Class, labels = c('sample A','sample B','sample C',
                                              'sample D','sample E'), levels = c(1, 2, 3, 4, 5))
  data.dist = vegdist(data[, 1:5], method = 'euclidean')
  # ANOSIM test
  # The method can be changed by vegdist methoids
  # Dissimilarity index, partial match to "manhattan", "euclidean", "canberra", 
  # "bray", "kulczynski", "jaccard", "gower", "altGower", "morisita", "horn", 
  # "mountford", "raup" , "binomial", "chao", "cao" or "mahalanobis".
  # plot(dispersion, hull=FALSE, ellipse=TRUE)
  res <- anosim(data.dist, data$Class)
  # filename_figure = paste('ANOSIM_B_plot_', val, '.tiff')
  # tiff(filename_figure, units="in", width=10, height=7, res=600)
  # plot(res)
  # dev.off()
  
  print(paste('ANOSIM for condition ', val))
  print(summary(res))
}

sink()
plot(res)