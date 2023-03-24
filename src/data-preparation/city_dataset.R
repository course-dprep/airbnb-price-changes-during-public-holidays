library(dplyr)
library(readr)

dir.create("../../gen/data-preparation/output", recursive = TRUE)

# Set up file paths and city names
file_paths <- c("../../gen/data-preparation/temp/Paris_group_calendar.csv",
                "../../gen/data-preparation/temp/Amsterdam_group_calendar.csv",
                "../../gen/data-preparation/temp/NY_group_calendar.csv")

city_names <- c("Paris", "Amsterdam", "NY")

# Read the calendar data and store it in a list
calendar_data <- list()

for (i in seq_along(file_paths)) {
  calendar_data[[i]] <- read_csv(file_paths[i])
}

# Read the listing data and store it in a list
listing_data <- list()

for (city in city_names) {
  listing_data[[city]] <- read_csv(gzfile(paste0("../../data/", city, "_listing.csv.gz")), col_names = TRUE)
}

# Combine the calendar and listing data for each city and write the resulting dataset to a csv file
for (i in seq_along(city_names)) {
  city <- city_names[i]
  dataset <- calendar_data[[i]] %>%
    inner_join(listing_data[[city]] %>% select(id, host_is_superhost, room_type, accommodates), 
               by = c("listing_id" = "id")) %>%
    mutate(accommodates = ifelse(accommodates > 10, 1, 0))
  write_csv(dataset, paste0('../../gen/data-preparation/output/', city, "_dataset.csv"))
}
