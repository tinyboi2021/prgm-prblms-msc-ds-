
data(mtcars)
png(file="C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\figures\\triscatterQ5.png")

pairs(mtcars, 
      pch=17,                       
      col="red",                   
      main="Matrix Scatterplot of mtcars", 
      lower.panel=NULL)             


dev.off()