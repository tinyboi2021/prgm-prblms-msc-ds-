import array as arr

usr_input=input("enter no. to inserted in array")
arr_list=(map(int,usr_input.split()))
a=arr.array('i',arr_list)

for i in range(0,len(a)):
	print(a[i])

i=0
j=(len(a)-1)

while(i<j):
	temp=a[i]
	a[i]=a[j]
	a[j]=temp
	i+=1
	j-=1

print("reversed array is ")

for i in range(0,len(a)):
	print(a[i])