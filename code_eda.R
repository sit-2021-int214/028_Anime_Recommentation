library(dplyr)
library(readr)
library(assertive)
library(stringr)
anime <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/028_Anime_Recommentation/master/term%20assignment%20%5BGroup%5D/mid-term/anime_recommendation.csv")
as_tibble(anime)
glimpse(anime) 

#Checking the types of values & Changing the types of values
is.numeric(anime$anime_id)
anime$anime_id %>% assert_is_numeric()

is.numeric(anime$episodes)
anime$episodes %>% assert_is_numeric()

is.numeric(anime$rating)
anime$rating %>% assert_is_numeric()

is.numeric(anime$members)
anime$members %>% assert_is_numeric()

anime$name %>% assert_is_character()
anime$genre %>% assert_is_character()
anime$type %>% assert_is_character()

anime$episodes <- as.factor(anime$episodes)


# Checking and delete duplicate data
anime %>% duplicated() %>% table()
anime <- anime %>% distinct()

# Handling missing data and outliers
is.na(anime$anime_id) %>% sum()
is.na(anime$name) %>% sum()
is.na(anime$genre) %>% sum()
is.na(anime$type) %>% sum
is.na(anime$episodes) %>% sum()
is.na(anime$rating) %>% sum()
is.na(anime$members) %>% sum()

# Delete col NA values
anime$episodes <- replace(anime$episodes,anime$episodes == 'Unknown', NA)
anime <- anime %>% na.omit()

# Outliers data & Range Values
anime$rating <- assert_all_are_in_closed_range(anime$rating, lower = 0, upper = 10)

# Create anime_clean.csv
write_csv(anime,file = "anime_clean.csv")








