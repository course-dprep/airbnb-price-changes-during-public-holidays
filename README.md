# How do airbnb room prices change during public holidays?


## Research background and motivation
Airbnb is a well-known service that enables property owners to rent out their homes, apartments, or individual rooms to travelers who want an alternative to conventional hotels. Since its establishment in 2008, Airbnb now operates in more than 220 countries with over 4 million listings (Airbnb, n.d.). This platform has created a new form of accommodation that is frequently less costly and more adaptable than traditional options. Nonetheless, Airbnb prices can vary based on different factors such as the area, time of year, and demand. 

This study chose to analyze Airbnb prices during public holidays, such as Christmas and Easter, as these holidays are celebrated internationally and popular for travel. According to statistics from Airbnb (2015) and Kayak (2019), which is a travel booking platform, the passenger flow from Christmas to New Year shows that New York, Paris and Amsterdam are among the top 15 most popular destinations in the world. Therefore, this research aims to investigate the association between public holidays and Airbnb room prices in these three major cities, using ANOVA as a powerful tool to analyze predictors such as the number of reviews, room type, superhost status, number of accommodates, and holiday period. The resulting coefficients and significance offer valuable insights into the drivers behind price fluctuations during holiday periods. 

**The research question is**: 
*How does the Airbnb room price change in New York, Paris, and Amsterdam between Christmas and New Year and over the Easter period in 2023, and how does the price fluctuations on holidays vary depending on room type, superhost status, number of accommodates?*


| Variables         | Description   |
| -------------     | ------------- |
| Price             | Room price in New York, Paris and Amsterdam is treated as predicted variable |
| Dates             | The dates during Christmas, New Year and Easter: 22 December - 3 January & 6 April – 12 April |
| City              | Three popular destinations during public holidays: New York, Paris and Amsterdam  |
| Host_is_superhost | Whether the host is verified as super host|
| Room_type         | If the room is "entire home/apt", "private room", "share room" or "hotel room" |
| Accommodates      | Number of tenants that can be accommodated |


## Research method
The data was downloaded from the Inside Airbnb website (http://insideairbnb.com/get-the-data). Accordinglt, the calendar and reviews csv files were downloaded into R for Amsterdam, Paris and New York. ANOVA was chosen as an appropriate analysis method as we are looking for a causal/dependence relationship between listings prices during Easter, Christmas and New Year's, and how these price fluctiations vary depending on the type of room, superhosy status and the number of people that can be accomodated.

##Relevance of analysis/Future applications
This research could provide valuable insights for various stakeholders. For example, this study will provide inspiration and ideas for Airbnb's hosts’ pricing strategies during the public holidays in 2023, potentially increasing their earnings. At the same time, tourists who plan to visit these cities on holidays are also able to get insight into the room prices and their accommodation expenditures through this study. Finally, the findings could also contribute to the academic literature on the relationship between holidays and tourism.

##Repository overview
- data
  - original datasets
- src
  - analysis
  - data-preparation
- .gitignore
- README.md
- makefile

##Dependencies 
Folow this guide to install R
Run the following code in RStudio to install the packages:
install.packages("tidyverse")

##Running the code
#Cloning the repository
1. Open GitBash
2. Change the working directory to your preferred location
3. Type git clone (still need to add the link)
#Running the makefile
1. Change working directory to airbnb-price-changes-during-public-holidays
2. Type make 

## Interpretation of results & Conclusions

------------------------------------------------------------------
**Data Preparation & Workflow Management - Team 2**:
- Yufan Wang (y.wang_34@tilburguniversity.edu)
- Bas van Houten (b.a.vanhouten@tilburguniversity.edu)
- Karan Lalchandani (k.j.lalchandani@tilburguniversity.edu)
- My Ni Tran (m.n.tran@tilburguniversity.edu)
- Elly Dinescu (e.dinescu@tilburguniversity.edu)
