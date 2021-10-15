# Anime Dataset

Dataset from [anime_clean.csv](./anime_clean.csv)


### My Step
1.Define a question
2.Search datasets from Kaggle
3.Download Library and dataset
4.Explore the dataset from the original dataset
5.Cleaning Dataset
6.Exploratory Data Analysis

## Define a question

1. Anime เรื่องไหนที่มีจำนวนของกลุ่มผู้ติดตามมากที่สุด
2. Anime เรื่องไหนที่มีคะแนน rating มากที่สุด
3. 5 อันดับแรกของ Anime แนวเรื่องไหน ที่ผลิตออกมามากที่สุด
4. Anime เรื่องไหนบ้างที่มี Episodes มากกว่า 100 ตอน และมีคะแนนมากกว่า 8.5/10 คะแนน
5. มี Anime ประเภท OVA ทั้่งหมดกี่เรื่องที่มี rating น้อยกว่า 5.0 
6.  


## Step 0 Loading library and dataset

```
#library
library(readr)
library(assertive)
library(stringr)
library(dplyr)
library(tidyr)

#dataset
anime <- read.csv("D:/IT/IT Y.2/INT214 Stat for IT/R/Midterm assignment/anime_clean.csv)
```

## 1.Anime เรื่องไหนที่มีจำนวนของกลุ่มผู้ติดตามมากที่สุด

Explain here

```
anime %>% filter(members == max(members));
```

Result

```
 anime_id name       genre                                                  type  episodes rating members
     <dbl> <chr>      <chr>                                                  <chr>    <dbl>  <dbl>   <dbl>
1     1535 Death Note Mystery, Police, Psychological, Supernatural, Thriller TV          37   8.71 1013917
```


## 2.Anime เรื่องไหนที่มีคะแนน rating มากที่สุด

Explain here
```
anime %>% filter(anime$rating == max(anime$rating));
```
Result
```
anime_id name                                    genre          type  episodes rating members
     <dbl> <chr>                                   <chr>          <chr>    <dbl>  <dbl>   <dbl>
1    33662 Taka no Tsume 8: Yoshida-kun no X-Files Comedy, Parody Movie        1     10      13
```


## 3. 5 อันดับแรกของ Anime แนวเรื่องไหน ที่ผลิตออกมามากที่สุด

Explain here
```

```
Result
```

```

## 4.Anime เรื่องไหนบ้างที่มี Episodes มากกว่า 100 ตอน และมีคะแนนมากกว่า 8.5/10 คะแนน
Explain
```

```
Result
```

```

## 5. มี Anime ประเภท OVA ทั้่งหมดกี่เรื่องที่มี rating น้อยกว่า 5.0 
Explain
```
anime %>% filter(type == 'OVA' & rating < 5.0) %>% count();
```
Result
```
# A tibble: 1 x 1
      n
  <int>
1   174
```

## 6.
Explain
```

```
Result
```

```


