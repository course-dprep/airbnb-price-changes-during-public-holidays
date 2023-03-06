library(tidyverse)
library(dplyr)
library(readr)


# Modify the calendar file for three cities
##Data subset with the variables of listing_id,date and price from NY_calendar, Amsterdam_calendar and Paris_calendar
NY_calendar_new <- NY_calendar %>% 
  mutate(date=as.Date(date)) %>% 
  group_by(listing_id) %>%
  filter((date >= "2022-12-04" & date <= "2023-01-03") |
           (date >= "2023-04-06" & date <= "2023-04-12")) %>% 
  select(listing_id,date,price)
NY_calendar_new <- NY_calendar_new[order(NY_calendar_new$listing_id),]

Paris_calendar_new <- Paris_calendar %>%
  mutate(date=as.Date(date)) %>% 
  group_by(listing_id) %>%
  filter((date >= "2022-12-04" & date <= "2023-01-03") |
           (date >= "2023-04-06" & date <= "2023-04-12")) %>% 
  select(listing_id,date,price)
Paris_calendar_new<- Paris_calendar_new[order(Paris_calendar_new$listing_id),]

Amsterdam_calendar_new <- Amsterdam_calendar %>%
  mutate(date=as.Date(date)) %>% 
  group_by(listing_id) %>%
  filter((date >= "2022-12-04" & date <= "2023-01-03") |
           (date >= "2023-04-06" & date <= "2023-04-12")) %>% 
  select(listing_id,date,price)
Amsterdam_calendar_new <- Amsterdam_calendar_new[order(Amsterdam_calendar_new$listing_id),]


 ## Add the new column named city in the NY_calendar_new, Paris_calendar_new, Amsterdam_calendar_new
NY_calendar_new <- NY_calendar_new %>% mutate(city="NY")
Paris_calendar_new <- Paris_calendar_new %>% mutate(city="Paris")
Amsterdam_calendar_new <- Amsterdam_calendar_new %>% mutate(city="Amsterdam")


# Merge three updated calendar file to one integrate dataframe for calendar
Calendar <- bind_rows (NY_calendar_new) %>% bind_rows(Paris_calendar_new) %>% bind_rows(Amsterdam_calendar_new)
View(Calendar)


# Select the columns of id, host_is_superhost, room_type and accommodates from NY_listing,Paris_listing and Amsterdam_listing.
NY_listing_new <- NY_listing %>% select(id, host_is_superhost, room_type,accommodates)
Paris_listing_new <- Paris_listing %>% select(id, host_is_superhost, room_type,accommodates)
Amsterdam_listing_new <- Amsterdam_listing %>% select(id, host_is_superhost, room_type,accommodates)


# Merge three listings file into one file named all_listing
all_listing <- bind_rows(NY_listing_new) %>% bind_rows(Paris_listing_new) %>% bind_rows(Amsterdam_listing_new)


# Combine the calendar dataset and the listing dataset into one moderate dataset, with the columns of listing_id, date, price,city, host_is_superhost,room_type and accomodates.
moderate_dataset <- Calendar %>%
  left_join(all_listing %>% select(id, host_is_superhost, room_type, accommodates), 
            by = c("listing_id" = "id"))
write.csv(moderate_dataset, "moderate_dataset.csv", row.names = FALSE)
View(moderate_dataset)


## Large dataset separated by cities
NY_dataset<- moderate_dataset %>% 
  filter(city=="NY") %>% 
  select(listing_id, date, price, city, host_is_superhost, room_type, accommodates)
View(NY_dataset)

Paris_dataset<- moderate_dataset %>% 
  filter(city=="Paris") %>% 
  select(listing_id, date, price, city, host_is_superhost, room_type, accommodates)
View(Paris_dataset)

Amsterdam_dataset<- moderate_dataset %>% 
  filter(city=="Amsterdam") %>% 
  select(listing_id, date, price, city, host_is_superhost, room_type, accommodates)
View(Amsterdam_dataset)
