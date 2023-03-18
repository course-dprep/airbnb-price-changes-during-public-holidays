#setup
library(readr)
library(tidyverse)
library(dplyr)
library(ggplot2)

# Load the dataset for each city ../../gen/data-preparation/output/
Paris_dataset <- read_csv("../../gen/data-preparation/output/Paris_dataset.csv")
Amsterdam_dataset<- read_csv("../../gen/data-preparation/output/Amsterdam_dataset.csv")
NY_dataset<-read_csv("../../gen/data-preparation/output/NY_dataset.csv")

# 
Paris_model <- lm(price ~ group + host_is_superhost + accommodates + room_type + group*host_is_superhost + group*accommodates + group*room_type, data =Paris_dataset)
Paris_result<- anova(Paris_model)
Paris_result

Amsterdam_model <- lm(price ~ group + host_is_superhost + accommodates + room_type + group*host_is_superhost + group*accommodates + group*room_type, data =Amsterdam_dataset)
Amsterdam_result<- anova(Amsterdam_model)
Amsterdam_result

NY_model<- lm(price ~ group + host_is_superhost + accommodates + room_type + group*host_is_superhost + group*accommodates + group*room_type, data =NY_dataset)
NY_result<-anova(NY_model)
NY_result
