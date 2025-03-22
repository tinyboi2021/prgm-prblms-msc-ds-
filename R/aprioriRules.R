
if (!require("arules")) install.packages("arules", dependencies=TRUE)
library(arules)


data("Groceries")


rules <- apriori(Groceries, parameter = list(support = 0.01, confidence = 0.2))


milk_rules <- subset(rules, rhs %in% "whole milk")


sorted_rules <- sort(milk_rules, by="confidence", decreasing=TRUE)


inspect(sorted_rules[1:3])
