csv_data <- read.csv("C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\TestPrice.csv")

print(data)
print(csv_data[csv_data$Price==max(csv_data$Price),])
csv_new <- csv_data[csv_data$Price>150,]
print(csv_new)
write.csv(csv_new,"C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\TestPriceNew.csv")