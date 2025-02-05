n <- as.integer(readline(prompt = "enter a +ve integer :"))

sum <- 0

i <- 1

while (i <= n) {
  sum <- sum + i
  i <- i+1
}

cat("sum of ",n,"natural numbers is :",sum)
