# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using  the trigonometric formula 
#
# height = distance * tan(radians)
Treedata <- read.csv("../data/trees.csv")
# ARGUMENTS
# degrees:   The angle of elevation of tree
# distance:  The distance from base of tree (e.g., meters)
#
# OUTPUT
# The heights of the tree, same units as "distance"

TreeHeight <- function(degrees, distance) {
  radians <- degrees * pi / 180
  height <- distance * tan(radians)
  print(paste("Tree height is:", height))
  
  return (height)
}

Treedata$Tree.Height.m  <- TreeHeight(Treedata$Angle.degrees, Treedata$Distance.m) #applyes function and creates a new colum for it 

write.csv(Treedata, "../results/TreedataR.csv", row.names = FALSE) 

