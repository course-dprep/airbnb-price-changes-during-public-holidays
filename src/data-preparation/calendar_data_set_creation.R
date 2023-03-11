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



