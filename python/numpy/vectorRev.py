import numpy as np

arr1=np.array([21,31,42])
arr1=arr1[::-1]
print(arr1)

arr2=np.array(np.arange(0,9))
arr2=arr2.reshape(3,3)
print(arr2)

arr3=np.random.randint(1,100,size=(3,3,3))
print(arr3)

arr4=np.random.uniform(1,101,size=(10,10))
print(arr4)
print(np.max(arr4))
print(np.min(arr4))

arr5=np.random.randint(1,11,size=10)
print(arr5)
arr5[np.where(arr5==np.max(arr5))]=0
print(arr5)


