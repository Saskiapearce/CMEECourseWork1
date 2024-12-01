#linear regression 

#########load data####### 
data <- read.delim("daphnia.txt")
#look at the data
summary(data)

###### 1) check for outliers using boxplots ######
par(mfrow = c(1, 2))
plot(Growth.rate ~ as.factor(Detergent), data=data) # as.factor the categorical data 

####### 2) Check for homogeneity of variances, the ratio between the largest and smallest variance should not be more than 4 #######
require(dplyr)
## Loading required package: dplyr
##
## Attaching package: 'dplyr'
## The following objects are masked from 'package:stats':
##
## filter, lag
## The following objects are masked from 'package:base':
##
## intersect, setdiff, setequal, union
daphnia %>%
  group_by(Detergent) %>%
  summarise (variance=var(Growth.rate))
## # A tibble: 4 x 2
## Detergent variance
## <chr> <dbl>
## 1 BrandA 1.51
## 2 BrandB 1.09
## 3 BrandC 1.78
## 4 BrandD 2.38
daphnia %>%
  group_by(Daphnia) %>%
  summarise (variance=var(Growth.rate))
## # A tibble: 3 x 2
## Daphnia variance
## <chr> <dbl>
## 1 Clone1 0.331 ## THIS RATIO IS A LITTLE MORE THEN 4 TIMES
## 2 Clone2 1.53
## 3 Clone3 1.53

## keep this king of thing in mind when you draw conclusions and interpret the model, be expilicity clear about modle assumption violations in the write up

######## 3)  Is the data normally distributed ############

dev.off() # clearing the plot multi-fram (mfrow) function 

hist(data$Growth.rate)

## its not the end of the world if it isnt normally distributed, its mainly the residuals of the models which are important 

###### 4) Are there a lot of 0's? #####
# check the histogram
###### 5) Check for collinearity amoung the covariates #####
###### 6) plot the means and standard deviations to visually insepct differences between groups ######

seFun <- function(x) {
  sqrt(var(x)/length(x)) # create a function to calculate the standard error
}
detergentMean <- with(data, tapply(Growth.rate, INDEX = Detergent,
                                      FUN = mean))
detergentSEM <- with(data, tapply(Growth.rate, INDEX = Detergent,
                                     FUN = seFun))
cloneMean <- with(data, tapply(Growth.rate, INDEX = Daphnia, FUN = mean))
cloneSEM <- with(data, tapply(Growth.rate, INDEX = Daphnia, FUN = seFun))
Now we can use par(mfrow=(2,1), mar=c(4,4,1,1)) to plot them one above the other on the
same graphics device and to reduce the size of the margins (Figure 2).
par(mfrow=c(2,1),mar=c(4,4,1,1))
barMids <- barplot(detergentMean, xlab = "Detergent type", ylab = "Population
growth rate",
                   ylim = c(0, 5))
arrows(barMids, detergentMean - detergentSEM, barMids, detergentMean +
         detergentSEM, code = 3, angle = 90)
Statistics with Sparrows
6
barMids <- barplot(cloneMean, xlab = "Daphnia clone", ylab = "Population grow
th rate",
                   ylim = c(0, 5))
arrows(barMids, cloneMean - cloneSEM, barMids, cloneMean + cloneSEM,
       code = 3, angle = 90)

#show you what might be happening

#### plot the model #####

model <- lm(Growth.rate ~ Detergent + Daphnia, data = data)
summary(model)

# remeber that every clone also has a brand. so the first slope is brand A, Clone 1, which is the reference / baseline 
# everything else is a comparasion of that. + means no interaction is considered between clone and dpahina 

# this is what an interaction would look like...
model <- lm(Growth.rate ~ Detergent * Daphnia, data = data)
summary(model)

# you could use a Tukey HSD test to test all the pairwise differences. 
# an anvoa is similar to a lm, but less powerful as it only fits to the mean squares value. Yet when you want multiple comparasions, it can be quite useful

#### extra tips and tricks #####
pairs(data$Growth.rate) # used to test for colinearity







