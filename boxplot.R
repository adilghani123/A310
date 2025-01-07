# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("10_Property_stolen_and_recovered.csv")

# Filter data for 2001 and 2010
filtered_data <- data %>%
  filter(Year %in% c(2001, 2010))

# Perform a t-test to compare the mean value of property stolen between 2001 and 2010
t_test_result <- t.test(Value_of_Property_Stolen ~ Year, data = filtered_data)

# Print the t-test result
print(t_test_result)

# Boxplot: Compare the distribution of property stolen in 2001 and 2010
ggplot(filtered_data, aes(x = factor(Year), y = Value_of_Property_Stolen, fill = factor(Year))) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Property Stolen (2001 vs 2010)",
    x = "Year", 
    y = "Value of Property Stolen"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels

# Calculate the mean of property stolen for each year
mean_values <- filtered_data %>%
  group_by(Year) %>%
  summarise(mean_value_stolen = mean(Value_of_Property_Stolen, na.rm = TRUE))

# Print the mean values for 2001 and 2010
print(mean_values)

# Bar plot: Compare the mean value of property stolen between 2001 and 2010
ggplot(mean_values, aes(x = factor(Year), y = mean_value_stolen, fill = factor(Year))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Mean Value of Property Stolen (2001 vs 2010)",
    x = "Year",
    y = "Mean Value of Property Stolen"
  ) +
  theme_minimal()



