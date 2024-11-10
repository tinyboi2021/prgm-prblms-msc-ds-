from datetime import datetime
class person:
	def __init__(self,name,country,year):
		self.name=name
		self.country=country
		self.year=year
	def __lt__(self,other):
		thisYear=datetime.now().year
		age1=thisYear-self.year
		age2=thisYear-other.year
		if(age1<age2):
			return f"the age of {self.name}  is greater than {other.name}"
		else:
			return f"the age of {other.name} is greater than {self.name}"


person1=person("hareesh","india",1992)
person2=person("guy2","india",1998)

print(person1<person2)