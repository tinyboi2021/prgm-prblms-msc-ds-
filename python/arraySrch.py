import array as arr

usr_input=input("enter no. to inserted in array")
arr_list=(map(int,usr_input.split()))
a=arr.array('i',arr_list)

for i in range(0,len(a)):
	print(a[i])

key=int(input("enter a key to search element inside the array"))

for i in range(0,len(a)):
	if(key==a[i]):
		print(f"the element found at {i} index")

