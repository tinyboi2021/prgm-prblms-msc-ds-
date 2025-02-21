dfEg<-data.frame(id=letters[1:10],num=seq(10))
print(dfEg)
print(dfEg$id)
print(dfEg[1,])
print(dfEg[,2])
print(colnames(dfEg))

for(i in colnames(dfEg)){
  print(i)
}

dfEg$num2<-dfEg$num*10
print(dfEg)

newrow<-c("X",99,999)

dfEg<-rbind(dfEg[1:8,],newrow,dfEg[9:nrow(dfEg),])
print(dfEg)

dfEg$num<-NULL
print(dfEg)

dfEg<-dfEg[-5,]
print(dfEg)

print(which(dfEg$id=="h"))
print(dfEg[dfEg$num2==10,])

print(nrow(dfEg))
rownames(dfEg)=paste("row",1:nrow(dfEg),sep="-")
print(dfEg)

dfEg<-dfEg[order(dfEg$num2),]
print(dfEg)
print(dfEg$num2[3])
dfEg$id[3]<-"LLL"
print(dfEg)




BMI <- 	data.frame(
  gender = c("Male", "Male","Female"), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Age = c(42,38,26)
)
print(BMI)
str(BMI)
class(BMI)
typeof(BMI)
sapply(BMI,class)
sapply(BMI,min)

print(BMI[,2])

print(subset(BMI,weight>70))

BMIage<-subset(BMI,select = c(Age,weight))
print(BMIage)


df <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Name = c("Alice", "Bob", NA, "David", "Eve"),
  Age = c(25, NA, 35, 40, NA),
  Salary = c(50000, 55000, 60000, NA, 70000)
)
print(df)


print(is.na(df))

print(df[!is.na(df)])
df$Name[is.na(df$Name)]<-"test_name"
print(df)
print(which(is.na(df$Age)))
df_clean=na.omit(df)
df_clean
df
df$Salary[is.na(df$Salary)]<-mean(df$Salary,na.rm=TRUE)
df

df<-rbind(df,c(NA,NA,NA,NA))
df

df<-df[rowSums(is.na(df))<ncol(df),]
print(df)


