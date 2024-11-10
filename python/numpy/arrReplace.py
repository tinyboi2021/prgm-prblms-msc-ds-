import numpy as np

arr=np.array(np.arange(0,10))
print(arr)
arr[np.where(arr%2 != 0)]=-1
print(arr)