

setwd("C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\figures")
print(getwd())
png(file="barplotQ1.png")
items_sold <- c(100, 120, 150, 130, 140, 160, 170, 180, 150, 140, 130, 110)
months <- month.name



par(mar=c(7, 4, 4, 2))


barplot(items_sold, 
        names.arg=months, 
        col="skyblue", 
        main="Items Sold Each Month", 
        xlab="Months", 
        ylab="Number of Items Sold", 
        border="black", 
        cex.names=0.8,  
        las=2)
dev.off()


