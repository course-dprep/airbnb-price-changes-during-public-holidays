# How Airbnb room price changes in public holiday

![My Remote Image](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo7u0qTQbKIflvaXHLq2804eC3kHtveadKCQ&usqp=CAU)
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

## Research background and motivation
Airbnb is a well-known service that enables property owners to rent out their homes, apartments, or individual rooms to travelers who want an alternative to conventional hotels. Since its establishment in 2008, Airbnb now operates in more than 220 countries with over 4 million listings (Airbnb, n.d.). This platform has created a new form of accommodation that is frequently less costly and more adaptable than traditional options. Nonetheless, Airbnb prices can vary based on different factors such as the area, time of year, and demand. According to statistics from Airbnb (2015) and Kayak (2019) which is the travel booking platform, the passenger flow from Christmas to New Year shows that New York, Paris and Amsterdam are among the top 15 most popular destinations in the world. Therefore, this research aims to investigate how public holidays are associated with Airbnb room prices in New York, Paris and Amsterdam. The data from Christmas to New Year and around Easter will be analysed to understand how the price of Airbnb rooms fluctuate in these three major popular cities during public holidays. In addition, inflation will be taken into account to predict the price trends during the same public holiday periods in 2023.

This research could provide valuable insights for various stakeholders. For example, this study will provide inspiration and ideas for Airbnb's hosts’ pricing strategies during the public holidays in 2023, potentially increasing their earnings. At the same time, tourists who plan to visit these cities on holidays are also able to get insight into the room prices and their accommodation expenditures through this study. Finally, the findings could also contribute to the academic literature on the relationship between holidays and tourism.



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

