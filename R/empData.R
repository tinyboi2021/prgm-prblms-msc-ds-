#install.packages("RMySQL") 
library("RMySQL")  
mysql_connect=dbConnect(MySQL(),user='root',password ='',dbname = 'test',host = 'localhost')  
dbListTables(mysql_connect)

salary.data<-data.frame(Empid=c(111,222,333,444,555,666),
                       Name=c("AAA","BBB","CCC","DDD","EEE","FFF"),
                       Salary=c(20000,17000,25000,30000,32000,36000))

is.data.frame(marks.data)
dbSendQuery(mysql_connect, "SET GLOBAL local_infile = true;")

dbWriteTable(mysql_connect,"salaryData",marks.data,overwrite = TRUE,row.names=FALSE)
record = dbSendQuery(mysql_connect, "select * from salaryData;")

data_frame = fetch(record, n = 10)  
print(data_frame) 

dbClearResult(record)

dbExecute(mysql_connect,"INSERT INTO salaryData(Empid,Name,Salary) VALUES(777,'EEE',50000);")
record = dbSendQuery(mysql_connect, "select * from salaryData;")

data_frame = fetch(record, n = 10)  
print(data_frame) 

dbClearResult(record)

dbExecute(mysql_connect,"DELETE FROM salaryData WHERE Salary=32000;")

record = dbSendQuery(mysql_connect, "select * from salaryData;")

data_frame = fetch(record, n = 10)  
print(data_frame) 

dbClearResult(record)


record = dbSendQuery(mysql_connect, "select * FROM salaryData WHERE Salary>=30000;")

data_frame = fetch(record, n = 10)  
print(data_frame) 
write.csv(data_frame,"~/salaryData.csv")

