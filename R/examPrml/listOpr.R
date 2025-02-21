newlist<-list(1,2,3,"hareesh")
print(newlist)
list1<-as.list(seq(1,10,2))
print(list1)
print(length(list1))
print(list1[[2]])


list2<-list(a="Hello",b="hai",name="hareesh")
list3<-list(3,1,3,5,0,1,10)

print(list2[[2]])
print(list2$name)
print(names(list2))
print(list2[["name"]])

print(str(list2))
print(length(list2))

list2$a<-"Helloworld"
print(list2)
list2[[2]]<-"yo"
print(list2)
list2<-append(list2,21)
print(list2)
list2<-append(list2,13,after=2)
print(list2)
list2<-list2[-3]
print(list2)
names(list2[[4]])<-"age"
print(list2)

print(which(unlist(list2)=="hareesh"))


print(list3)
print(sort(unlist(list3)))
list4<-as.list(sort(unlist(list3)))
print(list4)

list5<-as.list(c(list3,list4))
print(list5)

print(list5[1:5])
print(list5[[length(list5)]])

listEx<-list(id=c(01,02,03),
             name=c("john","bruce","steve"),
             mark=c(21,14,30))

print(listEx)
listEx$name=append(listEx$name,"jose")
print(listEx)
listEx$id=c(11,22,33)
print(listEx)
listEx$name=lapply(listEx$name,toupper)
print(listEx)

