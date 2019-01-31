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
# n = 15, assuming x and y have equal numbers of data, df = 13

# Alternatively, we can get data by calling the Pearson correlation test function
# res <- cor.test(my_data$Sales.Calls, my_data$Copiers.Sold, method = "pearson")
# res r = 0.8646318

## Test the significance of the correlation coefficient r

# H null: There's no correlation b/n the num of sales calls and copiers sold, rho = 0
# H alt: There is correlation b/n the num of sales calls and copiers sold, rho != 0

# critical value t -- two-tail t test
alpha = 0.05
t.half.alpha = qt(1-alpha/2, df = n-2) # 1-alpha because of the right tail, df = 13
c(-t.half.alpha, t.half.alpha) # (-2.16 2.16)

# test stats t:
ts_t <- (r*sqrt(n-2))/sqrt(1-r^2) 
ts_t #


