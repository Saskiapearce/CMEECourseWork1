rm(list=ls())
#if statements
#if creates two conditional states, which can be used to break loops or, and\or states 
# if A is true, print true 
# if A is false, print false
a <- TRUE
if (a == TRUE) {
  print ("a is TRUE")
} else {
  print ("a is FALSE")
}

# If z is more than or less than half
z <- runif(1) ## Generate a uniformly distributed random number
if (z <= 0.5) {print ("Less than a half")}


#for 1-10, print the square roots
#for loops can have more states, allowing iterations for numbers below a thresshold etc....
for (i in 1:10) {
  j <- i * i
  print(paste(i, " squared is", j ))
}

# Print species names 
for(species in c('Heliodoxa rubinoides', 
                 'Boissonneaua jardini', 
                 'Sula nebouxii')) {
  print(paste('The species is', species))
}

# Print a, bc, def (words in the list)
v1 <- c("a","bc","def")
for (i in v1) {
  print(i)
}

#Starting with 0, between 1-10, print (n + 1)^2
i <- 0
while (i < 10) {
  i <- i+1
  print(i^2)
}
