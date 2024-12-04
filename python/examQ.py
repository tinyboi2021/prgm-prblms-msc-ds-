names="Alice,Bob,Charlie,David"
lst1=names.split(',')
print([ x for x in lst1 if len(x)>=5])
print(sorted(lst1,reverse=True))