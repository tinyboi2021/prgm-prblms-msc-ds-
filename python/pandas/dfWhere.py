import pandas as pd

data={
	'X':[1,7,3],
	'Y':[4,3,6],
	'Z':[7,8,9]
	
	}
df1=pd.DataFrame(data)
print(df1)
print(df1[(df1['X']>5) & (df1['Y']<5)])

