#install.packages("e1071")
#install.packages("caTools")
#install.packages("rpart")
#install.packages("rpart.plot")
#install.packages("caret")
library(e1071)
library(caTools)
library(rpart)
library(rpart.plot)
library(caret)
library(party)
titanTrain<-read.csv("C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\datasets\\train.csv")
head(titanic)
print(colnames(titanTrain))

titanTest<-read.csv("C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\datasets\\test.csv")
head(titanic)
print(colnames(titanTest))

extra_column <- setdiff(colnames(titanTrain), colnames(titanTest))
print(extra_column)


print(colSums(is.na(titanTest)))
print(colSums(is.na(titanTrain)))

titanTest$Fare[is.na(titanTest$Fare)]<median(titanTest$Fare,na.rm = TRUE)
head(titanTest[,c("PassengerId","Fare")])

age_model <- rpart(Age ~ Pclass + Sex + SibSp + Parch + Fare, 
                   data = titanTrain, 
                   method = "anova")
titanTrain$Age[is.na(titanTrain$Age)] <- predict(age_model, titanTrain[is.na(titanTrain$Age), ])
head(titanTrain)
titanTest$Age[is.na(titanTest$Age)] <- predict(age_model, titanTest[is.na(titanTest$Age), ])
head(titanTest)

titanTrain <- titanTrain[, c("Survived", "Pclass", "Sex", "Age", "SibSp", "Parch", "Fare")]
titanTrain$Survived <- as.factor(titanTrain$Survived)
titanTrain$Pclass <- as.factor(titanTrain$Pclass)
titanTrain$Sex <- as.factor(titanTrain$Sex)

titanTest <- titanTest[, c("PassengerId", "Pclass", "Sex", "Age", "SibSp", "Parch", "Fare")]
titanTest$Pclass <- as.factor(titanTest$Pclass)
titanTest$Sex <- as.factor(titanTest$Sex)


tree_model <- ctree(Survived ~ ., data = titanTrain)


plot(tree_model)
predictions <- predict(tree_model, newdata = titanTest)


output <- data.frame(PassengerId = titanTest$PassengerId, Survived = predictions)
head(output)
write.csv(output, "C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\datasets\\outputs\\titanic_predictions_ctree.csv", row.names = FALSE)

print("Predictions saved successfully!")
