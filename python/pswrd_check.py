special_chars=['$','#','@']

str1=input("enter a password ")
if len(str1) >= 6:
	lower = any(char.islower() for char in str1)
	upper = any(char.isupper() for char in str1)
	numeric = any(char.isnumeric() for char in str1)
	special = any(char in special_chars for char in str1)
		
	if(lower and upper and numeric and special):
		print("the given password is valid")
	else:
		print("the passowrd in not valid ! \nbe sure to add a to z , A to Z , 0 to 9 and @ # $")


else:
	print("the password is less than 6 characters ")


	

	