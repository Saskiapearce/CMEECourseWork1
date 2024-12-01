# A boilerplate R script
rm(list=ls())
MyFunction <- function(Arg1, Arg2) { # create function 
  #statements involving Arg1, Arg2: 
  print(paste("Arguement", as.character(Arg1), "is a", class(Arg1))) #print Arg1's type 
  print(paste("Arguement", as.character(Arg2), "is a", class(Arg2)))
  
  return (c(Arg1, Arg2)) #returns arguments 
}

MyFunction(1,2) # 1 and 2 will print numeric argument types
MyFunction("Riki", "Tiki") # characters will be character arguments
