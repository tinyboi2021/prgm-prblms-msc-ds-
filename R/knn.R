library(class)
library(caret)
library(ggplot2)

data("mtcars")
mtcars$am <- as.factor(mtcars$am)
normalize <- function(x) { return((x-min(x))/(max(x)-min(x))) }
mtcars_norm <- as.data.frame(lapply(mtcars[,-which(names(mtcars)=="am")],normalize))
mtcars_norm$am <- mtcars$am
head(mtcars_norm)

set.seed(42)
train_index <- sample(1:nrow(mtcars_norm), 0.8*nrow(mtcars_norm))
train_data <- mtcars_norm[train_index,]
test_data <- mtcars_norm[-train_index,]
train_X <- train_data[,-which(names(train_data)=="am")]
train_Y <- train_data$am
test_X <- test_data[,-which(names(train_data)=="am")]
test_Y <- test_data$am

k_value <- c(3,5,7)
perform_knn <- function(k){
  predicted_Y <- knn(train_X, test_X, train_Y, k=k)
  conf_mat <- confusionMatrix(predicted_Y, test_Y)
  print(paste("Confusion Matrix for K =",k))
  print(conf_mat$table)
  accuracy <- conf_mat$overall["Accuracy"]
  print(paste("Accuracy for K = ",k," : ",round(accuracy*100,2),"%"))
}

for(k in k_value){
  perform_knn(k)
}
