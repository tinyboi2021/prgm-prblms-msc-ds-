
setwd("C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\figures")
print(getwd())
png(file="boxplotQ2.png")

data <- c(3, 55, 63, 66, 88, 89, 99, 232)


summary_stats <- summary(data)
print(summary_stats)


boxplot(data, 
        main="Boxplot of Given Dataset", 
        ylab="Values", 
        col="cyan", 
        border="black")

dev.off()