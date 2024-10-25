## Build a random matrix
M <- matrix(rnorm(100), 10, 10) #you dont want to apply tapply to a datafram as first it is coerce into a matrix and then you might loss important imformation about the data as matrixs can only handle 1 data type 

## Take the mean of each row
RowMeans <- apply(M, 1, mean)
print (RowMeans)

## Now the variance
RowVars <- apply(M, 1, var)
print (RowVars)

## By column
ColMeans <- apply(M, 2, mean)
print (ColMeans)