model <- lm(price ~ group + minimum_nights + available , data = clean_data)
anova(model)
