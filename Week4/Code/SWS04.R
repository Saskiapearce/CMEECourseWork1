rm(list=ls())
#Making Variance-covariance analysis in bivariate models
library(MCMCglmm)
d<-read.table("../Data/SparrowSize.txt", header=TRUE)
str(d)

dat <- d[ which( d$Tarsus!="NA" & d$Wing!="NA" & d$Sex!="NA" &
                   d$Cohort!="NA") , ]
# this is a different way of subsetting - we can give multiple conditions at

d1<-data.frame(d$Tarsus,d$Wing,d$Sex)
pairs(d1, pch=19, cex=0.7)

