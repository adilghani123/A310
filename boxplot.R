# Load necessary libraries
library(ggplot2)
library(dplyr)
library(scales)  # For controlling y-axis labels
# Load the dataset
data <- read.csv("10_Property_stolen_and_recovered.csv")
# Filter data for 2001 and 2010
filtered_data <- data %>%
  filter(Year %in% c(2001, 2010))
