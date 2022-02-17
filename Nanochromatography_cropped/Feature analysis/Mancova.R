rm(list = ls())
library(jmv)

data <- read.csv('feature_total.csv')
data$class <- factor(data$class, labels = c('sample1','sample2','sample3',
                                            'sample4','sample5'), levels = c(1, 2, 3, 4, 5))
data$condition <- factor(data$condition, labels = c('cond1','cond2','cond3','cond4','cond5',
                                                    'cond6','cond7','cond8','cond9'), levels = c(1, 2, 3, 4, 5, 6, 7, 8, 9))
# MANCOVA test
res.class <- mancova(deps = vars(area_mean, area_std, ecc_mean, ecc_std, orien_mean, orien_std,  peri_mean, peri_std),
               factors = class, data = data)
res.condition <- mancova(deps = vars(area_mean, area_std, ecc_mean, ecc_std, orien_mean, orien_std,  peri_mean, peri_std),
                     factors = condition, data = data)
filename_write = paste('summary_mancova_class_condition', '.txt', sep = '')
sink(filename_write)
print(res.class)
print(res.condition)
sink()

