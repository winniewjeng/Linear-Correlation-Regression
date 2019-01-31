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
          xlab = "Calls made", ylab = "Copeirs sold")
# output: Positive linear. r = 0.86, p = 0. Strong correlation


### Correlation Analysis

# Correlation coefficient
r <- cor(my_data$Sales.Calls, my_data$Copiers.Sold); r
# r = 0.865
n <-length(my_data$Sales.Calls); n
# n = 15, assuming x and y have equal numbers of data, df = 13



### Test the significance of the correlation coefficient r

# H null: There's no correlation b/n the num of sales calls and copiers sold, rho = 0
# H alt: There is correlation b/n the num of sales calls and copiers sold, rho != 0

# critical value t -- two-tail t test:
alpha = 0.05
t.half.alpha = qt(1-alpha/2, df = n-2) # 1-alpha because of the right tail, df = 13
c(-t.half.alpha, t.half.alpha) # (-2.16 2.16)

# test stats t:
ts_t <- (r*sqrt(n-2))/sqrt(1-r^2) 
ts_t # t = 6.21

# Conclusion: Reject H null. The correlation between x and y are statistically significant



### Regression Analysis

# syntax: fit = lm (dependent.y ~ independent.x, data)
my_data.lm = lm(Copiers.Sold ~ Sales.Calls, data = my_data); my_data.lm
# y_hat = a + bx, y-intercept a is coeffs[1] and slope b is coeffs[2]
coeffs = coefficients(my_data.lm); coeffs[1]; coeffs[2]

# with 100 calls, how many copiers are predicted to sell?
predicted <- 100
# y = a + b(predicted.x)
sold = coeffs[1]+coeffs[2]*predicted; sold
# 46.0425 copiers are predicted to sell



### Test significance of slope b (coeffs[2])

# H null: the slope of the line could be less than or equal to zero, beta <= 0
# H alt: the slope of the line is greater than 0, beta > 0

# critical value t -- one-tail t test, right tail:
alpha = 0.05
t.alpha = qt(1-alpha, df = n-2); 
cv_t <- t.alpha; cv_t
# cv_t = 1.77

# slope test stats t:
test_slope_t <- summary(my_data.lm)$coef[,"t value"][2]; test_slope_t

# summary(my_data.lm)

