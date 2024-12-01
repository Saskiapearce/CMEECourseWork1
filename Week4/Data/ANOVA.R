#ANOVAs
#### load data #####
rm(list=ls())
data <- read.csv("SparrowSize.csv", header=TRUE)
# anova requaires a continuous response and a categorical predictor (explainitory variable).
# anovas test for differences in variances, between and within groups, eg a t-test with more groups 
# is the difference within groups greater than between groups? 
data <- subset(data, data$Wing!="NA")
####look at the histogram####
hist(data$Wing)
#### plot model####
model <- lm(Wing ~ Sex.1, data = data)
summary(model)
boxplot(data$Wing~data$Sex.1, ylab="Wing length (mm)")# you can see quite a few outliers on this data. 
# now we want the F statistic, as well as the linear model info
###### perform the ANVOA #######
anova(model)
#the first line is the between group variance 
# the second line (residals) is the within group 
# the f stat = mean squares of between group/ residual (within) groups
# here they differ

##### Post-hoc t test#####
t.test(data$Wing~data$Sex.1, var.equal=TRUE)
# alternative hypothesis: true difference in means between group female and group male is not equal to 0
# mean in group female versus male
boxplot(data$Mass~data$Year)
###### if mutliple groups, do a post hoc tukey test instead #####
tukeyHSD(data)
##### main take away secret of ANOVA ######

# essentionally. start with linear model, then look at modle with ANOVA - if theres a differnce between a) multiple groups = tukey test b) two groups = t.test 
# ANOVA is a something executed after a lienar model 
# is it better for assesssing spread eg within group versus between group variance for larger data sets, rather than centrality.

