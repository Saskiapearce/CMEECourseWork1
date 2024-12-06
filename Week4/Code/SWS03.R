#statisical power analysis 
#Comparasion of sexs 
if (!requireNamespace("WebPower", quietly = TRUE)) install.packages("WebPower")
library(WebPower)
male <- 100
female <- 30 # only 5 dragons have been locked at
sd <- 1.2

# we want to know the sample size required to make it statistically power
# pwr() is a R package which computes the statistical power




#first we want to calculate the effect size d (Cohen's d) difference between two means, deivded by standard deviation 
# ratio - effect size to stanrd deviation

0.3/1.2

# 0.25
# the effect size is the difference between the two means, the actual real world difference 
# so d is 0.25

# this means that we would have to look at an 

y <- rnorm(51, mean=1, sd=1.3)
x <- seq(from=0, to=5, y=0.1)

length(x)

plot(hist(y, breaks=10))
mean(y)
sd(y)
segments(x0=(mean(y)), y0=(0), x1=(mean(y)), y1=40, lty=1, col="blue")
segments(x0=(mean(y)+0.25*sd(y)), y0=(0), x1=(mean(y)+0.25*sd(y)), y1=40, lty=1, col='red')

wp.t(d=0.25, power=0.8, type="two.sample", alternative="two.sided")

# n = 252.1275
# n = the number of indervisuals you would need os 252.1275

res.1 <- wp.t(n1=seq(20,300,20), n2=seq(20,300,20), d=0.25, type="Two.sample..2n", alternative="two.sided")


plot(res.1, xvar='n1', yvar='power')

# effect size





