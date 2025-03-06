library(class)
data("mtcars")
print(mtcars)


mtcars$catmpg<-ifelse(mtcars$mpg>median(mtcars$mpg), "High","Low")
mtcars$catmpg<-factor(mtcars$catmpg)
head(mtcars)

sum(is.na(mtcars))

mtcars_clean <- na.omit(mtcars)


set.seed(123)
print(nrow(mtcars))
split<-sample(1:nrow(mtcars_clean),0.8*nrow(mtcars_clean))
train_data<-mtcars_clean[split,]
test_data<-mtcars_clean[-split,]
head(train_data)

run_knn<-function(K_values){

  predictions <- knn(
    train = train_data[, -c(1, 12)],  
    test = test_data[, -c(1, 12)],  
    cl = train_data$catmpg,        
    k = K_values                             
  )
  head(predictions)
  
  
  confusion_matrix <- table(Predicted = predictions, Actual = test_data$catmpg)
  print(confusion_matrix)
  
  
  accuracy <- mean(predictions == test_data$catmpg)
  cat("Accuracy:", accuracy)
  
}

run_knn(3)
run_knn(5)
run_knn(2)



