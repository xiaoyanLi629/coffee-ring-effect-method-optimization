rm(list = ls())

list_ = list('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I')
filename_write = paste('summary_manova_individual', '.txt', sep = '')
sink(filename_write)

for (val in list_){
  filename = paste('feature_', val, '.csv', sep = '')
  data <- read.csv(filename)
  
  # MANOVA test
  res <- manova(cbind(area_mean, area_std, eccen_mean, eccen_std, orien_mean, peri_mean, peri_std, centroid_mean, centroid_std)~ class, data = data)
  print(paste('Summary of result', val))
  print(summary(res))
  print(paste('Summary of aov result', val))
  print(summary.aov(res))
}

sink()

