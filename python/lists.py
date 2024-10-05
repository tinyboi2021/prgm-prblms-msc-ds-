lst1=list(range(1,11))
#print(lst1)

lst1.append(11)
#print(lst1)

lst1.remove(5)
#print(lst1)

lst1.insert(0,0)
print("the final list is ",lst1)

for i in lst1:
	print(i)

newlist=[x*x for x in lst1]

print("sqare values of the list elemtents",newlist)


print(lst1[0])
print(lst1[-1])
print(lst1[:5])
print(lst1[::2])

matrix=[[1,2,3],[4,5,6],[7,8,9]]
for row in matrix:
	print(row)

print(matrix[1][2])

for row in matrix:
	for i in row:
		print(i,end=' ')