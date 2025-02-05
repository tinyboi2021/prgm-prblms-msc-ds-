#install.packages("xlsx")

any(grepl("xlsx",installed.packages()))


library("xlsx")
excel_data<- read.xlsx("C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\Qdata.xlsx", sheetIndex = 1)
print(excel_data)
excel_data[] <- lapply(excel_data, function(x) trimws(tolower(as.character(x))))

excel_data_unique <- unique(excel_data)
print("unique data")
print(excel_data_unique)

excel_data_unique <- rbind(excel_data_unique,data.frame(PRODUCT="eraser",NUMBER=4))
print(excel_data_unique)

write.xlsx(excel_data_unique, "C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\DataRmod.xlsx")
print(excel_data_unique[excel_data_unique$NUMBER==2,])

