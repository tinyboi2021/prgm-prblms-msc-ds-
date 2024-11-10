import numpy as np

arr1=np.array(np.arange(0,6))
index=np.where(arr1==3)
print("the index of the element 3 is",index)

arr2=np.array(np.arange(6,13))
arr3=np.concatenate((arr2,arr1))
print(arr3)
print(np.sort(arr3))

arr3[1:6]=10

print(arr3)