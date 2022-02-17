rm(list = ls())
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# data <- read.csv('feature_total.csv')
data <- read.csv('image_property.csv')

data$class <- factor(data$class, labels = c('sample1','sample2','sample3',
                                            'sample4','sample5'), levels = c(1, 2, 3, 4, 5))
data$condition <- factor(data$condition, labels = c('cond1','cond2','cond3','cond4','cond5',
                                                    'cond6','cond7','cond8','cond9'), levels = c(1, 2, 3, 4, 5, 6, 7, 8, 9))
# MANOVA test
res <- manova(cbind(area_mean, area_std, eccen_mean, eccen_std, orien_mean, orien_std,  peri_mean, peri_std, centroid_mean, centroid_std)~ class+condition, data = data)
filename_write = paste('summary_manova_image_property', '.txt', sep = '')
sink(filename_write)
print(summary(res))
print(summary.aov(res))
sink()

