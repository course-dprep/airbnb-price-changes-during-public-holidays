# Example of reproducible research workflow 

This is a basic example repository using Gnu make for a reproducible research workflow, as described in detail here: [tilburgsciencehub.com](http://tilburgsciencehub.com/). 

The main aim of this to have a basic structure, which can be easily adjusted to use in an actual project.  In this example project, the following is done: 
1. Download and prepare data
2. Run some analysis
3. Present results in a final pdf generated using LaTeX

## Dependencies
- R 
- R packages: `install.packages("stargazer")`
- [Gnu Make](https://tilburgsciencehub.com/get/make) 
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)
- For the `makefile` to work, R, Gnu make and the TeX distribution (specifically `pdflatex`) need to be made available in the system path 
- Detailed installation instructions can be found here: [tilburgsciencehub.com](http://tilburgsciencehub.com/)


## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Linux Mint (should work in any linux distro, as well as on Windows and Mac) 
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!


## Code snippet that dowloads data from the url. Filters fot the different variables and adds the collum of city name

## Needed packages
install.packages("dplyr")
install.packages("tidyverse")
install.packages("readr")
library(tidyverse)
library(dplyr)
library("readr")

## URL example
urls <- c("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2022-12-05/data/calendar.csv.gz", "http://data.insideairbnb.com/belgium/vlg/antwerp/2022-12-29/data/calendar.csv.gz", "http://data.insideairbnb.com/greece/attica/athens/2022-12-27/data/calendar.csv.gz")

## downloads data in a new file

calendar_data<-lapply(urls, read_csv, n_max=100)

## makes the dataset on top of each other instead of next to each other
on_top<-bind_rows(calendar_data)

## Subsets the data to only have the "listing_id", "price", "date" variables
on_top_filtered<-subset(on_top, select = c("listing_id", "price", "date"))

## Creates a variable that is the city names
city_names <- sub("^.*/([a-z]+)/\\d{4}-\\d{2}-\\d{2}/.*$", "\\1", urls)

## Adds the new collum of city name
on_top_filtered$city<- rep(city_names, each = 100)

## Changesthe dataframe such that the listing_ID is the rows
new_df <- spread(on_top_filtered, date, price)


view(new_df)

