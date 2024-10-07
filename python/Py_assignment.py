#PART-1 LIST

#  1. Basic List Operations:

lst = [1,2,3,4,5,6,7,8,9,10]  # list of integers from 1 to 10.

lst.append(11)   # Adding the value 11 to the list.

lst.remove(5)   # Removing the value 5 from the list.

lst.insert(0,0)   # Inserting the value 0 at the beginning of the list.

print("Final list is ",lst)    # Printing the final list.

#  2. List Iteration and Comprehensions:

print("The List is : ",end="")
for i in lst:
    print(i,end=" ")  # Printing each element.
print()

new_lst = [x*x for x in lst ]     
print("New list is ",new_lst)  # Adding squares of each element to a new list and printing it.

#  3. Indexing and Slicing:

print("First element of the list is ",lst[0])   # Printing the first element.

print("Last element of the list is ",lst[-1])    # Printing the last element using negative indexing.

print("First five elements of the list are ",lst[:5])   # Slicing first five elements.

print("Every second elements of the list are ",lst[1::2])  # Slicing every second element of the list.

#  4. Two-Dimensional Lists:

print("The Matrix is :")
matri = [[1,2,3],[4,5,6],[7,8,9]]
for row in matri:
    print(row)

print("The element in the second row, third column is",matri[1][2])   # Printing the element in the second row, third column.

#  5. Iterating through Two-Dimensional Lists:

print("The Matrix is :")
for row in matri:
    for item in row:    # Nested loop to iterate through matrix
        print(item, end=' ')    # Printing the elements
    print()

print()        

#PART-2 DICTIONARIES

#  1. Basic Dictionary Operations:

dictry = {"name":"Alice","age":22,"major":"Computer Science"}   # Creating a dictionary

dictry["GPA"]= 3.8  # Adding a new key-value pair

dictry["age"]=23   # Updating the 'age' to 23.

dictry.pop("major")   # Removing the 'major' key.

print("Dictionary is ",dictry)     # Printing the final dictionary.

#  2. Changing Dictionaries in Place:

dictry.update({"GPA":4.0})  # Changing the 'GPA' to 4.0
print("Updated dictionary is ",dictry)   # Printing the updated dictionary.

#  3. Dictionary Methods:

print(dictry.keys())    # To print all the keys in the dictionary.

print(dictry.values())    # To print all the values in the dictionary.

print(dictry.items())    # To print all the key-value pairs in the dictionary.
print()

#  4. Example: Movie Database:

movie_db = {
'Inception': {'director': 'Christopher Nolan', 'year': 2010, 'rating': 8.8},
'The Matrix': {'director': 'The Wachowskis', 'year': 1999, 'rating': 8.7},
'Parasite': {'director': 'Bong Joon-ho', 'year': 2019, 'rating': 8.6}
}

print("Director of Inception is ",movie_db['Inception']['director'])  #Printing the director of "Inception".

movie_db['Pulp Fiction']={'director': 'Quentin Tarantino', 'year': 1994, 'rating': 8.9}  #Adding a new movie to the database

print("Updated movie database is ",movie_db)  #Printing the updated dictionary.
print()

#PART 3: TUPLES and SETS

colors = ('red', 'green', 'blue')  # Creating a tuple.

print("The first element in the tuple is", colors[0])  # Printing the first element.

'''
colors[1] = 'yellow'   # Trying to update the second element.

# Error: tuple objects are immutable, hence elements cannot be reassigned.
'''
print("The count of 'blue' is", colors.count('blue'))  # Using count() to print the number of occurences of 'blue'.

print("The index of 'green' is", colors.index('green'))  # Finding the index of color green using index()
print()

set1 = {1, 2, 3, 4, 5}    # Creating two sets
set2 = {4, 5, 6, 7, 8}

print("The union of sets is", set1.union(set2))   # Finding union of sets

print("The intersection of sets is", set1.intersection(set2))   # Finding intersetion of sets

print("The difference of sets is", set1.difference(set2))  # Finding difference between sets

set1.add(9)   # Adding value 9 to set1

set1.remove(3)   # Removing value 3 from set1

print("set1:", set1)   # Printing the two sets
print("set2:", set2)