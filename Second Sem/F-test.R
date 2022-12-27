#F-test for Comparing two variances 
my_data <- ToothGrowth
library("dplyr")
sample_n(my_data, 10)
res.ftest <- var.test(len ~ supp, data = my_data)
res.ftest
res.ftest$estimate
res.ftest$p.value
