library(tidyverse)
library(dplyr)

setwd("../../src/data-preparation")

## Read the CSV files

Paris_calendar <- read_csv(gzfile("../../data/original_datasets/Paris_calendar.csv.gz"), col_names = TRUE)
Amsterdam_calendar <- read_csv(gzfile("../../data/original_datasets/Amsterdam_calendar.csv.gz"), col_names = TRUE)
NY_calendar <- read_csv(gzfile("../../data/original_datasets/NY_calendar.csv.gz"), col_names = TRUE)

## Add the new column named city in the NY_calendar_new, Paris_calendar_new, Amsterdam_calendar_new
NY_calendar <- NY_calendar %>% mutate(city="NY") %>% select(listing_id,date,price,city)
Paris_calendar <- Paris_calendar %>% mutate(city="Paris") %>% select(listing_id,date,price,city)
Amsterdam_calendar <- Amsterdam_calendar %>% mutate(city="Amsterdam") %>% select(listing_id,date,price,city)

## We change the price from character to numeric
NY_calendar$price <- as.numeric(gsub("\\$", "", NY_calendar$price))
Amsterdam_calendar$price <- as.numeric(gsub("\\$", "", Amsterdam_calendar$price))
Paris_calendar$price <- as.numeric(gsub("\\$", "", Paris_calendar$price))

## cleares the NA's 
NY_calendar <- na.omit(NY_calendar)
Amsterdam_calendar <- na.omit(Amsterdam_calendar)
Paris_calendar <- na.omit(Paris_calendar)

## Changes the date into a numeric date variable
NY_calendar$date <- as.Date(NY_calendar$date)
Amsterdam_calendar$date <- as.Date(Amsterdam_calendar$date)
Paris_calendar$date <- as.Date(Paris_calendar$date)

## Add groups Group 1 New years, Group 2 Easter, Group 3 other
NY_calendar<- NY_calendar %>%
  mutate(group = case_when(
    between(date, as.Date("2022-12-23"), as.Date("2022-12-27")) ~ "1",
    between(date, as.Date("2022-12-29"), as.Date("2023-01-03")) ~ "2",
    between(date, as.Date("2023-04-12"), as.Date("2023-04-16")) ~ "3",
    TRUE ~ "4"
  )) 

## Add groups Group 1 New years, Group 2 Easter, Group 3 other
Amsterdam_calendar<- Amsterdam_calendar %>%
  mutate(group = case_when(
    between(date, as.Date("2022-12-23"), as.Date("2022-12-27")) ~ "1",
    between(date, as.Date("2022-12-29"), as.Date("2023-01-03")) ~ "2",
    between(date, as.Date("2023-04-12"), as.Date("2023-04-16")) ~ "3",
    TRUE ~ "4"
  )) 

## Add groups Group 1 New years, Group 2 Easter, Group 3 other
Paris_calendar<- Paris_calendar %>%
  mutate(group = case_when(
    between(date, as.Date("2022-12-23"), as.Date("2022-12-27")) ~ "1",
    between(date, as.Date("2022-12-29"), as.Date("2023-01-03")) ~ "2",
    between(date, as.Date("2023-04-12"), as.Date("2023-04-16")) ~ "3",
    TRUE ~ "4"
  )) 


write_csv(NY_calendar,"NY_calendar.csv")
write_csv(Amsterdam_calendar,"Amsterdam_calendar.csv")
write_csv(Paris_calendar,"Paris_calendar.csv")


