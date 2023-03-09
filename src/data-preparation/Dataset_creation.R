##  Install packages 
install.packages(tidyverse)
install.packages(dplyr)

## Load libraries
library(tidyverse)
library(dplyr)




## Load the URLs
urls <- c(
  "http://data.insideairbnb.com/france/ile-de-france/paris/2022-12-10/data/listings.csv.gz",
  "http://data.insideairbnb.com/france/ile-de-france/paris/2022-12-10/data/calendar.csv.gz",
  "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-12-05/data/listings.csv.gz",
  "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-12-05/data/calendar.csv.gz",
  "http://data.insideairbnb.com/united-states/ny/new-york-city/2022-12-04/data/listings.csv.gz",
  "http://data.insideairbnb.com/united-states/ny/new-york-city/2022-12-04/data/calendar.csv.gz"
)

## Names for each URL
names <- c("Paris_listing", "Paris_calendar", "Amsterdam_listing", "Amsterdam_calendar", "NY_listing", "NY_calendar")

## Loop through URLs
for (i in 1:length(urls)) {
  download.file(urls[i], paste0(names[i], ".csv.gz"), mode = "wb")
}

## View Data 
Paris_listing <- read.csv(gzfile("Paris_listing.csv.gz"), header = TRUE, sep = ",")
View(Paris_listing)
Paris_calendar <- read.csv(gzfile("Paris_calendar.csv.gz"), header = TRUE, sep = ",")
View(Paris_calendar)
Amsterdam_listing <- read.csv(gzfile("Amsterdam_listing.csv.gz"), header = TRUE, sep = ",")
View(Amsterdam_listing)
Amsterdam_calendar <- read.csv(gzfile("Amsterdam_calendar.csv.gz"), header = TRUE, sep = ",")
View(Amsterdam_calendar)
NY_listing <- read.csv(gzfile("NY_listing.csv.gz"), header = TRUE, sep = ",")
View(NY_listing)
NY_calendar <- read.csv(gzfile("NY_calendar.csv.gz"), header = TRUE, sep = ",")
View(NY_calendar)

## Add the new column named city in the NY_calendar_new, Paris_calendar_new, Amsterdam_calendar_new
NY_calendar_new <- NY_calendar %>% mutate(city="NY")
Paris_calendar_new <- Paris_calendar %>% mutate(city="Paris")
Amsterdam_calendar_new <- Amsterdam_calendar %>% mutate(city="Amsterdam")


## Creates a dataframe with the different dataframes
calendar<- NY_calendar_new%>%
  bind_rows(Paris_calendar_new )%>%
  bind_rows(Amsterdam_calendar_new)

## Filter calendar 
calendar<- calendar%>%
  select(listing_id,date,price,city)

## Shows classes variables
class(calendar$date)
class(calendar$price)

## We change the price from character to numeric
calendar$price <- as.numeric(gsub("\\$", "", calendar$price))

## Shows the number of NA's 
sum(is.na(calendar))

## cleares the NA's 
calendar <- na.omit(calendar)

## Changes the date into a numeric date variable
calendar$date <- as.Date(calendar$date)

## Add groups Group 1 New years, Group 2 Easter, Group 3 other
calendar<- calendar %>%
  mutate(group = case_when(
    between(date, as.Date("2022-12-23"), as.Date("2022-12-27")) ~ "1",
    between(date, as.Date("2022-12-29"), as.Date("2023-01-03")) ~ "2",
    between(date, as.Date("2023-04-12"), as.Date("2023-04-16")) ~ "3",
    TRUE ~ "4"
  )) 


# Merge three listings file into one file named all_listing
all_listing <- bind_rows(NY_listing) %>% bind_rows(Paris_listing) %>% bind_rows(Amsterdam_listing)

# Select the columns of id, host_is_superhost, room_type and accommodates from NY_listing,Paris_listing and Amsterdam_listing.
all_listing_new <- all_listing %>% select(id, host_is_superhost, room_type,accommodates)


# Combine the calendar dataset and the listing dataset into one moderate dataset, with the columns of listing_id, date, price,city, host_is_superhost,room_type and accomodates.
moderate_dataset <- calendar %>%
  inner_join(all_listing %>% select(id, host_is_superhost, room_type, accommodates), 
             by = c("listing_id" = "id"))
View(moderate_dataset)  
