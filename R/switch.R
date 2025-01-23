add<-function(a,b){
  return(a+b)
}
sub<-function(a,b){
  return(a-b)
}
mul<-function(a,b){
  return(a*b)
}
div<-function(a,b){
  if(b==0){
    return("divition by zero")
  }
  return(a/b)
}

calculator<-function(){
  print("enter number a")
  a=as.numeric(readline())
  print("enter number b")
  b=as.numeric(readline())
  
  print("choose operation(add ->1. , sub -> 2. ,multiply -> 3 ,divide -> 4 )")
  operation=readline()
  print(operation)
  
  result<-switch(operation,
                    "1"=add(a,b),
                    "2"=sub(a,b),
                    "3"=mul(a,b),
                    "4"=div(a,b),
                    "invalid operation")
  cat("result",result,"\n")
}
calculator()