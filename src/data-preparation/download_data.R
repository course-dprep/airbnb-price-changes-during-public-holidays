## Create data directory
dir.create("./data/raw_data")

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


