rm(list = ls())
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# sink('anova_result.txt')

dataset <- read.csv('image_property.csv')

dataset$class <- factor(dataset$class, labels = c('sample1','sample2','sample3',
                                            'sample4','sample5'), levels = c(1, 2, 3, 4, 5))
dataset$condition <- factor(dataset$condition, labels = c('cond1','cond2','cond3','cond4','cond5',
                                                    'cond6','cond7','cond8','cond9'), levels = c(1, 2, 3, 4, 5, 6, 7, 8, 9))



for (i in seq(1, 9, 1)){
  filename = paste(toString(i), '_class.txt', sep = '')
  sink(filename)

  data = dataset[((i-1)*25+1):(i*25), ]

  area_mean_class <- aov(area_mean ~ class, data = data)
  peri_mean_class <- aov(peri_mean ~ class, data = data)
  centroid_mean_class <- aov(centroid_mean ~ class, data = data)
  eccen_mean_class <- aov(eccen_mean ~ class, data = data)
  orien_mean_class <- aov(orien_mean ~ class, data = data)

  area_std_class <- aov(area_std ~ class, data = data)
  peri_std_class <- aov(peri_std ~ class, data = data)
  centroid_std_class <- aov(centroid_std ~ class, data = data)
  eccen_std_class <- aov(eccen_std ~ class, data = data)
  orien_std_class <- aov(orien_std ~ class, data = data)

  print('summary for area mean ~ class')
  print(summary(area_mean_class))
  print('summary for peri mean ~ class')
  print(summary(peri_mean_class))
  print('summary for centroid mean ~ class')
  print(summary(centroid_mean_class))
  print('summary for eccen mean ~ class')
  print(summary(eccen_mean_class))
  print('summary for orien mean ~ class')
  print(summary(orien_mean_class))

  print('summary for area std ~ class')
  print(summary(area_std_class))
  print('summary for peri std ~ class')
  print(summary(peri_std_class))
  print('summary for centroid std ~ class')
  print(summary(centroid_std_class))
  print('summary for eccen std ~ class')
  print(summary(eccen_std_class))
  print('summary for orien std ~ class')
  print(summary(orien_std_class))
  sink()
  
  ##############################################
  
  # filename = paste(toString(i), '_condition.txt', sep = '')
  # sink(filename)
  # 
  # area_mean_condition <- aov(area_mean ~ condition, data = data)
  # peri_mean_condition <- aov(peri_mean ~ condition, data = data)
  # centroid_mean_condition <- aov(centroid_mean ~ condition, data = data)
  # eccen_mean_condition <- aov(eccen_mean ~ condition, data = data)
  # orien_mean_condition <- aov(orien_mean ~ condition, data = data)
  # 
  # area_std_condition <- aov(area_std ~ condition, data = data)
  # peri_std_condition <- aov(peri_std ~ condition, data = data)
  # centroid_std_condition <- aov(centroid_std ~ condition, data = data)
  # eccen_std_condition <- aov(eccen_std ~ condition, data = data)
  # orien_std_condition <- aov(orien_std ~ condition, data = data)
  # 
  # 
  # print('summary for area mean ~ cond')
  # print(summary(area_mean_condition))
  # print('summary for peri mean ~ cond')
  # print(summary(peri_mean_condition))
  # print('summary for centroid mean ~ cond')
  # print(summary(centroid_mean_condition))
  # print('summary for eccen mean ~ cond')
  # print(summary(eccen_mean_condition))
  # print('summary for orien mean ~ cond')
  # print(summary(orien_mean_condition))
  # 
  # print('summary for area std ~ cond')
  # print(summary(area_std_condition))
  # print('summary for peri std ~ cond')
  # print(summary(peri_std_condition))
  # print('summary for centroid std ~ cond')
  # print(summary(centroid_std_condition))
  # print('summary for eccen std ~ cond')
  # print(summary(eccen_std_condition))
  # print('summary for orien std ~ cond')
  # print(summary(orien_std_condition))
  # sink()
}





for (i in seq(1, 5, 1)){
  
  cond = paste('sample', toString(i), sep = '')
  
  data = dataset[which(dataset$class==cond), ]
  
  ##############################################
  
  filename = paste(toString(i), '_condition.txt', sep = '')
  sink(filename)
  
  area_mean_condition <- aov(area_mean ~ condition, data = data)
  peri_mean_condition <- aov(peri_mean ~ condition, data = data)
  centroid_mean_condition <- aov(centroid_mean ~ condition, data = data)
  eccen_mean_condition <- aov(eccen_mean ~ condition, data = data)
  orien_mean_condition <- aov(orien_mean ~ condition, data = data)
  
  area_std_condition <- aov(area_std ~ condition, data = data)
  peri_std_condition <- aov(peri_std ~ condition, data = data)
  centroid_std_condition <- aov(centroid_std ~ condition, data = data)
  eccen_std_condition <- aov(eccen_std ~ condition, data = data)
  orien_std_condition <- aov(orien_std ~ condition, data = data)
  
  
  print('summary for area mean ~ cond')
  print(summary(area_mean_condition))
  print('summary for peri mean ~ cond')
  print(summary(peri_mean_condition))
  print('summary for centroid mean ~ cond')
  print(summary(centroid_mean_condition))
  print('summary for eccen mean ~ cond')
  print(summary(eccen_mean_condition))
  print('summary for orien mean ~ cond')
  print(summary(orien_mean_condition))
  
  print('summary for area std ~ cond')
  print(summary(area_std_condition))
  print('summary for peri std ~ cond')
  print(summary(peri_std_condition))
  print('summary for centroid std ~ cond')
  print(summary(centroid_std_condition))
  print('summary for eccen std ~ cond')
  print(summary(eccen_std_condition))
  print('summary for orien std ~ cond')
  print(summary(orien_std_condition))
  sink()
}


