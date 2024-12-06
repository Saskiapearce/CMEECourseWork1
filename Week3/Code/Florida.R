rm(list=ls())
# Is Florida getting warmer? 
load("../Data/KeyWestAnnualMeanTemperature.RData")

cor_test <- cor.test(ats$Year, ats$Temp)

# create a loop with samples (shuffles the tempature function 50 times? then stores the correlation value)
# make a new dataframe to perform a co.test on everytime... with a funtion eg sample data 
# function must: make a new data frame with year anad also shuffled temp, then perform a cor.test and then save the p values...
shuffle_temp_correlation_test <- function(temp, n) { # etablish a function which takes the data, with a number of data points we want shuffled and the number of shuffles 
  year_column <- ats$Year #make a year column as we went the output to be a data frame for the cor.test 
  newlist <- vector("list", n) # make a list for this 
  pval <- vector("numeric", n)
  for (i in 1:n) { #iterate n times 
    shuffled_temp <- sample(ats$Temp) #create shuffled data of temp 
    newlist[[i]] <- data.frame(Year = year_column, shuffled_temp = shuffled_temp)
    cor_result <- cor.test(year_column, shuffled_temp) # get the correlation results
    pval[i] <- cor_result$estimate # get the estaimates 
  }
 # print resulting data frame, including year and shuffled temp data (shuffled 50 times)
  return(list(estimate = pval))
}

pval <- shuffle_temp_correlation_test(ats, n = 1000) #run function 
#pval
pval.more_than <- sum(unlist(pval) > 0.56) #number of values below the correlation coefficent
fraction <- (pval.more_than/1000) #calculation of the p value
print("Number of random correlation permutations that had a higher correlation coefficient:") 
print(pval.more_than)
print("The p-value:") 
print(fraction)

# p- vlaue of the permutation test

#pval.more_than <- subset(pval, pval$estimate >= 0.5331784) #subset, smaller than CE
#pval.more_than
#pval.less_than <- subset(pval, pval$estimate <= 0.5331784)  #suubset larger than CE 

#len.more <- length(pval.more_than$estimate) #number of larger CE  
#len.less <- length(pval.less_than$estimate) #number of smaller CE

#fraction #fraction whcih were greater than the obersved one 

#len.more

#sum(unlist(pval) > 0.56) 

#plot()

# Input data
#