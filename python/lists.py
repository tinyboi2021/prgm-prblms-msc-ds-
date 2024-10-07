#Part 1: Lists

#A list of integers from 1 to 10
lst1=list(range(1,11))
#print(lst1)

#value 11 is added to the list
lst1.append(11)
#print(lst1)

#remove 5 from the list
lst1.remove(5)
#print(lst1)

#insert 0 at the beginning
lst1.insert(0,0)
print("the final list is ",lst1)


#iterating through list
print("elements inside the lists are")
for i in lst1:
	print(i,end=" ")


#list with the sqauare of the elements
newlist=[x*x for x in lst1]

print("\n sqare values of the list elemtents \n ",newlist)


print("the first element ",lst1[0])
print("last element ",lst1[-1])
print("first 5 elements ",lst1[:5])
print("every second element ",lst1[::2])

#a matrix with values ranging from 1 to 9

matrix=[[1,2,3],[4,5,6],[7,8,9]]
print("\n the matrix is \n")
for row in matrix:
	print(row)

print("element in the second row, third column ",matrix[1][2])

#iterating through each elements using nested loop
print("each elements in the matrix")
for row in matrix:
	for i in row:
		print(i,end=' ')