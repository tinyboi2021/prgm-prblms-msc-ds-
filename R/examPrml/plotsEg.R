data("mtcars")
print(mtcars)

cylinders<-mtcars$cyl

barplot(table(mtcars$cyl), 
        main = "Histogram of Engine Configurations", 
        xlab = "Number of Cylinders", 
        ylab = "Count", 
        col = "skyblue", 
        border = "black", 
        las = 1,
        ylim = c(0,max(table(mtcars$cyl))))

boxplot(mpg~cyl,data = mtcars,
        main ="cars performance horse power",
        ylab ="horse pwd(hp)",
        col="lightgreen")

pie(table(mtcars$cyl),
        main="engine cylinders")

plot(mpg ~ hp, data=mtcars, col="blue", pch=16, main="MPG vs HP", xlab="Horsepower", ylab="Miles per Gallon")
pairs(mtcars[, c("mpg", "hp", "wt")], col="blue")

#install.packages("scatterplot3d")
library(scatterplot3d)
scatterplot3d(mtcars$mpg,mtcars$disp,mtcars$hp,color = "blue",pch=19,main="3d scatter of cars perfomance and mpg")


counts <- matrix(c(10, 20, 30, 15, 25, 35), nrow=2)
barplot(counts, beside=TRUE, col=c("red", "blue"), legend.text=c("Group A", "Group B"))

heatmap(as.matrix(mtcars), col=heat.colors(10), main="Heatmap of mtcars")

library(corrplot)
corr_matrix <- cor(mtcars)
corrplot(corr_matrix, method="number")



