NoPreallocFun <- function(x) {
  a <- vector() # empty vector
  for (i in 1:x) {
    a <- c(a, i) # concatenate
    print(a)
    print(object.size(a))
  }
}

system.time(NoPreallocFun(10))

PreallocFun <- function(x) {
  a <- rep(NA, x) # pre-allocated vector
  for (i in 1:x) {
    a[i] <- i # assign
    print(a)
    print(object.size(a))
  }
}

system.time(PreallocFun(10))

p <- ggplot(MyDF, aes(x = log(Prey.mass), y = log(Predator.mass))) +  geom_point() + facet_wrap( .~ Location, scales = "free")
p