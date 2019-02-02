library("ggpubr")

heart <- heart

# higher cholestral leads to higher maximum heart rate
# independent x = chol (cholesterol level); dependent y = max heart rate achieved (thalach)
ggscatter(heart, x = "chol", y = "thalach", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "cholestral", ylab = "maximum heart rate",
          col = c("#00AFBB"))

n <-length(heart$chol); n
# n = 303

### Correlation Analysis
r <- cor(heart$chol, heart$thalach); r 
# r = 0.12

### Test the significance of the correlation coefficient r

# H null: There's no correlation b/n cholesterol level and heart's bps, rho = 0
# H alt: There is correlation b/n cholesterol level and heart's bps, rho != 0

# critical value t -- two-tail t test:
alpha = 0.05
t.half.alpha = qt(1-alpha/2, df = n-2) # 1-alpha because of the right tail, df = 13
c(-t.half.alpha, t.half.alpha) # (-1.97, 1.97)

# test stats t:
ts_t <- (r*sqrt(n-2))/sqrt(1-r^2)
ts_t # t = 2.15

