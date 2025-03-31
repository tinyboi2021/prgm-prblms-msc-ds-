studList<-list(student_id=c(01,02,03,04,05),
               student_name=c("john","jacob","tom","mark","philip"),
               student_mark=c(20,30,50,11,49))
cat("list with student details")
print(studList)

studList$student_id <- append(studList$student_id, 06)
studList$student_name <- append(studList$student_name, "stephen")
studList$student_mark <- append(studList$student_mark, 25)


print(studList)


studList$student_id=studList$student_id+1

print(studList)