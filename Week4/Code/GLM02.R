# Binomial and binary models 
require(ggplot2)
require(ggpubr)

worker <- read.csv("../data/workerbees.csv", stringsAsFactors = T)
worker

M1 <- glm(Parasites~CellSize, data = worker, family = "binomial") #non-normal
summary(M1)

#logit(ProbabilityofParasites) = -11.25+22.18 * CellSize # the results from the model
# with increasing cell sixe of the honey comb increases the probability being infcet ed by the parasite

#input the equation: this suggests that a honey comb cell size above 0.51 is more liely to be infected by the mite, 

range(worker$CellSize) # Finding the range of Cell Size
## [1] 0.352 0.664
new_data <- data.frame(CellSize=seq(from=0.352, to=0.664, length=100))
predictions<- predict(M1, newdata = new_data, type = "link", se.fit = TRUE) # the type="link" here predicted the fit and se on the log-linear scale. 
new_data$pred<- predictions$fit
new_data$se<- predictions$se.fit
new_data$upperCI<- new_data$pred+(new_data$se*1.96)
new_data$lowerCI<- new_data$pred-(new_data$se*1.96)

# Making the Plot 
ggplot(new_data, aes(x=CellSize, y=plogis(pred)))+ 
  geom_line(col="black")+
  geom_point(worker, mapping = aes(x=CellSize, y=Parasites), col="blue")+
  geom_ribbon(aes(ymin=plogis(lowerCI), ymax=plogis(upperCI), alpha=0.2), show.legend = FALSE)+ 
  labs(y="Probability of Infection", x="Cell Size (cm)")+
  theme_classic()

# if it is a conitnous data type, then the value given will be a slope (m) # solve for x 
# y = mx + c 
# if it is a categorical data type, the the value given will be an intercept (x) # solve for m
# y = mx + c






