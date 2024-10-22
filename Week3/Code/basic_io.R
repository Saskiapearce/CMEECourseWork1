source("basic_io.R")

getwd()

Mydata <- read.csv("../data/trees.csv")
ls(pattern = "my*")

class(Mydata)
head(Mydata)
str(MyData)

MyData <- read.csv("../data/trees.csv", header = F)
head(MyData)

MyData <- read.table("../data/trees.csv", sep = ',', header = TRUE)
head(MyData)

write.csv(MyData, "../Results/MyData.csv")

