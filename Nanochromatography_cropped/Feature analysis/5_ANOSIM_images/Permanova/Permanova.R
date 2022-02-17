rm(list = ls())
library(vegan)
library(permute)
library(lattice)
library(ggplot2)
library(grid)


list_ = list('A')
sink('Permanova_A_total.txt')

for (val in list_){
  filename = paste(val, '.csv', sep = '')
  data <- read.csv(filename)
  
  data$Class <- factor(data$Class, labels = c('sample A','sample B','sample C',
                                              'sample D','sample E'), levels = c(1, 2, 3, 4, 5))
  # PERMANOVA test
  # The method can be changed by vegdist methods
  res = adonis(cbind(Eccentricity, Area, Perimeter)
               ~ Class, method = 'manhattan', permutations = 999, data = data)
  
  print(paste('PERMANOVA test for condition ', val, sep = ''))
  print(res)
  # dispersion <- betadisper(data.dist, group=data$Class)
  # Dissimilarity index, partial match to "manhattan", "euclidean", "canberra", 
  # "bray", "kulczynski", "jaccard", "gower", "altGower", "morisita", "horn", 
  # "mountford", "raup" , "binomial", "chao", "cao" or "mahalanobis".
  # plot(dispersion, hull=FALSE, ellipse=TRUE)

  all.mds <- metaMDS(data[, 1:3], distance = 'canberra')
  class<-rep(c("Sample A","Sample B","Sample C", "Sample D", "Sample E"), each = 5)

  data.scores <- as.data.frame(scores(all.mds, method = 'canberra'))
  data.scores$site <- rownames(data.scores)
  data.scores$grp <- data$Class

  filename_figure = paste('Permanova_plot_', val, '_.pdf')
  # tiff(filename_figure, units="in", width=10, height=7, res=600)
  # pdffile = filename_figure
  # pdf(pdffile)
  # print(ggplot(data=data.scores) + stat_ellipse(aes(x=NMDS1,y=NMDS2,colour=class),level = 0.50) +
          # geom_point(aes(x=NMDS1,y=NMDS2,shape=class,colour=class),size=4))
  # dev.off()
}
  
sink()

