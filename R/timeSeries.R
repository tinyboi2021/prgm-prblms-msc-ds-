
library(forecast)
library(ggplot2)

png(file="C:\\xampp\\htdocs\\prgm-prblms-msc-ds-\\R\\figures\\timeSeriesQ7.png")

set.seed(123)
n <- 120 


time <- 1:n
seasonality <- sin(2 * pi * time / 12)  
print(seasonality)
trend <- 0.5 * time
print(trend)
noise <- rnorm(n, mean = 0, sd = 2)  

data <- trend + seasonality + noise  
ts_data <- ts(data, frequency = 12)  


plot(ts_data, main="Simulated Time Series Data", ylab="Value", xlab="Time", col="blue")

decomposed_ts <- decompose(ts_data)
plot(decomposed_ts)



fit <- HoltWinters(ts_data)


forecasted_values <- forecast(fit, h=12)


plot(forecasted_values, main="Exponential Smoothing Forecast", ylab="Value", xlab="Time", col="blue")

dev.off()
