class cart:
	def __init__(self):
		self.my_dict={}
		
	def insert(self,item,price):
		self.my_dict[item]=price
		print(f" item {item} is added with price{price}")
		
	def delete(self,item):
		self.my_dict.pop(item)
		print(f" the item {item} is deleted")
		
	def display(self):
		print("items	price\n--------------")
		total=0
		for item,price in self.my_dict.items():
			total+=price
			print(f"{item}	{price}")
			
		print(f"total is {total}")
			
cart1=cart()
cart1.insert("iphone",50000)
cart1.display()
cart1.insert("pixel",20000)
cart1.display()
cart1.delete("pixel")
cart1.display()
			
