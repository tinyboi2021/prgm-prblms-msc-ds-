var.1<-"H"
.var<-"2"
print(class(var.1))
print(typeof(var.1))
print(ls(pattern = "var"))
#rm(var.1)
print(var.1)
var.1=c(seq(1,10,2))
print(var.1)
print(letters[1:10])
print(logical(3))
print(numeric(10))
print(vector("numeric",length=5))
results <- cat("finnstats", "for", "datascience")
results

results <- paste("finnstats", "for", "datascience")
results
nchar(results)

x<-letters[1:10]

for(i in x){
  print(i)
}
for(i in 1:5){
  print(x[i])
}
print(seq(4))

var.2<-c(6,NA,2,NA,5)
print(var.2)
print(is.na(var.2))
print(anyNA(var.2))

print(sum(var.2,na.rm=TRUE))
print(mean(var.2,na.rm=TRUE))


print(var.2[1])
print(na.omit(var.2))
var.2=var.2[!is.na(var.2)]
print(var.2)

var.3=c(letters[1:4])
print(var.3)
print(lapply(var.3,toupper))
print(sapply(var.3,toupper))

print(var.3[-c(2,3)])
print(var.3[-(2:3)])

print(var.3)
var.3<-append(var.3,"x",after=2)
print(var.3)
print(var.2)
print(var.2+2)

s<-c(4,5,8,4,5)
s<-as.factor(s)
s
print(levels(s))

s1<-factor(c("low","low","high","low","medium","medium"),levels = c("low","medium","high"),ordered = TRUE)
s1


arr<-array(c(1:10))
print(arr)
dim(arr)
dim(arr)<-c(5,2)
print(arr)
arr<-rbind(arr,c(22,22))
print(arr)
