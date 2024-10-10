wordlist=list(input("enter the sentence to reverse ").split())
#revlist=[]
#print(wordlist)

#using list

#for i in range(len(wordlist)):
#	print(len(wordlist)-i-1)
#	revlist.append(wordlist[len(wordlist)-i-1])

#using reverse function

revstr1=" ".join(reversed(wordlist))
print(revstr1)
