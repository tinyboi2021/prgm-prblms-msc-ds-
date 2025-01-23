dfEg<-data.frame(SNo=c(1,2,3,4,5),
                 Age=c(23,25,26,24,21),
                 Name=c("john","Seema","Any","Bob","Alice"))

print(dfEg)
dfEg$Age[dfEg$Name=="Alice"]<-22

print("dataframe after updating alice s age\n")
print(dfEg)

dfEg<-rbind(dfEg,c(6,25,"Elsa"))
print("dataframe after adding new row\n")
print(dfEg)