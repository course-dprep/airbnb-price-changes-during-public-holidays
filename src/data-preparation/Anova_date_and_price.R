## Creates DF of the cities only first 1000000 observations
NY_calendar_new<- head(NY_calendar, 1000000)
Amsterdam_calendar_new<- head(Amsterdam_calendar, 1000000)
Paris_calendar_new<- head(Paris_calendar, 1000000)

## Add the new column named city in the NY_calendar_new, Paris_calendar_new, Amsterdam_calendar_new
NY_calendar_new <- NY_calendar_new %>% mutate(city="NY")
Paris_calendar_new <- Paris_calendar_new %>% mutate(city="Paris")
Amsterdam_calendar_new <- Amsterdam_calendar_new %>% mutate(city="Amsterdam")


## Creates a dataframe with the different dataframes
calendar<- NY_calendar_new%>%
  bind_rows(Paris_calendar_new )%>%
  bind_rows(Amsterdam_calendar_new)

## Filter calendar 
calendar<- calendar%>%
  select(listing_id,date,price, city)

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
calendar$date <- as.Date(Calendar$date)

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

## Run the anova
model <- lm(price ~ group + group*host_is_superhost + group*room_type + group*accommodates + group*city, moderate_dataset)
anova(model)
