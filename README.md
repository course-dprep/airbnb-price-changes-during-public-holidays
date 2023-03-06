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
Airbnb is a well-known service that enables property owners to rent out their homes, apartments, or individual rooms to travelers who want an alternative to conventional hotels. Since its establishment in 2008, Airbnb now operates in more than 220 countries with over 4 million listings (Airbnb, n.d.). This platform has created a new form of accommodation that is frequently less costly and more adaptable than traditional options. Nonetheless, Airbnb prices can vary based on different factors such as the area, time of year, and demand. 

This study specifically chose to analyze Airbnb prices during public holidays, such as Christmas and Easter, as these holidays are widely celebrated and popular for travel. According to statistics from Airbnb (2015) and Kayak (2019) which is the travel booking platform, the passenger flow from Christmas to New Year shows that New York, Paris and Amsterdam are among the top 15 most popular destinations in the world. Therefore, this research aims to investigate the association between public holidays and Airbnb room prices in these three major cities, using linear regression modeling as a powerful tool to analyze predictors such as the number of reviews, room type, superhost status, number of accommodates, and holiday period. The resulting coefficients and significance offer valuable insights into the drivers behind price fluctuations during holiday periods. In addition, inflation will be taken into account to predict the price trends during the same public holiday periods in 2023.

This research could provide valuable insights for various stakeholders. For example, this study will provide inspiration and ideas for Airbnb's hosts’ pricing strategies during the public holidays in 2023, potentially increasing their earnings. At the same time, tourists who plan to visit these cities on holidays are also able to get insight into the room prices and their accommodation expenditures through this study. Finally, the findings could also contribute to the academic literature on the relationship between holidays and tourism.

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

