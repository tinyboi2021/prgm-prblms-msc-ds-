import numpy as np

def arrOpr(arrA,arrB):
	ans=((arrA+arrB)*((-arrA)/2))
	return ans.astype(int)


arr1=np.array(np.arange(0,5))
arr2=np.array(np.arange(5,10))
print(arrOpr(arr1,arr2))
arr1=np.array(np.arange(0,6).reshape(2,3))
arr2=np.array(np.arange(6,12).reshape(2,3))
print(arrOpr(arr1,arr2))