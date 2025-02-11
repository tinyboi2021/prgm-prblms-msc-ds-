
items_sold <- c(100, 120, 150, 130, 140, 160, 170, 180, 150, 140, 130, 110)

hist(items_sold, 
     main="Histogram of Items Sold Each Month",
     xlab="Month",
     ylab="Number of Items Sold", 
     col="skyblue",
     border="black",
     xlim=c(0,200), 
     xaxt="n" 
)


axis(1, at=1:12, labels=month.name, las=2)
