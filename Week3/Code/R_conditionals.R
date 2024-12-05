# Clear the workspace
rm(list = ls())

# Function to check if an integer is even
is.even <- function(n = 2) {
  # Ensure the input is numeric
  if (is.na(n)) {
    return("Input is NA. Please provide a valid numeric value.") #  if no value is given 
  }
  if (!is.numeric(n)) {
    return("Input is not numeric. Please provide a numeric value.") # if input value is not numeric 
  }
  if (n %% 1 != 0) {
    return(paste(n, "is not an integer.")) # if n is not an integer #value which is devided by 1
  }
  
  # Check if the number is even
  if (n %% 2 == 0) {
    return(paste(n, "is even!"))
  } else {
    return(paste(n, "is odd!"))
  }
}

# Test case for is.even function
is.even(6) # Expected: "6 is even!"

# Function to check if a number is a power of 2
is.power2 <- function(n = 2) {
  # Ensure the input is numeric and positive
  if (is.na(n)) {
    return("Input is NA. Please provide a valid numeric value.")
  }
  if (!is.numeric(n)) {
    return("Input is not numeric. Please provide a numeric value.")
  }
  if (n <= 0) {
    return(paste(n, "is not a positive number."))
  }
  
  # Check if the number is a power of 2
  if (log2(n) %% 1 == 0) {
    return(paste(n, "is a power of 2!"))
  } else {
    return(paste(n, "is not a power of 2!"))
  }
}

# Test case for is.power2 function
is.power2(4) # Expected: "4 is a power of 2!"

# Function to check if a number is prime
is.prime <- function(n) {
  # Handle edge cases
  if (is.na(n)) {
    return("Input is NA. Please provide a valid numeric value.")
  }
  if (!is.numeric(n)) {
    return("Input is not numeric. provide a numeric value.")
  }
  if (n %% 1 != 0 || n < 0) {
    return(paste(n, "is not a non-negative/ non decimal integer."))
  }
  
  # Special cases
  if (n == 0) {
    return(paste(n, "is a zero!"))
  } else if (n == 1) {
    return(paste(n, "is just a unit!"))
  }
  
  # Check divisibility
  ints <- 2:(n-1) # Optimize by checking up to the square root of n
  if (all(n%%ints!=0)) {
    return(paste(n, "is a prime!"))
  } else {
    return(paste(n, "is not a prime!"))
  }
}



# Testing functions ! :) 
is.prime(3) # Expected: "3 is a prime!"
is.even(NA)         # Expected: "Input is NA. Please provide a valid numeric value."
is.power2(-4)       # Expected: "-4 is not a positive number."
is.prime(0.5)       # Expected: "0.5 is not a non-negative integer."
is.prime("hello")   # Expected: "Input is not numeric. Please provide a numeric value."

