rm(list = ls())
library(vegan)
library(permute)
library(lattice)

# data(dune)
# data(dune.env)
# dune.dist <- vegdist(dune)
# # attach(dune.env)
# dune.ano <- anosim(dune.dist, dune.env$Management)
# summary(dune.ano)
# plot(dune.ano)


list_ = list('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I')


sink('summary_anosim_total.txt')

for (val in list_){
  filename = paste('feature_', val, '.csv', sep = '')
  data <- read.csv(filename)
  data$class <- factor(data$class, labels = c('sample1','sample2','sample3',
                                              'sample4','sample5'), levels = c(1, 2, 3, 4, 5))
  data.dist = vegdist(data[, c(1,2,3,4,5,6,7,8,9)], method = 'canberra')
  # ANOSIM test
  # The method can be changed by vegdist methoids
  res <- anosim(data.dist, data$class)
  # filename_write = paste('summary_permanova_', val, '.txt', sep = '')
  # sink(filename_write)
  print(summary(res))
  # Dissimilarity index, partial match to "manhattan", "euclidean", "canberra", 
  # "bray", "kulczynski", "jaccard", "gower", "altGower", "morisita", "horn", 
  # "mountford", "raup" , "binomial", "chao", "cao" or "mahalanobis".
  # plot(dispersion, hull=FALSE, ellipse=TRUE)
  filename_figure = paste('plot_', val, '.tiff')
  tiff(filename_figure, units="in", width=10, height=7, res=600)
  plot(res)
  dev.off()
}
  
sink()
# plot(res)