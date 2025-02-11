# Load the mtcars dataset
data(mtcars)

# Create the scatterplot
plot(mtcars$wt, mtcars$mpg, 
     main="Scatterplot of Weight vs. MPG",  # Title of the plot
     xlab="Weight (wt)",                   # Label for the x-axis
     ylab="Miles Per Gallon (mpg)",        # Label for the y-axis
     xlim=c(1, 6),                         # Set the x-axis limit (for wt)
     ylim=c(10, 35),                       # Set the y-axis limit (for mpg)
     pch=19,                               # Point type (solid circle)
     col="blue"                            # Color of the points
)
