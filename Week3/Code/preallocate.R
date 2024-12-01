rm(list=ls())

# Function without preallocation
NoPreallocFun <- function(x) {
  a <- vector() # Initialize an empty vector
  for (i in 1:x) {
    a <- c(a, i) # Concatenate the current value to the vector
    print(a) # Print the current state of the vector
    print(object.size(a)) # Print the memory size of the vector
  }
}

# Each resizing operation creates a new copy of the vector, leading to higher memory usage and slower performance.
system.time(NoPreallocFun(10)) 

# Function with preallocation
PreallocFun <- function(x) {
  a <- rep(NA, x) # Pre-allocate a vector of size x filled with NA
  for (i in 1:x) {
    a[i] <- i # Assign the current value directly to the pre-allocated vector
    print(a) # Print the current state of the vector
    print(object.size(a)) # Print the memory size of the vector
  }
}

# Measure the execution time for PreallocFun
# The function uses a pre-allocated vector, avoiding the need for repeated memory allocation.
# This significantly reduces runtime and memory overhead, especially for large values of x.
system.time(PreallocFun(10))

