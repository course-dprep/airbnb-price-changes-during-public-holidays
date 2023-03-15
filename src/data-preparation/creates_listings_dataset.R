# Merge three listings file into one file named all_listing
all_listing <- bind_rows(NY_listing) %>% bind_rows(Paris_listing) %>% bind_rows(Amsterdam_listing)

# Select the columns of id, host_is_superhost, room_type and accommodates from NY_listing,Paris_listing and Amsterdam_listing.
all_listing_new <- all_listing %>% select(id, host_is_superhost, room_type,accommodates)


# Combine the calendar dataset and the listing dataset into one moderate dataset, with the columns of listing_id, date, price,city, host_is_superhost,room_type and accomodates.
moderate_dataset <- calendar %>%
  inner_join(all_listing %>% select(id, host_is_superhost, room_type, accommodates), 
             by = c("listing_id" = "id"))
View(moderate_dataset)  