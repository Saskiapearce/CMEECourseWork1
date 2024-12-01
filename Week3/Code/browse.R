rm(list=ls())
  
Exponential <- function(N0 = 1, r = 1, generations = 10) { # create exponetial function 
  # Runs a simulation of exponential growth
  # Returns a vector of length generations
  
  N <- rep(NA, generations)    # Creates a vector of NA
  
  N[1] <- N0
  for (t in 2:generations) { # for t in generation s, expoentially increase the population 
    N[t] <- N[t-1] * exp(r)
    #browser() commented out the debugging point
  }
  return (N)
}

plot(Exponential(), type="l", main="Exponential growth") # plot exponential growth plot for bacterial communities

#Browse[1]>
  