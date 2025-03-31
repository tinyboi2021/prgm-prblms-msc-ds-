
if (!require("arules")) install.packages("arules", dependencies=TRUE)
library(arules)


data("Groceries")


rules <- apriori(Groceries, parameter = list(support = 0.01, confidence = 0.2))
inspect(head(rules,5))

milk_rules <- subset(rules, rhs %in% "whole milk")
inspect(head(milk_rules,5))


sorted_rules <- sort(milk_rules, by="confidence", decreasing=TRUE)


inspect(sorted_rules[1:3])
