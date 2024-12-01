rm(list=ls())

d<-read.table("../data/SparrowSize.txt", header=TRUE)
str(d)

# prints length of the tarsus, histogram of tardud and mena of the tarsus 
# prints histograms of tarsus with different breaks 
# prints range and head of the data, including a boxplot of the data 


length(d$Tarsus)
hist(d$Tarsus)
mean(d$Tarsus)

par(mfrow = c(2, 2))
hist(d$Tarsus, breaks = 3, col="grey")
hist(d$Tarsus, breaks = 10, col="grey")
hist(d$Tarsus, breaks = 30, col="grey")
hist(d$Tarsus, breaks = 100, col="grey")

head(table(d$Tarsus))
d$Tarsus.rounded<-round(d$Tarsus, digits=1)
head(d$Tarsus.rounded)

range(d$Tarsus, na.rm = TRUE)
## [1] 15.0 21.1

var(d$Tarsus, na.rm = TRUE)
## [1] 0.7404059

znormal <- rnorm(1e+06)
hist(znormal, breaks = 100)

par(mfrow = c(1, 2))
hist(znormal, breaks = 100)
abline(v = qnorm(c(0.25, 0.5, 0.75)), lwd = 2)
abline(v = qnorm(c(0.025, 0.975)), lwd = 2, lty = "dashed")
plot(density(znormal))
abline(v = qnorm(c(0.25, 0.5, 0.75)), col = "gray")
abline(v = qnorm(c(0.025, 0.975)), lty = "dotted", col = "black")
abline(h = 0, lwd = 3, col = "blue")
text(2, 0.3, "1.96", col = "red", adj = 0)
text(-2, 0.3, "-1.96", col = "red", adj = 1)

boxplot(d$Tarsus~d$Sex.1, col = c("red", "blue"), ylab="Tarsus length (mm)")

t.test2 <- t.test(d1$Mass~d1$Sex)
t.test2


