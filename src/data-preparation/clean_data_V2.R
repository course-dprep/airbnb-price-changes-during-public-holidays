#Setup
library(tidyverse)
library(dplyr)
library(readr)

## Add the new column named city in the NY_calendar, Paris_calendar, Amsterdam_calendar
NY_calendar <- NY_calendar %>% mutate(city="NY")
Paris_calendar <- Paris_calendar %>% mutate(city="Paris")
Amsterdam_calendar <- Amsterdam_calendar %>% mutate(city="Amsterdam")

# Merge three calendars file into one integrated calendar
calendar <- bind_rows (NY_calendar) %>% bind_rows(Paris_calendar) %>% bind_rows(Amsterdam_calendar)

#calendar subset with the variables of listing_id,date and price.
calendar <- calendar %>% 
  mutate(date=as.Date(date)) %>% 
  group_by(listing_id,date) %>%
  select(listing_id,date,price,city)
calendar <- calendar[order(calendar$listing_id),]

## Change the price from character to numeric
calendar$price <- as.numeric(gsub("\\$", "", calendar$price))

## Shows the number of NA's 
sum(is.na(calendar))

## cleares the NA's in Calendar
calendar <- na.omit(calendar)
View(calendar)

# Merge three listings file into one file named all_listing
all_listing <- bind_rows(NY_listing) %>% bind_rows(Paris_listing) %>% bind_rows(Amsterdam_listing)

# Select the columns of id, host_is_superhost, room_type and accommodates from all_listing
all_listing <- all_listing %>% select(id, host_is_superhost, room_type,accommodates)

# Combine the calendar and the all_listing  into one moderate dataset, with the columns of listing_id, date, price,city, host_is_superhost,room_type and accommodates.
moderate_dataset <- calendar %>%
  inner_join(all_listing %>% select(id, host_is_superhost, room_type, accommodates), 
             by = c("listing_id" = "id"))
View(moderate_dataset) 

## moderate dataset separated by cities
NY_dataset<- moderate_dataset %>% 
  filter(city=="NY")
View(NY_dataset)

Paris_dataset<- moderate_dataset %>% 
  filter(city=="Paris") 
View(Paris_dataset)

Amsterdam_dataset<- moderate_dataset %>% 
  filter(city=="Amsterdam") 
View(Amsterdam_dataset)
