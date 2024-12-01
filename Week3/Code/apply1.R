## Build a random matrix
rm(list = ls())
M <- matrix(rnorm(100), 10, 10) #you dont want to apply tapply to a datafram as first it is coerce into a matrix and then you might loss important imformation about the data as matrixs can only handle 1 data type 

## Take the mean of each row
RowMeans <- apply(M, 1, mean) # vector of the mean for each row in M.
print (RowMeans)

## Now the variance
RowVars <- apply(M, 1, var) # vector of the variance for each row in M.
print (RowVars)

## By column
ColMeans <- apply(M, 2, mean) # vector of the mean for each column in M.
print (ColMeans)