#setup
library(readr)
library(tidyverse)
library(dplyr)
library(ggplot2)

# Load the dataset for each city ../../gen/data-preparation/output/
Paris_dataset <- read_csv("../../gen/data-preparation/output/Paris_dataset.csv")
Amsterdam_dataset<- read_csv("../../gen/data-preparation/output/Amsterdam_dataset.csv")
NY_dataset<-read_csv("../../gen/data-preparation/output/NY_dataset.csv")

# create a list of city datasets
city_datasets <- list(Paris = Paris_dataset, Amsterdam = Amsterdam_dataset, NY = NY_dataset)

# create an empty data frame to store the results
result <- data.frame()

# iterate over the city datasets
for (city_name in names(city_datasets)) {
  # fit a model and get ANOVA results
  model <- lm(price ~ group + host_is_superhost + accommodates + room_type + group*host_is_superhost + group*accommodates + group*room_type, data = city_datasets[[city_name]])
  anova_result <- anova(model)
  # add a column for the city name
  anova_result$City <- city_name
  # append the results to the data frame
  result <- rbind(result, anova_result)
}



# print the results
result

write_csv(result, paste0('../../gen/analysis/output/',"anova_result.csv"))


