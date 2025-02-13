
data <- c(3, 55, 63, 66, 88, 89, 99, 232)


summary_stats <- fivenum(data)
print(summary_stats)


boxplot(data, 
        main="Boxplot of Given Dataset", 
        ylab="Values", 
        col="lightblue", 
        border="black")

