listEg=list(list("abc","def","ghi"),
            list(23,21,45),
            list(c(12,34),c(14),c(0)),
            list(TRUE,FALSE,FALSE))
print(listEg)

print("first element in the list\n") 
print(listEg[[1]][[1]])

names(listEg)<-c("strings","numbers","vetors","logical")
print("after adding names to lists")
print(listEg)

listEg$strings=append(listEg$strings,"jkl",after = 2)
print("adding element a at a specific location")
print(listEg)

listEg$numbers<-listEg$numbers[-2]
print("list after removing an element")
print(listEg)

print("4th element")
print(listEg$strings[4])

listEg$logical[3]=TRUE
print("3 element updated")
print(listEg)