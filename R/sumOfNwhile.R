
n <- as.integer(readline(prompt = "Enter a positive integer: "))


sum <- 0
i <- 1


while (i <= n) {
  sum <- sum + i
  i <- i + 1
}


cat("The sum of the first", n, "natural numbers is:", sum, "\n")