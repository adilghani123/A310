# Load necessary libraries
library(ggplot2)
library(dplyr)
library(scales)  # For controlling y-axis labels
# Load the dataset
data <- read.csv("10_Property_stolen_and_recovered.csv")
# Filter data for 2001 and 2010
filtered_data <- data %>%
  filter(Year %in% c(2001, 2010))
# Boxplot: Compare the distribution of property stolen in 2001 and 2010
ggplot(filtered_data, aes(x = factor(Year), y = Value_of_Property_Stolen, fill = factor(Year))) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Property Stolen (2001 vs 2010)",
    x = "Year", 
    y = "Value of Property Stolen"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels
  scale_y_continuous(labels = scales::comma_format())  # Format y-axis with commas
# Calculate the mean of property stolen for each year
mean_values <- filtered_data %>%
  group_by(Year) %>%
  summarise(mean_value_stolen = mean(Value_of_Property_Stolen, na.rm = TRUE))
# Print the mean values for 2001 and 2010
print(mean_values)
# Boxplot: Compare the distribution of property stolen between 2001 and 2010 with precise y-axis
ggplot(filtered_data, aes(x = factor(Year), y = Value_of_Property_Stolen, fill = factor(Year))) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Property Stolen (2001 vs 2010)",
    x = "Year", 
    y = "Value of Property Stolen"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels
  scale_y_continuous(labels = scales::comma_format(),  # Format y-axis with commas
                     limits = c(0, max(filtered_data$Value_of_Property_Stolen, na.rm = TRUE) * 1.1))  # Adjust 
# Perform the Wilcoxon Rank-Sum Test (Mann-Whitney U Test) to compare the distributions
wilcox_result <- wilcox.test(Value_of_Property_Stolen ~ Year, data = filtered_data)

# Print the Wilcoxon test result
print(wilcox_result)
