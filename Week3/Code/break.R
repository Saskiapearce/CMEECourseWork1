rm(list=ls())

i <- 0 #Initialize i 
while (i < Inf) { # goes on infinitely
  if (i == 10) { # checks if the value of the variable i is equal to 10, if it is, break the infinite cycle
    break 
  } else { #break out of the loop !
    cat("i equals ", i , "\n")
    i <- i + 1 #update i 
    }
}

