import pandas as pd

# Data from the table
data = {
    "Product_Id": [101, 102, 103, 104, 105],
    "Product_name": ["laptop", "smartphone", "headphone", "laptop", "smartphone"],
    "region": ["north", "south", "north", "south", "east"],
    "sales": [5000, 7000, 3000, 6000, 4000]
}

# Create the DataFrame
df = pd.DataFrame(data)
# Display the DataFrame
print(df)
each_prod=set(df["Product_name"])
total=0
prd_ttl=pd.DataFrame({},columns=["Product_name","total"])
j=0
for i in each_prod:
	sum=df["sales"].where(df["Product_name"]==i).sum()
	prd_ttl.loc[j]=[i,sum]
	j+=1

print(prd_ttl)
print("products greater than 10000")
print(prd_ttl.where(prd_ttl["total"]>=10000).dropna())

print("product with highest sale")
print(prd_ttl.where(prd_ttl["total"]==prd_ttl["total"].max()).dropna())

tax=[]
for i in df["sales"]:
	percentage=round((10/i)*100,2)
	tax.append(f"{percentage}%")
print(tax)
df["sales_tax"]=tax
print(df)

print(df.sort_values(by="sales",ascending=True))
	


