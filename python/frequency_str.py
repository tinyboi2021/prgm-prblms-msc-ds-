def list_of_frequency(str1):
	frq_str={}

	for i in set(str1):
		frq_str[i]=str1.count(i)

	print(frq_str)
	
	sorted_frq=sorted(frq_str.items(),key = lambda item: item[1],reverse = True)
	for k,v in sorted_frq:
		print(f"{k}:{v}")
	
	


str1=input("enter a string ")
list_of_frequency(str1)	