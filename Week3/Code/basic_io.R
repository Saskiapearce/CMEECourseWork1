rm(list=ls())
Mydata <- read.csv("../Data/trees.csv") #Load data in using a relative pathway
ls(pattern = "my*")

MyData <- read.csv("../Data/trees.csv", header = F) # read a csv 

MyData <- read.table("../Data/trees.csv", sep = ',', header = TRUE) # read a table 

write.csv(MyData, "../Results/MyData.csv") # write a csv

