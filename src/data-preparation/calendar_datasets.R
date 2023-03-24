library(tidyverse)
library(dplyr)

dir.create("../../gen/data-preparation/temp/", recursive = TRUE)

cities <- c("NY", "Amsterdam", "Paris")
for (city in cities) {
  print(city)
  df <- read_csv(gzfile(paste0("../../data/", city, "_calendar.csv.gz")), col_names = TRUE, n_max = 100000)
  df <- df %>% mutate(city=city) %>% select(listing_id,date,price,city)
  df$price <- as.numeric(gsub("[^0-9.]", "", df$price))
  df <- na.omit(df)
  df$date <- as.Date(df$date)
  df<- df %>%
    mutate(group = case_when(
      between(date, as.Date("2022-12-23"), as.Date("2022-12-27")) ~ "1",
      between(date, as.Date("2022-12-29"), as.Date("2023-01-03")) ~ "2",
      between(date, as.Date("2023-04-12"), as.Date("2023-04-16")) ~ "3",
      TRUE ~ "4"
    ))
  write_csv(df, paste0('../../gen/data-preparation/temp/', city, "_group_calendar.csv"))
}
