tuple1=("red","green","blue")
print(tuple1[0])

#tuple1[0]="yellow"

print(tuple1.count("blue"))
print(tuple1.index("green"))

set1 = {1, 2, 3, 4, 5}
set2 = {4, 5, 6, 7, 8}

set3 = set1.union(set2)
print(set3)

set4 = set1.intersection(set2)
print(set4)

set5 = set1.difference(set2)
print(set4)

set1.add(9)
set1.remove(3)
print(set1)