## Creates DF of the cities only first 1000000 observations
df_subset_NY<- head(NY_calendar, 1000000)
df_subset_AM<- head(Amsterdam_calendar, 1000000)
df_subset_PR<- head(Paris_calendar, 1000000)

## Creates a dataframe with the different dataframes
subsets<- df_subset_PR%>%
  bind_rows(df_subset_AM)%>%
  bind_rows(df_subset_NY)

## Shows classes variables (Price and Date were both character)
class(subsets$date)
class(subsets$price)

## We change the price from character to numeric
subsets$price <- as.numeric(gsub("\\$", "", subsets$price))

## Shows the number of NA's 
sum(is.na(subsets))

## cleares the NA's 
clean_data <- na.omit(subsets)

## Changes the date into a numeric date variable
clean_data$date <- as.Date(clean_data$date)

## Add groups Group 1 New years, Group 2 Easter, Group 3 other
clean_data<- clean_data %>%
  mutate(group = case_when(
    between(date, as.Date("2022-12-28"), as.Date("2023-01-05")) ~ "1",
    between(date, as.Date("2023-04-09"), as.Date("2023-04-18")) ~ "2",
    TRUE ~ "3"
  )) 
  

View(clean_data)
model <- lm(price ~ group + minimum_nights + available , data = clean_data)
anova(model)
