# Load necessary libraries
library(readr)
library(ggplot2)
library(dplyr)

# Load the dataset (replace with your correct path)
my_data <- read_csv("C:/Users/Folio/Desktop/herts/A310/10_Property_stolen_and_recovered.csv")

# Filter the data for the years of interest (2001, 2003, 2006, 2010)
filtered_data <- dplyr::filter(my_data, Year %in% c(2001, 2003, 2006, 2010))

# Create a boxplot for Cases_Property_Recovered by Year
ggplot(filtered_data, aes(x = as.factor(Year), y = Cases_Property_Recovered, fill = as.factor(Year))) +
  geom_boxplot(alpha = 0.6, color = "black", outlier.shape = 16, outlier.colour = "red", outlier.size = 3) +  # Boxplot with outliers highlighted in red
  labs(title = "Distribution of Property Cases Recovered by Year (2001, 2003, 2006, 2010)",
       x = "Year",
       y = "Number of Property Cases Recovered") +
  theme_minimal() +
  scale_y_continuous(labels = scales::comma) +  # Format y-axis with commas for large numbers
  scale_x_discrete(labels = c("2001", "2003", "2006", "2010")) +  # Label years on the x-axis
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Angle x-axis labels for better readability


