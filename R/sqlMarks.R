#install.packages("RMySQL") 
library("RMySQL")  
mysql_connect=dbConnect(MySQL(),user='root',password ='',dbname = 'db1',host = 'localhost')  
dbListTables(mysql_connect)
emp.data<- data.frame(  
  Roll_no=c(1,2,3,4,5,6),
  Name = c("Anil","Gokul","Hema","Meenu","Divya","Tinu"),    
  mark = c(89,74,99,56,74,69)     
)   
is.data.frame(emp.data)
dbSendQuery(mysql_connect, "SET GLOBAL local_infile = true;")

dbWriteTable(mysql_connect,"empnew3",emp.data,overwrite = TRUE,row.names=FALSE)  

record = dbSendQuery(mysql_connect, "select * from empnew3")  
  
data_frame = fetch(record, n = 10)  
print(data_frame)  

dbClearResult(record)

dbExecute(mysql_connect,"INSERT INTO empnew3(Roll_no,Name,Mark) VALUES(7,'John',50);")
record = dbSendQuery(mysql_connect, "select * from empnew3;")

data_frame = fetch(record, n = 10)  
print(data_frame) 

dbClearResult(record)

dbExecute(mysql_connect,"DELETE FROM empnew3 WHERE mark=89;")
record = dbSendQuery(mysql_connect, "select * from empnew3;")

data_frame = fetch(record, n = 10)  
print(data_frame) 

dbClearResult(record)

record = dbSendQuery(mysql_connect, "select * from empnew3 where mark=74;")

data_frame = fetch(record, n = 10)  
print("details of the student with 74 mark")
print(data_frame) 

dbClearResult(record)
 