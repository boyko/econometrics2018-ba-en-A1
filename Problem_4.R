# Assignment 1 Problem 3

# a)

# Install packages. Uncomment the next line and run it if dplyr and ggplot2 are not installed in your R instance.
install.packages('dplyr')

# Load the packages
# You need to install packages only once, but in order to use them
# you need to load them every time you start a new R session.
library(dplyr)
library(ggplot2)

# b)
wines <- read.csv(file='https://s3.eu-central-1.amazonaws.com/sf-timeseries/data/wine.csv')
str(wines)
wines

# c)
wines <- within(wines, {
  Price <- exp(LogPrice)
})

# d)
wines <- within(wines, {
  TemperatureClass <- ifelse(Temperature > mean(Temperature), 'hot', 'cold')
})

# e)
table(wines$TemperatureClass)

# f)
winesByTempClass <- group_by(wines, TemperatureClass)

summarise(winesByTempClass,
          mean = mean(Price),
          sd = sd(Price),
          min = min(Price),
          max = max(Price),
          median = median(Price)
)
