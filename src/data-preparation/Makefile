DATA=../../data/original_datasets
TEMP=../../gen/temp
DP=../../src/data-preparation
OUTPUT=../../gen/output

all: install_packages $(DATA)/download_data NY_calendar.csv Amsterdam_calendar.csv Paris_calendar.csv Paris_dataset.csv Amsterdam_dataset.csv NY_dataset.csv

Paris_dataset.csv Amsterdam_dataset.csv NY_dataset.csv: city_dataset.R
		R --vanilla < city_dataset.R 
NY_calendar.csv Amsterdam_calendar.csv Paris_calendar.csv: calendar_datasets.R 
		R --vanilla < calendar_datasets.R 
$(DATA)/download_data: download_data.R 
		R --vanilla < download_data.R 

install_packages: install_packages.R
		R --vanilla install.packages.R
