library(corrplot)
data("iris")
head(iris)
summary(iris)
str(iris)



plot(iris)
hist(iris$Sepal.Length)
plot(density(iris$Sepal.Width))
boxplot(iris)
plot(iris$Sepal.Length,iris$Sepal.Width)
cor(iris$Sepal.Length,iris$Sepal.Width)
#corrplot(cor(iris))


sum(is.na(iris))

z_scores <- scale(iris$Sepal.Width)
outliers <- which(abs(z_scores) > 3)
head(outliers)

Q1 <- quantile(iris$Petal.Width, 0.25)
print(Q1)
Q3 <- quantile(iris$Petal.Width, 0.75)
print(Q3)
IQR <- Q3 - Q1
outliers <- iris$Petal.Width[iris$Petal.Width < (Q1 - 1.5 * IQR) | iris$Petal.Width > (Q3 + 1.5 * IQR)]
head(outliers)


iris<-iris[,c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Length")]
head(iris)
pca <- prcomp(iris, scale = TRUE)
summary(pca)
