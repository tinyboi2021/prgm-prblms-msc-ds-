#install.packages("ggplot2")


library(ggplot2)

data("iris")


head(iris)

hist(iris$Sepal.Length, 
     col = "grey", 
     main = "Histogram of Sepal Length",
     xlab = "Sepal Length", 
     ylab = "Frequency", 
     border = "black")



boxplot(Sepal.Length ~ Species, 
        data = iris, 
        col = c("red", "green", "blue"), 
        main = "Boxplot of Sepal Length Across Species", 
        xlab = "Species", 
        ylab = "Sepal Length (cm)")



plot(iris$Sepal.Length, iris$Sepal.Width, 
     col = as.factor(iris$Species),
     pch = 16,
     main = "Scatterplot of Sepal Length vs Sepal Width",
     xlab = "Sepal Length (cm)", 
     ylab = "Sepal Width (cm)")


legend("topright", legend = levels(iris$Species), 
       col = 1:3, pch = 16)
