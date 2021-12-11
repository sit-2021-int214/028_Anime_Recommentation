# Anime Dataset
Dataset from [anime_recommendation.csv](./anime_recommendation.csv)

## Data Cleaning and Data Transformation
### 1. Checking the types of values
```
is.numeric(anime$anime_id)
is.numeric(anime$episodes)
is.numeric(anime$rating)
is.numeric(anime$members)

anime$members %>% assert_is_numeric()
anime$name %>% assert_is_character()
anime$genre %>% assert_is_character()
anime$type %>% assert_is_character()
anime$anime_id %>% assert_is_numeric()
anime$episodes %>% assert_is_numeric()
anime$rating %>% assert_is_numeric()
anime$members %>% assert_is_numeric()
```
เช็ค Datatype ของแต่ละ Column

### 2. Changing the types of values
```
anime$episodes <- as.factor(anime$episodes)
```
เปลี่ยน Datatype ของ Column Episodes เป็น Factor 

### 3. Checking and delete duplicate data
```
anime %>% duplicated() %>% table()
anime <- anime %>% distinct()
```
เช็คหา Columns ที่มีค่าซ้ำกัน

### 4. Handling missing data
```
is.na(anime$anime_id) %>% sum()
is.na(anime$name) %>% sum()
is.na(anime$genre) %>% sum()
is.na(anime$type) %>% sum
is.na(anime$episodes) %>% sum()
is.na(anime$rating) %>% sum()
is.na(anime$members) %>% sum()
```
หาค่า NA ของแต่ละ Columns

### 5. Delete columns NA values
```
anime$episodes <- replace(anime$episodes,anime$episodes == 'Unknown', NA)
anime <- anime %>% na.omit()
```
ลบ Columns ทั้งหมดที่มีค่า NA 

### 6. Outliers data & Range Values
```
anime$rating <- assert_all_are_in_closed_range(anime$rating, lower = 0, upper = 10)
```
กำหนด Outlier ของ Column Rating และหา Column ที่มี Rating เกินจากที่กำหนด
