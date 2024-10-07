#rows,cols = map(int,input("enter the number of rows and column in the matrix").split())

rows=int(input("enter the number of rows"))
cols=int(input("enter the number of columns"))

mtx1=[]
print("enter the elements of the first matrix")
for i in range(rows):
	row = []
	print(f"enter the element in the no. {i+1} row")
	for j in range(cols):
		element=int(input())
		row.append(element)
	mtx1.append(row)
	
	
mtx2=[]
print("enter the elements of the second matrix")
for i in range(rows):
	row = []
	print(f"enter the element in the no. {i+1} row")
	for j in range(cols):
		element=int(input())
		row.append(element)
	mtx2.append(row)



print("the sum of two matrices are:")	
sum=[]
for i in range(rows):
	row = []
	for j in range(cols):
		element=mtx1[i][j]+mtx2[i][j]
		row.append(element)
	sum.append(row)

for i in sum:
	for elements in i:
		print(elements,end='   ')
	print("\n")
	

print("the transpose of two  matrices are:")
trnsps=[]
for i in range(rows):
	row = []
	for j in range(cols):
		element=sum[j][i]
		row.append(element)
	trnsps.append(row)

for i in trnsps:
	for elements in i:
		print(elements,end='   ')
	print("\n")
