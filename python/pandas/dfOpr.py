import pandas as pd

df1=pd.DataFrame([1,2,3],index=["red","green","blue"])
df2=pd.DataFrame([4,5,6],index=["violet","pink","yellow"])

df3=pd.concat((df1,df2),axis=1,ignore_index=True)
print(df3.fillna(-1))