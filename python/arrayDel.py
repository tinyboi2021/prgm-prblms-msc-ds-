import array as arr

usr_input=input("enter no. to inserted in array")
arr_list=(map(int,usr_input.split()))
a=arr.array('i',arr_list)

for i in range(0,len(a)):
	print(a[i],end=' ')

key=int(input("\n enter an index to delete element inside the array"))

for i in range(key,(len(a)-1)):
	a[i]=a[i+1]
print("\n array with deleted elements")

for i in range(0,(len(a)-1)):
	print(a[i],end=' ')

	