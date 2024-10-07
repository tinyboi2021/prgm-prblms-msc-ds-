#Part 3: Tuples and Sets

#tuple created
tuple1=("red","green","blue")
print("the first element of the tuple",tuple1[0])

#tuple1[0]="yellow"
#this statement cannot run because tuple are immutabe. so assaignment is not possible

print("the count of blue ",tuple1.count("blue")) #count of blue in the tuple
print("the index of the green",tuple1.index("green")) #index of green in the tuple

#two sets are initialized
set1 = {1, 2, 3, 4, 5}
set2 = {4, 5, 6, 7, 8}

print("\nset union \n")
set3 = set1.union(set2)
print(set3)

print("set intersection \n")
set4 = set1.intersection(set2)
print(set4)

print("set difference \n")
set5 = set1.difference(set2)
print(set4)


set1.add(9)
set1.remove(3)
print("updated set\n",set1)
print(set2)