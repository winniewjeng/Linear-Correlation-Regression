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

r <- cor(my_data$Sales.Calls, my_data$Copiers.Sold)
# r = 0.865
n <-length(my_data$Sales.Calls)
# n = 15, assuming x and y have equal numbers of data

# Alternatively, we can get data by calling the Pearson correlation test function
# res <- cor.test(my_data$Sales.Calls, my_data$Copiers.Sold, method = "pearson")
# res r = 0.8646318 
