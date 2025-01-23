print("enter n to find the sum of n natural numbers")
n<-as.numeric(readline())
if(n<0){
  print("enter a positive number")
}else{
sum=0
i=1

while(i<=n){
  sum=sum+i
  i=i+1
}
cat("sum of n numbers are upto",n,"are",sum)
}