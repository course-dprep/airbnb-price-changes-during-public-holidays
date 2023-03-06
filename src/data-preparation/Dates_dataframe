This code needs to be used after the codesnippet of the document download_data.R

## Creates DF of the cities only first 1000 observations
df_subset_NY<- head(NY_calendar, 1000)
df_subset_AM<- head(Amsterdam_calendar, 1000)
df_subset_PR<- head(Paris_calendar, 1000)

## Creates a dataframe with the different dataframes
subsets<- df_subset_PR%>%
  bind_rows(df_subset_AM)%>%
  bind_rows(df_subset_NY)

##Filter the new dataset on the three variables
subsets<-subsets%>%
  select("listing_id", "price", "date")

## Adjusts the rows and collums 
subsets<-spread(subsets, date, price)

## Views the dataframe
View(subsets)



