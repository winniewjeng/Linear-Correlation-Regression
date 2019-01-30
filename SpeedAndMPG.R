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

# Reject the null hypothesis. There is a strong and positive (r = 0.994) correlation
# between the speed and mpg

