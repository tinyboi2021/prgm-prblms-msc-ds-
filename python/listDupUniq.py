list1=list(map(int,input("enter values into the list").split()))
print(list1)

uniq=set(list1)
print("unique values in the list are",uniq)

for i in uniq:
	print(f"the number {i} repeated {list1.count(i)} times")

