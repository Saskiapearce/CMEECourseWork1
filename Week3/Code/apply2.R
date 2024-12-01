rm(list=ls())
SomeOperation <- function(v) { # the someoperation function takes the sum of v (while it is more than 0 ) and times it by 100
  if (sum(v) > 0) { #note that sum(v) is a single (scalar) value
    return (v * 100) # 100 times the sum
  } else { 
    return (v)
  }
}

M <- matrix(rnorm(100), 10, 10) # applys someoperation to the matrix
print (apply(M, 1, SomeOperation)) # 1 means apply yhis function to each row of the matrix

