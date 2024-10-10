def noOfFact(n):
	fact=1
	for i in range(1,n+1):
		fact*=i
	print("factorial of the number is ",fact)
	count=0
	while(fact!=fact//10):
		fact//=10
		count+=1
	print("number of digits in the factorial is ",count)

n=int(input("enter a number to find factorial"))
noOfFact(n)
	