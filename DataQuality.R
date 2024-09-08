library(ggplot2)
library(plotly)

data("diamond")
df <- diamonds
str(diamonds) #check the structure of the diamond dataset
summary(diamonds) # Give the summary of the diamond datasets

# Filtering for 5-carat diamonds
cheap_5_carat <- diamonds[diamonds$carat >= 4.9 & diamonds$carat <= 5.1, ]
# Filtering for 3-carat diamonds
cheap_3_carat <- diamonds[diamonds$carat >= 2.9 & diamonds$carat <= 3.1, ]

# Plot carat vs price
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  theme_minimal() +
  ggtitle("Price vs Carat of Diamonds") +
  geom_point(data = cheap_5_carat, color = 'red') +
  geom_point(data = cheap_3_carat, color = 'blue')

# Using plotly can make this more interactive so we can easily explore potential outliers.
p <- ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.6) +
  theme_minimal()
ggplotly(p)
