import pandas as pd
import numpy as np

data={
	"Name":["Atul","Raj","Darpan","Anmol","Piyush"],
	"Designation":["Manager","Clerk","Analyst","Clerk","Manger"],
	"Salary":[56000,25000,35000,28000,58000],
	"Bonus":[15000,7000,9000,13000,12000]
	
	}

df1=pd.DataFrame(data)
df1.index=[f"EP10{i+1}" for i in df1.index ]
print(df1)
selected_columns = df1.iloc[:,0:3] # Selecting columns from index 0 to 2 (exclusive of index 3)
print(selected_columns)
print(df1.iloc[1:4])
print("salary greater than 30000")
print(df1.loc[df1["Salary"]>30000].iloc[:,0:2])