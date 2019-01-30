# Weight and MPG

library("ggpubr")

# import data
my_data <- CorrelationAnalysisSales
# display the first 6 rows of the data 
head(my_data, 6)

# Create scatterplot. x is indep. var and y is dep. var
ggscatter(my_data, x = "Sales.Calls", y = "Copiers.Sold", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Miles/(US) gallon", ylab = "Weight (1000 lbs)")
# output: Positive linear. r = 0.86, p = 0. Strong correlation

# Are the data from each of the 2 variables (x, y) follow a normal distribution?
# Use Shapiro-Wilk normality test –> shapiro.test()
shapiro.test(my_data$Sales.Calls) # => W = 0.95329, p-value = 0.5777
shapiro.test(my_data$Copiers.Sold) # => W = 0.95329, p-value = 0.5777
# From the output, the two p-values are greater than the sig. level 0.05 implying 
# that the distribution of the data are not significantly different from nor. distrib. 
# In other words, we can assume the normality
# Now look at the normality plot —> ggpubr::ggqqplot()
ggqqplot(my_data$Sales.Calls, ylab = "Sales.Calls")
ggqqplot(my_data$Copiers.Sold, ylab = "Copiers.Sold")
# From the normality plots, we also conclude that both populations come from norm. distrib.

# Pearson correlation test
res <- cor.test(my_data$Sales.Calls, my_data$Copiers.Sold, method = "pearson")
res
# output:
# t = 6.2051, df = 13, p-value = 3.193e-05
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
#   0.6325270 0.9542427
# sample estimates:
#   cor 
# 0.8646318


## Testing the significance of correlation coefficient --
# 1. find test stats t, 2. find critical value t

# Problem
# 
