# Speed and MPG

library("ggpubr")

# import data
my_data <- SpeedAndMPG

# display the first 6 rows of the data 
head(my_data, 6)

# Find the correlation coefficient
ggscatter(my_data, x = "Speed.x", y = "MPG.y", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Speed", ylab = "MPG")

r <- cor(my_data$Speed.x, my_data$MPG.y)
# r = 0.944, p = 0.0045 Strong positive correlation
n <-length(my_data$Speed.x)
# assuming x and y have equal numbers of data, n = 6

# Determine at the 0.05 significance level whether the correlation in the population 
# is greater than zero.

# H null: There is a negative or no correlation between the speed and mpg (rho < 0)
# H alt: There is a positive correlation between the speed and mpg (rho > 0)

# critical value t -- one-tail t test, right tail:
alpha = 0.05
t.alpha = qt(1-alpha, df = n-2) # 1-alpha because of the right tail, df = 4
c(t.alpha) # cv t = 2.13

# test stats t:
ts_t <- (r*sqrt(n-2))/sqrt(1-r^2) 
ts_t # ts_t = 5.75

# Conclusion: Reject the null hypothesis. There is a strong and positive (r = 0.994) correlation
# between the speed and mpg

## Linear Regression
# extract the parameters of the estimated regression equation with the coeffs function.
coeffs = coefficients(my_data.lm);
coeffs
# (Intercept)       MPG.y 
# 12.989247    1.580645 

## Alternatively, use a diff method to create the same fit-linear regression model, lm,
## with indepen. var, depen. var, dataframe
# my_data.lm = lm(Speed.x ~ MPG.y, data = my_data)
# my_data.lm
## Coefficients:
## (Intercept)        MPG.y  
## 12.989        1.581

# Making prediction
# now fit the prediction using the estimated regression equation
MPG = 40
# linear equation y_hat = a + bx, where a is the slope-intercept, and b is the slope
Speed = coeffs[1]+coeffs[2]*MPG
Speed # Predicted speed is 60.41

# summary
summary(my_data.lm)

# data(package = .packages(all.available = TRUE))
# co2 <- CO2
# head(co2, 10)
# summary(co2)
# # uptake: a numeric vector of ambient carbon dioxide concentrations (mL/L).


