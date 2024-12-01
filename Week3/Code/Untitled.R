rm(list=ls())

data <- read.csv("SparrowSize.csv")
data <- subset(data, data$Wing!="NA")
summary(data$Wing)
hist(data$Wing)

# some outliers, likley from young birds or birds who are molting 

model1 <- lm(Wing ~ Sex.1, data = data)
summary(model1)

boxplot(data$Wing~data$Sex.1, ylab='Wing length (mm)')
#lots of outliers

anova(model1)
model2 <- lm(Mass~as.factor(Year), data = data )
anova(model2)

summary(model2)
