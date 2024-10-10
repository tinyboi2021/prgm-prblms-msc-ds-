class subMarks:
	def __init__(self,name,sub1,sub2,sub3):
		self.name=name
		self.sub1=sub1
		self.sub2=sub2
		self.sub3=sub3
	
	def display(self):
		print(f"name is {self.name} marks are 1= {self.sub1} 2= {self.sub2} 3= {self.sub3}")


students = []
n=int(input("enter total number of students"))
for i in range(n):
	name = input(f"student {i+1} name")
	sub1 = int(input("subject 1 mark"))
	sub2 = int(input("subject 2 mark"))
	sub3 = int(input("subject 3 mark"))
	
	students.append(subMarks(name,sub1,sub2,sub3))

for student in students:
	student.display()