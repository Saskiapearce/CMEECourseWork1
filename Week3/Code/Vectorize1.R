# Clear the R environment to ensure a clean workspace
rm(list = ls())

# Create a 1000x1000 matrix `M` with random uniform values
M <- matrix(runif(1000000), 1000, 1000) 

# Define a function `SumAllElements` to calculate the sum of all elements in a matrix
SumAllElements <- function(M) { 
  # Get the dimensions of the matrix
  Dimensions <- dim(M) 
  
  # Initialize a variable to store the total sum
  Tot <- 0 
  
  # Use nested loops to iterate through each element of the matrix
  for (i in 1:Dimensions[1]) {       # Loop through rows
    for (j in 1:Dimensions[2]) {     # Loop through columns
      Tot <- Tot + M[i, j]           # Add each element to the total
    }
  }
  
  # Return the total sum
  return(Tot)
}

# Print a message indicating the start of the loop-based sum calculation
print("Using loops, the time taken is:") 

# Measure and print the time taken to compute the sum using the custom `SumAllElements` function
print(system.time(SumAllElements(M)))

# Print a message indicating the start of the built-in function sum calculation
print("Using the in-built vectorized function, the time taken is:")

# Measure and print the time taken to compute the sum using the built-in `sum` function
print(system.time(sum(M))) 

# Notes:
# The built-in `sum()` function is significantly faster than the custom function 
# due to its optimized low-level implementation and vectorized operations.
