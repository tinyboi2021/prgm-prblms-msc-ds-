#install.packages("openxlsx")  
library(openxlsx)
library(arules)
library(arulesViz)
library(dplyr)
library(tidyr)


df <- read.xlsx("C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\datasets\\Online Retail.xlsx", sheet = 1)
head(df)
print(colnames(df))
df <- df[!is.na(df$CustomerID), ]
print(is.data.frame(df))


df <- df[!grepl("^C", df$InvoiceNo), ]


df <- df[df$Quantity > 0, ]


df <- df[df$UnitPrice > 0, ]
head(df)


df_clean <- df[, c("InvoiceNo", "Description")]


df_clean <- unique(df_clean)


write.csv(df_clean, "transactions_fixed.csv", row.names = FALSE)


txn <- read.transactions("transactions_fixed.csv", format = "single", sep = ",", cols = c(1, 2))


inspect(txn[1:5])



summary(txn)



par(mar = c(5, 4, 4, 2))  
itemFrequencyPlot(txn, topN = 10, col = "lightblue", main = "Top 10 Frequent Items")


rules <- apriori(txn, parameter = list(support = 0.005, confidence = 0.2, minlen = 2))

summary(rules)        
inspect(head(rules, 5))

rules_sorted <- sort(rules, by = "confidence", decreasing = TRUE)


rules_milk <- subset(rules, rhs %in% "WHITE HANGING HEART T-LIGHT HOLDER")


inspect(rules_sorted[1:3])

plot(rules_sorted[1:10], method = "graph", engine = "htmlwidget")

