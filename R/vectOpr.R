vector=c(4,NA,6,3,18,2)
vec1 <- vector[!is.na(vector)]
cat("vector with NA removed:",vec1)
vec2 <- vec1[vec1%%3==0]
cat("vector with values that are divisible by 3 is:",vec2)
cat("the type of new vector is",typeof(vec2))