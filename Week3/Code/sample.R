######### Functions ##########
rm(list=ls())
## A function to take a sample of size n from a population "popn" and return its mean
myexperiment <- function(popn,n) {
  pop_sample <- sample(popn, n, replace = FALSE)
  return(mean(pop_sample))
}

## Calculate means using a FOR loop on a vector without preallocation:
loopy_sample1 <- function(popn, n, num) {
  result1 <- vector() # Initialize empty vector (grows dynamically)
  for(i in 1:num) {
    result1 <- c(result1, myexperiment(popn, n)) # Appends to vector in every iteration
  }
  return(result1)
}

## To run "num" iterations of the experiment using a FOR loop on a vector with preallocation:
loopy_sample2 <- function(popn, n, num) {
  result2 <- vector(,num) # Preallocate vector of size 'num'
  for(i in 1:num) {
    result2[i] <- myexperiment(popn, n) # Fill preallocated positions
  }
  return(result2)
}

## To run "num" iterations of the experiment using a FOR loop on a list with preallocation:
loopy_sample3 <- function(popn, n, num) {
  result3 <- vector("list", num) # Preallocate a list of size 'num'
  for(i in 1:num) {
    result3[[i]] <- myexperiment(popn, n) # Fill preallocated positions in the list
  }
  return(result3)
}

## To run "num" iterations of the experiment using vectorization with lapply:
lapply_sample <- function(popn, n, num) {
  result4 <- lapply(1:num, function(i) myexperiment(popn, n)) # Apply function for each iteration
  return(result4)
}

## To run "num" iterations of the experiment using vectorization with sapply:
sapply_sample <- function(popn, n, num) {
  result5 <- sapply(1:num, function(i) myexperiment(popn, n)) # Apply function and simplify output
  return(result5)
}

set.seed(12345)
popn <- rnorm(10000) # Generate the population
hist(popn)

n <- 100 # Sample size for each experiment
num <- 10000 # Number of times to rerun the experiment

# Measure execution time for each method
print("Using loops without preallocation on a vector took:" )
print(system.time(loopy_sample1(popn, n, num)))
# This is the slowest method because appending to a vector dynamically reallocates memory during each iteration.

print("Using loops with preallocation on a vector took:" )
print(system.time(loopy_sample2(popn, n, num)))
# Faster than method 1 because memory is preallocated, avoiding repeated memory reallocation.

print("Using loops with preallocation on a list took:" )
print(system.time(loopy_sample3(popn, n, num)))
# Similar performance to vector preallocation (method 2), but lists are slightly less efficient for numeric operations.

print("Using the vectorized sapply function (on a list) took:" )
print(system.time(sapply_sample(popn, n, num)))
# Efficient due to vectorization and optimized for simpler outputs. Typically faster than loops.

print("Using the vectorized lapply function (on a list) took:" )
print(system.time(lapply_sample(popn, n, num)))
# Slightly slower than `sapply` because the output is not automatically simplified; remains as a list.

## Performance Summary:
# `loopy_sample1` (no preallocation): Very slow due to dynamic memory allocation.
#`loopy_sample2` (vector preallocation): Faster because memory is preallocated
#  `loopy_sample3` (list preallocation): Similar to vector preallocation but not as  efficient
# `lapply_sample`: Faster than loops because it uses vectorized operations and avoids iteration over and over
#  `sapply_sample`: Slightly faster than `lapply` because it simplifies the result automatically.

## Recommendation:
# Use `sapply` or `lapply` for better performance and cleaner code in iterative tasks where possible.
