import numpy as np

arr1=np.array(np.random.randint(1,101,10))
print(arr1)
bool=[True if x>50 else False for x in arr1]
print(bool) 



rain1=np.arange(50,161,10)
rain2=np.arange(40,151,10)
rain3=np.arange(30,141,10)
rain4=np.arange(60,171,10)

rainfall=np.array([rain1,rain2,rain3,rain4])

print(rainfall)

print(f"rain fall for 1st 6 monts for all cities \n{rainfall[:,:6]}")

shape=rainfall.shape
for i in range(0,shape[0]-1):
	print(f"city {i} mean is {rainfall[i,:6].mean()}")

print(f"last 3 months of city 2 {rainfall[1,9::]}")

elemAdd=rainfall[0]+rainfall[1]
print(elemAdd)
print(elemAdd.max())