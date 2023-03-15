## Load libraries
library(tidyverse)
library(dplyr)

## Load the URLs
options(timeout = max(1000, getOption("timeout")))
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


