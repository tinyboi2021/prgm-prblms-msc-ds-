dict1={
	'name':"Alice",
	'age':22,
	'major':"Computer Science"

	}
print(dict1)

dict1['GPA']=3.8
dict1['age']=23
dict1.pop('major')
print("the updated dictionary\n",dict1)

dict1.update({'GPA':4.0})
print("updated GPA\n",dict1)

print("the keys inside the dictionary")
for x in dict1.keys():
	print(x)

print("the values inside the dictionary")
for y in dict1.values():
	print(y)

for key,value in dict1.items():
	print(f"{key}:{value}")


movie_db = {
'Inception': {'director': 'Christopher Nolan', 'year': 2010, 'rating': 8.8},
'The Matrix': {'director': 'The Wachowskis', 'year': 1999, 'rating': 8.7},
'Parasite': {'director': 'Bong Joon-ho', 'year': 2019, 'rating': 8.6}
}

key=movie_db['Inception']
print(key['director'])

movie_db['the batman']={'director': 'Matt Reevs', 'year': 2022, 'rating': 7.8}

movie_name=input("enter the movie name that added to the dictionary ")
keys=movie_db['Inception'].keys()
movie_details={}
for i in keys:
	movie_details[i]=input(f"enter the {i}:")

movie_db[movie_name]=movie_details
print(movie_db) 