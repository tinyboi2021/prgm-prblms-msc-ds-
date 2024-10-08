def listsort(ls):
	for i in range(len(ls),0,-1):
		for j in range(i-1):
			if(ls[j]>ls[j+1]):
				ls[j],ls[j+1]=ls[j+1],ls[j]
	return ls

list1=list(map(int,input("enter numbers to insert into the list").split()))
print("the list is ",list1)
print("the sorted list is ",listsort(list1))
