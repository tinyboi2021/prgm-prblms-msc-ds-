
data(mtcars)
cor_matrix <- cor(mtcars)

png(file="C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\figures\\heatmapQ6.png")

heatmap(cor_matrix, 
        main="Heatmap of Correlation Matrix", 
        col=topo.colors(10),                  
        scale="none",                         
        margins=c(8,8),                       
        cexRow=0.8, cexCol=0.8               
)

dev.off()