# Load necessary libraries
library(forecast)
library(ggplot2)

# Step 1: Create a time series data
set.seed(123) # For reproducibility
n <- 120  # Number of data points (10 years of monthly data)

# Simulating time series data with trend, seasonality, and noise
time <- 1:n
seasonality <- sin(2 * pi * time / 12)  # Annual seasonality (12 periods)
trend <- 0.5 * time  # Linear trend
noise <- rnorm(n, mean = 0, sd = 2)  # Random noise

data <- trend + seasonality + noise  # Combine trend, seasonality, and noise
ts_data <- ts(data, frequency = 12)  # Monthly data (12 months per year)

# Step 2: Visualize the time series data
plot(ts_data, main="Simulated Time Series Data", ylab="Value", xlab="Time", col="blue")

# Step 3: Decompose the time series into components
decomposed_ts <- decompose(ts_data)
plot(decomposed_ts)

# Step 4: Apply Exponential Smoothing for Forecasting
# Fit a Holt-Winters Exponential Smoothing model
fit <- HoltWinters(ts_data)

# Step 5: Forecasting the next 12 months (1 year)
forecasted_values <- forecast(fit, h=12)

# Plot the forecast
plot(forecasted_values, main="Exponential Smoothing Forecast", ylab="Value", xlab="Time", col="blue")
