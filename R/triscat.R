# Load the mtcars dataset
data(mtcars)

# Create a matrix scatterplot
pairs(mtcars, 
      pch=17,                       # Use triangle symbol (pch=17)
      col="blue",                   # Color of the points
      main="Matrix Scatterplot of mtcars", # Title of the graph
      lower.panel=NULL)             # Hide the lower triangle part of the matrix
