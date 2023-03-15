#setup
library(readr)
library(tidyverse)
library(dplyr)
library(ggplot2)

# Load the dataset for each city
Paris_dataset <- read_csv("../../src/data-preparation/Paris_dataset.csv")
Amsterdam_dataset<- read_csv("../../src/data-preparation/Amsterdam_dataset.csv")
NY_dataset<-read_csv("../../src/data-preparation/NY_dataset.csv")

# 
Paris_model <- lm(price ~ group*host_is_superhost + group*accommodates + group*room_type, data =Paris_dataset)
Paris_result<- anova(Paris_model)
Paris_result

Amsterdam_model <- lm(price ~ group*host_is_superhost + group*accommodates + group*room_type, data =Amsterdam_dataset)
Amsterdam_result<- anova(Amsterdam_model)
Amsterdam_result

NY_model<- lm(price ~ group*host_is_superhost + group*accommodates + group*room_type, data =NY_dataset)
NY_result<-anova(NY_model)
NY_result
