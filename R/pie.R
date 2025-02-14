
png(file="C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\figures\\piechartQ3.png")
data <- c(20, 59, 23, 60)


labels <- c("A", "B", "C", "D")


colors <- c("lightblue", "lightgreen", "lightpink", "lightcoral")


pie(data, 
    labels = labels,               
    main = "Pie Chart of Given Data",
    col = colors,                  
    radius = 1
)

dev.off()
