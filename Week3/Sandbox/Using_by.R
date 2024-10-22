attach(iris)
iris 

#t apply 

tapply(x, y, sum)


#get columns means 

by(iris[,1:2], iris$Species, colMeans) #what the results are grouped by 
by(iris[,1:2], iris$Petal.Width, colMeans)


#replicate 
replicate(10, runif(5)) #

#ddply is goof dor function application 
#“ddply” means: take a data frame, split it up, do something to it, and return a data frame.