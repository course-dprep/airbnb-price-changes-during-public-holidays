DATA=../../data
TEMP=../../gen/data-preparation/temp
DP=../../src/data-preparation
OUTPUT=../../gen/data-preparation/output

all: $(DATA)/NY_calendar.csv $(DATA)/Amsterdam_calendar.csv $(DATA)/Paris_calendar.csv $(TEMP)/Paris_dataset.csv $(TEMP)/Amsterdam_dataset.csv $(TEMP)/NY_dataset.csv $(DATA)/Paris_listing.csv $(DATA)/Amsterdam_listing.csv $(DATA)/NY_listing.csv

$(TEMP)/Paris_dataset.csv $(TEMP)/Amsterdam_dataset.csv $(TEMP)/NY_dataset.csv: $(TEMP)/NY_group_calendar.csv $(TEMP/Amsterdam_group_calendar.csv $(TEMP)/Paris_group_calendar.csv $(DATA)/Paris_listing.csv $(DATA)/Amsterdam_listing.csv $(DATA)/NY_listing.csv $(DP)/city_dataset.R
		R --vanilla < $(DP)/city_dataset.R 

$(TEMP)/NY_group_calendar.csv $(TEMP)/Amsterdam_group_calendar.csv $(TEMP)/Paris_group_calendar.csv: $(DATA)/NY_calendar.csv $(DATA)/Amsterdam_calendar.csv $(DATA)/Paris_calendar.csv $(DP)/calendar_datasets.R
		R --vanilla < $(DP)/calendar_datasets.R 

$(DATA)/NY_calendar.csv $(DATA)/Amsterdam_calendar.csv $(DATA)/Paris_calendar.csv $(DATA)/Paris_listing.csv $(DATA)/Amsterdam_listing.csv $(DATA)/NY_listing.csv: $(DP)/download_data.R 
		R --vanilla < $(DP)/download_data.R 

$(DP)install_packages: $(DP)install_packages.R
		R --vanilla < $(DP)/install.packages.R
