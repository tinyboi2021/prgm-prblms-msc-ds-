import numpy as np

arr1=np.array(np.arange(1,11))
print(arr1)


arr2=np.array(np.arange(1,11).reshape(2,5))
print(arr2)
print(arr2[1,1:3])

arr3=np.array(np.arange(1,11))
arr4=np.array(np.arange(11,21))

print(arr3+arr4)
print(arr4-arr3)
print(arr3*arr4)
arr3=arr3.reshape(2,5)
arr4=arr4.reshape(2,5)
print(np.concatenate((arr3,arr4),axis=0))
print(np.concatenate((arr3,arr4),axis=1))