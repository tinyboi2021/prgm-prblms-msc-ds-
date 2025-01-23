print("enter element to form a vector")
vector<-as.numeric(unlist(strsplit(readline()," ")))
print(vector)

print("enter an element to find")
x<-as.numeric(readline())

i=1
flag=FALSE
for(i in i:length(vector)){
  if(x==vector[i]){
    flag=TRUE
  }
}
if(flag==TRUE){
  print("element is  found")
  
}else{
  print("element is not found")
}