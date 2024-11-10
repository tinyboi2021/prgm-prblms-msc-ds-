import numpy as np

list1=[1 if i%2==0 else 0 for i in range(1,9) ]
print(list1)
arr1=np.array(list1)
print(arr1.reshape(2,4))