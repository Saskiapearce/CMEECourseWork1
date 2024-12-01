rm(list=ls())
Mydata <- read.csv("../Data/trees.csv")
ls(pattern = "my*")

MyData <- read.csv("../Data/trees.csv", header = F)

MyData <- read.table("../Data/trees.csv", sep = ',', header = TRUE)

write.csv(MyData, "../Results/MyData.csv")

