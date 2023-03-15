library(tidyverse)
library(dplyr)
library(readr)

# Read the cleaned calendar datafile for each city
Paris_calendar <- read_csv("Paris_calendar.csv")
NY_calendar <- read_csv("NY_calendar.csv")
Amsterdam_calendar <- read_csv("Amsterdam_calendar.csv")


# Read the listing file
Paris_listing <- read_csv(gzfile("../../data/original_datasets/Paris_listing.csv.gz"), col_names = TRUE)
Amsterdam_listing <- read_csv(gzfile("../../data/original_datasets/Amsterdam_listing.csv.gz"), col_names = TRUE)
NY_listing <- read_csv(gzfile("../../data/original_datasets/NY_listing.csv.gz"), col_names = TRUE)


# Combine the calendar dataset and the listing dataset into one city dataset, with the columns of listing_id, date, price,city, host_is_superhost,room_type and accomodates.
Paris_dataset <- Paris_calendar %>%
  inner_join(Paris_listing %>% select(id, host_is_superhost, room_type, accommodates), 
             by = c("listing_id" = "id"))
Amsterdam_dataset <- Amsterdam_calendar %>%
  inner_join(Amsterdam_listing %>% select(id, host_is_superhost, room_type, accommodates), 
             by = c("listing_id" = "id"))
NY_dataset <- NY_calendar %>%
  inner_join(NY_listing %>% select(id, host_is_superhost, room_type, accommodates), 
             by = c("listing_id" = "id"))

write_csv(Paris_dataset, "Paris_dataset.csv")
write_csv(Amsterdam_dataset, "Amsterdam_dataset.csv")
write_csv(NY_dataset,"NY_dataset.csv")

 