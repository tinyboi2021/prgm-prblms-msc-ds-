import array as arr

def arrSrch(a,n):
	flag=False
	for i in range(0,len(a)):
		if a[i] == n:
			print("element is found at the location :",i)
			flag=True
	if(flag==False):
		print("no element is found")
	


a=arr.array('i',list(map(int,input("enter array elements").split())))
for i in range(0,len(a)):
	print(a[i],end=" ")

n=int(input("enter a element to search inside the array"))
arrSrch(a,n)



