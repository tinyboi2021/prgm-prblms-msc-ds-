datas=c(3,55,63,66,88,89,99,232)
mean(datas)

median(datas)
sd(datas) 
var(datas)

mean(datas,na.rm = TRUE)


range(datas)
boxplot(datas,main="Boxplot of the dataset",ylab="values")


library(plyr)
  
quantile(datas)
quart<-quantile(datas)

IQR(datas)
