# plot(x,y) Scatterplot

# plot(y~x) Scatterplot with y as a response variable

#hist(mydata) Histogram

#barplot(mydata) Bar plot

#points(y1$\sim$x1) Add another series of points

#boxplot(y$\sim$x) Boxplot

MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")
dim(MyDF) #check the size of the data frame you loaded

str(MyDF)

require(tidyverse)
glimpse(MyDF)

MyDF$Type.of.feeding.interaction <- as.factor(MyDF$Type.of.feeding.interaction)
MyDF$Location <- as.factor(MyDF$Location)
str(MyDF)

plot(MyDF$Predator.mass,MyDF$Prey.mass) # x (depedenet, y (independet))

#That doesn’t look very meaningful! Let’s try taking logarithms. Why? - 
#Because body sizes across species tend to be 
#log-normally distributed

plot(log(MyDF$Predator.mass),log(MyDF$Prey.mass)) #more a relatinships forming 

plot(log10(MyDF$Predator.mass),log10(MyDF$Prey.mass)) 

plot(log10(MyDF$Predator.mass),log10(MyDF$Prey.mass),pch=10) # Change marker, marker codes are somewhere

plot(log10(MyDF$Predator.mass),log10(MyDF$Prey.mass),pch=20, xlab = "Predator Mass (g)", ylab = "Prey Mass (g)") # Add labels

hist(MyDF$Predator.mass) # very heavially right skewed


# log it to see what the data what looklike: 

hist(log10(MyDF$Predator.mass), xlab = "log10(Predator Mass (g))", ylab = "Count") # include labels

hist(log10(MyDF$Predator.mass),xlab="log10(Predator Mass (g))",ylab="Count", 
     col = "pink", border = "pink") # Change bar and borders colors 
# add in green and pink barders
#look for distributions of data , fundementally learn to explore your data in terms of distributions 
#;atic beaitufal graphics in R
# applies later on to beauitfual graphics 


par(mfcol=c(2,1)) #initialize multi-paneled plot
par(mfg = c(1,1)) # specify which sub-plot to use first 
hist(log10(MyDF$Predator.mass),
     xlab = "log10(Predator Mass (g))", ylab = "Count", col = "lightblue", border = "pink", 
     main = 'Predator') # Add title
par(mfg = c(2,1)) # Second sub-plot
hist(log10(MyDF$Prey.mass), xlab="log10(Prey Mass (g))",ylab="Count", col = "lightgreen", border = "pink", main = 'prey')

#overlapping two boxplots 
# or you can overlay these two projects to be overlapping hist(log10(MyDF$Predator.mass), # Predator histogram
hist(log10(MyDF$Predator.mass), # Predator histogram
     xlab="log10(Body Mass (g))", ylab="Count", 
     col = rgb(1, 0, 0, 0.5), # Note 'rgb', fourth value is transparency
     main = "Predator-prey size Overlap") 
hist(log10(MyDF$Prey.mass), col = rgb(0, 0, 1, 0.5), add = T) # Plot prey
legend('topleft',c('Predators','Prey'),   # Add legend
       fill=c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5))) # Define legend colors


#boxplots
boxplot(log10(MyDF$Predator.mass), xlab = "Location", ylab = "log10(Predator Mass)", main = "Predator mass")

boxplot(log(MyDF$Predator.mass) ~ MyDF$Location, # Why the tilde?
        xlab = "Location", ylab = "Predator Mass",
        main = "Predator mass by location")

boxplot(log(MyDF$predator.mass) ~ MyDF$Type.of.feeding.interaction, 
        xlab = "location", ylab = "preadtor mass", 
        main = "preadtor mass by feeding interaction type")
boxplot(log(MyDF$Predator.mass) ~ MyDF$Type.of.feeding.interaction,
        xlab = "Location", ylab = "Predator Mass",
        main = "Predator mass by feeding interaction type")

#combining plot types 

par(fig=c(0,0.8,0,0.8)) # specify figure size as proportion
plot(log(MyDF$Predator.mass),log(MyDF$Prey.mass), xlab = "Predator Mass (g)", ylab = "Prey Mass (g)") # Add labels
par(fig=c(0,0.8,0.4,1), new=TRUE)
boxplot(log(MyDF$Predator.mass), horizontal=TRUE, axes=FALSE)
par(fig=c(0.55,1,0,0.8),new=TRUE)
boxplot(log(MyDF$Prey.mass), axes=FALSE)
mtext("Fancy Predator-prey scatterplot", side=3, outer=TRUE, line=-3)



#saving graphics 

pdf("../results/Pred_Prey_Overlay.pdf", # Open blank pdf page using a relative path
    11.7, 8.3) # These numbers are page dimensions in inches
hist(log(MyDF$Predator.mass), # Plot predator histogram (note 'rgb')
     xlab="Body Mass (g)", ylab="Count", col = rgb(1, 0, 0, 0.5), main = "Predator-Prey Size Overlap") 
hist(log(MyDF$Prey.mass), # Plot prey weights
     col = rgb(0, 0, 1, 0.5), 
     add = T)  # Add to same plot = TRUE
legend('topleft',c('Predators','Prey'), # Add legend
       fill=c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5))) 
graphics.off(); #you can also use dev.off() 

#ggplot

library(ggplot2)

ggplot(mpg, aes(displ, hwy, colour = class)) + 
  geom_point()

# ploting but with a red colour... how exciting !

qplot(log(Prey.mass), log(Predator.mass), 
      data = MyDF, colour = "red")
# set it to a 'real' red with this I("red")
qplot(log(Prey.mass), log(Predator.mass), 
      data = MyDF, colour = I("red"))

#changes point size (woop woop)
qplot(log(Prey.mass), log(Predator.mass), data = MyDF, size = 3) #with ggplot size mapping

qplot(log(Prey.mass), log(Predator.mass), data = MyDF, shape = 3)

qplot(log(Prey.mass), log(Predator.mass), data = MyDF, shape= I(3))

qplot(log(Prey.mass), log(Predator.mass), data = MyDF, colour + Type.of.feeding.interaction)

Predator mass, data = MyDF, colour = Type.of.feeding.interaction, alpha = I(.5))

qplot(log(Prey.mass), log(Predator.mass), data = MyDF, geom = c("point", "smooth"))


qplot(log(Prey.mass), log(Predator.mass), data = MyDF, geom = c("point", "smooth")) + geom_smooth(method = "lm")



qplot(log(Prey.mass), log(Predator.mass), data = MyDF, geom = c("point", "smooth"), 
      colour = Type.of.feeding.interaction) + geom_smooth(method = "lm")

########this one is VERY pretty ##################
qplot(log(Prey.mass/Predator.mass), data = MyDF, geom =  "density", 
      fill = Type.of.feeding.interaction, 
      alpha = I(0.5))




