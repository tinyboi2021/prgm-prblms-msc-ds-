import numpy as np
arr1=np.array(np.arange(1,13).reshape(4,3))
print(arr1)
rows,cols=arr1.shape
rowSum=np.sum(arr1,axis=0)
colSum=np.sum(arr1,axis=1)
print("the sum of rows",rowSum)
print("the sum of columns ",colSum)

print("the mean of the rows is ",np.sum(rowSum)/rows)
print("the mean of the columns is ",np.sum(colSum)/cols)