rm(list=ls())
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
library(ggplot2)
if (!requireNamespace("MASS", quietly = TRUE)) install.packages("MASS")
library(MASS)
if (!requireNamespace("ggpubr", quietly = TRUE)) install.packages("ggpubr")
library(ggpubr)

## Loading required package: ggpubr
#runs a fish model and plots the residual 

fish<- read.csv("../Data/fisheries.csv", stringsAsFactors = T)
str(fish)

ggplot(fish, aes(x=MeanDepth, y=TotAbund))+
  geom_point()+
  labs(x= "Mean Depth (km)", y="Total Abundance")+
  theme_classic()


M1<- glm(TotAbund~MeanDepth, data = fish, family = "poisson")
summary(M1)
## 
## Call:
## glm(formula = TotAbund ~ MeanDepth, family = "poisson", data = fish)
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  6.64334    0.01273  521.70   <2e-16 ***
## MeanDepth   -0.62870    0.00670  -93.84   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for poisson family taken to be 1)
## 
##     Null deviance: 27779  on 145  degrees of freedom
## Residual deviance: 15770  on 144  degrees of freedom
## AIC: 16741
## 
## Number of Fisher Scoring iterations: 5

par(mfrow=c(2,2)) #partitioning the plot window into a 2X2
plot(M1)




