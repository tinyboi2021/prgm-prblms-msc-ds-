import pandas as pd

data={
	'X':[1,7,3],
	'Y':[4,3,6],
	'Z':[7,8,9]
	
	}
df1=pd.DataFrame(data)
df1['A']=[10,20,30]
print(df1)
print(df1[(df1['X']>5) & (df1['Y']<5)])
print(df1.where((df1['X']>5) & (df1['Y']<5)).dropna().astype(int))
