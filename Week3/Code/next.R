rm(list=ls())
# running script with give you the values between 1-10 that are not devisiable by 10
for (i in 1:10) {
  if ((i %% 2) == 0) # check if the number is odd
    next #pass to next iternation of the loop
  print(i) 
}
