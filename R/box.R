# Given dataset
data <- c(3, 55, 63, 66, 88, 89, 99, 232)

# Calculate the five-number summary
summary_stats <- fivenum(data)
print(summary_stats)

# Create a boxplot
boxplot(data, 
        main="Boxplot of Given Dataset", 
        ylab="Values", 
        col="lightblue", 
        border="darkblue", 
        notch=TRUE)

