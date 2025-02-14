
data(mtcars)

png(file="C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\figures\\scatterQ4.png")

plot(mtcars$wt, mtcars$mpg, 
     main="Scatterplot of Weight vs. MPG",
     xlab="Weight (wt)",                  
     ylab="Miles Per Gallon (mpg)",       
     xlim=c(1, 6),                         
     ylim=c(10, 35),                       
     pch=19,                               
     col="blue"                            
     )

dev.off()