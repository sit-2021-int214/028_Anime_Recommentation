# Anime Dataset

Dataset from [anime_clean.csv](./anime_clean.csv)


### My Step

1. Define a question
2. Loading library and dataset
3. Data Exploration
4. Data Cleaning and Data Transformation
5. Data Analysis with Descriptive Statistics


## Define a question

1. Anime เรื่องไหนที่มีจำนวนของกลุ่มผู้ติดตามมากที่สุด
2. Anime เรื่องไหนที่มีคะแนน rating มากที่สุด
3. 5 อันดับแรกของ Anime แนวไหนที่ผลิตออกมามากที่สุด
4. Anime เรื่องไหนบ้างที่มี Episodes มากกว่า 100 ตอน และมีคะแนนมากกว่า 8.5/10 คะแนน
5. มี Anime ประเภท OVA ทั้งหมดกี่เรื่องที่มี rating น้อยกว่า 5.0 
6. มี Anime เรื่องใดบ้างที่ออกฉายทางโทรทัศน์และมีจำนวนตอนมากกว่า 100 ตอนขึ้นไป
7. มีประเภทของ Anime ทั้งหมดกี่ประเภท และแต่ละประเภทมี Anime อยู่ทั้งหมดกี่เรื่อง


## Loading library and dataset

```
#library
library(dplyr)
library(readr)
library(assertive)
library(stringr)

#dataset
anime <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/028_Anime_Recommentation/master/term%20assignment%20%5BGroup%5D/mid-term/anime_recommendation.csv")
```

## Data Exploration
```
##Explore the dataset
View(anime)
glimpse(anime)
```
```
> glimpse(anime);
Rows: 12,294
Columns: 7
$ anime_id <dbl> 32281, 5114, 28977, 9253, 9969, 32935, 11061, 820, 15335, 15417~
$ name     <chr> "Kimi no Na wa.", "Fullmetal Alchemist: Brotherhood", "Gintama°~
$ genre    <chr> "Drama, Romance, School, Supernatural", "Action, Adventure, Dra~
$ type     <chr> "Movie", "TV", "TV", "TV", "TV", "TV", "TV", "OVA", "Movie", "T~
$ episodes <chr> "1", "64", "51", "24", "51", "10", "148", "110", "1", "13", "24~
$ rating   <dbl> 9.37, 9.26, 9.25, 9.17, 9.16, 9.15, 9.13, 9.11, 9.10, 9.11, 9.0~
$ members  <dbl> 200630, 793665, 114262, 673572, 151266, 93351, 425855, 80679, 7~
```

จำนวนข้อมูลเริ่มต้นมีทั้งหมด 12,294 Rows และมีทั้งหมด 7 Columns ดังนี้
1. ***anime_id*** - myanimelist.net's unique id identifying an anime.
   - เป็นข้อมูลประเภท Numeric
2. ***name*** - full name of anime.
   - เป็นข้อมูลประเภท Character
3. ***genre*** - comma separated list of genres for this anime.
   - เป็นข้อมูลประเภท Character
4. ***type*** - movie, TV, OVA, etc.
   - เป็นข้อมูลประเภท Character
5. ***episodes*** - how many episodes in this show. (1 if movie).
   - เป็นข้อมูลประเภท Character
6. ***rating*** - average rating out of 10 for this anime.
   - เป็นข้อมูลประเภท Numeric
7. ***members*** - number of community members that are in this anime's "group".
   - เป็นข้อมูลประเภท Numeric

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

## Data Analysis with Descriptive Statistics
### 1.Anime เรื่องไหนที่มีจำนวนของกลุ่มผู้ติดตามมากที่สุด

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
Summary
```
Anime ที่มีจำนวนกลุ่มผู้ติดตามมากที่สุดคือ Death Note ซึ่งมีจำนวนกลุ่มผู้ติดตามอยู่ทั้งหมด 1013917 กลุ่ม
```

### 2.Anime เรื่องไหนที่มีคะแนน rating มากที่สุด

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
Summary
```
Anime ที่มีคะแนน rating มากที่สุดคือ Taka no Tsume 8 ซึ่งมี rating อยู่ที่ 10
```

### 3. 5 อันดับแรกของ Anime แนวไหนที่ผลิตออกมามากที่สุด

Explain here
```
anime %>% separate_rows(genre) %>% count(genre,sort = TRUE) %>% head(n = 5L)
```
Result
```
  genre         n
  <chr>     <int>
1 Comedy     4483
2 Action     2748
3 Adventure  2293
4 Fantasy    2219
5 Fi         2028
```
Summary
```
5 อันดับแรกของ Anime ที่ผลิตออกมามากที่สุดมีดังนี้
1. Comedy 
2. Action
3. Adventure
4. Fantasy    
5. Fi   
```

### 4.Anime เรื่องไหนบ้างที่มี Episodes มากกว่า 100 ตอน และมีคะแนนมากกว่า 8.5/10 คะแนน
Explain
```
anime %>% select(name,episodes,rating) %>% filter(episodes > 100 & rating > 8.50)
```
Result
```
  name                   episodes rating
  <chr>                     <dbl>  <dbl>
1 Hunter x Hunter (2011)      148   9.13
2 Ginga Eiyuu Densetsu        110   9.11
3 Gintama                     201   9.04
4 Slam Dunk                   101   8.56
```
Summary
```
Anime ที่มี Episodes มากกว่า 100 ตอน และมีคะแนนมากกว่า 8.5 มีดังนี้

1. Hunter x Hunter (2011) มีจำนวน episodes อยู่ที่ 148 episodes rating อยู่ที่ 9.13   
2. Ginga Eiyuu Densetsu  มีจำนวน episodes อยู่ที่ 110 episodes rating อยู่ที่ 9.11      
3. Gintama มีจำนวน episodes อยู่ที่ 201 episodes rating อยู่ที่ 9.04    
4. Slam Dunk  มีจำนวน episodes อยู่ที่ 101 episodes rating อยู่ที่ 8.56                   

```
### 5. มี Anime ประเภท OVA ทั้งหมดกี่เรื่องที่มี rating น้อยกว่า 5.0 
Explain
```
anime %>% filter(type == 'OVA' & rating < 5.0) %>% count();
```
Result
```
      n
  <int>
1   148
```
Summary
```
มี Anime ที่เป็นประเภท OVA ทั้งหมด 148 เรื่อง ที่มี rating น้อยกว่า 5.0
```

### 6. มี Anime เรื่องใดบ้างที่ออกฉายทางโทรทัศน์และมีจำนวนตอนมากกว่า 100 ตอนขึ้นไป
Explain
```
anime %>% select(name,type,episodes,rating) %>% filter(type == 'TV' & episodes > 100) %>% print(n = 1000)
```
Result
```
name                                                  type  episodes rating
    <chr>                                                 <chr>    <dbl>  <dbl>
  1 Hunter x Hunter (2011)                                TV         148   9.13
  2 Gintama                                               TV         201   9.04
  3 Slam Dunk                                             TV         101   8.56
  4 Yuu<U+2606>Yuu<U+2606>Hakusho                         TV         112   8.47
  5 Katekyo Hitman Reborn!                                TV         203   8.37
  6 Dragon Ball Z                                         TV         291   8.32
  7 Saiki Kusuo no <U+03A8>-nan (TV)                      TV         120   8.29
  8 Fairy Tail (2014)                                     TV         102   8.25
  9 Fairy Tail                                            TV         175   8.22
 10 D.Gray-man                                            TV         103   8.2 
 11 Kodomo no Omocha (TV)                                 TV         102   8.18
 12 Dragon Ball                                           TV         153   8.16
 13 Touch                                                 TV         101   8.16
 14 Eyeshield 21                                          TV         145   8.08
 15 Prince of Tennis                                      TV         178   8.04
 16 Saint Seiya                                           TV         114   8.03
 17 Hokuto no Ken                                         TV         109   7.99
 18 Kindaichi Shounen no Jikenbo (TV)                     TV         148   7.96
 19 Bleach                                                TV         366   7.95
 20 Keroro Gunsou                                         TV         358   7.93
 21 Lupin III: Part II                                    TV         155   7.93
 22 Chi&#039;s Sweet Home: Atarashii Ouchi                TV         104   7.9 
 23 Ginga Tetsudou 999                                    TV         113   7.9 
 24 InuYasha                                              TV         167   7.89
 25 Ranma <U+00BD>                                        TV         161   7.87
 26 Chibi Maruko-chan                                     TV         142   7.86
 27 Chi&#039;s Sweet Home                                 TV         104   7.83
 28 Kochira Katsushikaku Kameari Kouenmae Hashutsujo (TV) TV         373   7.82
 29 Naruto                                                TV         220   7.81
 30 Urusei Yatsura                                        TV         195   7.78
 31 Doraemon (1979)                                       TV        1787   7.76
 32 Toriko                                                TV         147   7.74
 33 Inazuma Eleven                                        TV         127   7.72
 34 Mainichi Kaasan                                       TV         142   7.71
 35 Aikatsu!                                              TV         178   7.69
 36 Konjiki no Gash Bell!!                                TV         150   7.66
 37 Yawara!                                               TV         124   7.63
 38 Candy Candy                                           TV         115   7.58
 39 Yu<U+2606>Gi<U+2606>Oh! Duel Monsters                 TV         224   7.57
 40 Yu<U+2606>Gi<U+2606>Oh! 5D&#039;s                     TV         154   7.52
 41 Wagamama<U+2606>Fairy Mirumo de Pon!                  TV         172   7.47
 42 Pokemon                                               TV         276   7.43
 43 M<U+00C4>R                                            TV         102   7.42
 44 Atashin&#039;chi                                      TV         330   7.39
 45 Tiger Mask                                            TV         105   7.38
 46 Captain Tsubasa                                       TV         128   7.35
 47 Kinnikuman                                            TV         137   7.35
 48 Kirarin<U+2606>Revolution                             TV         153   7.35
 49 Di Gi Charat Nyo                                      TV         104   7.32
 50 Manga Sekai Mukashibanashi                            TV         127   7.31
 51 Dr. Slump: Arale-chan                                 TV         243   7.28
 52 Tetsuwan Atom                                         TV         193   7.28
 53 Pokemon Diamond &amp; Pearl                           TV         191   7.23
 54 Yu<U+2606>Gi<U+2606>Oh!: Duel Monsters GX             TV         180   7.23
 55 Pokemon Advanced Generation                           TV         192   7.2 
 56 Tsurikichi Sanpei                                     TV         109   7.17
 57 Kyojin no Hoshi                                       TV         182   7.12
 58 Kagaku Ninja-tai Gatchaman                            TV         105   7.1 
 59 Hai! Akko Desu                                        TV         164   7.08
 60 Ikkyuu-san                                            TV         296   7.05
 61 Tsuyoshi Shikkari Shinasai                            TV         112   7.05
 62 Tottoko Hamtarou                                      TV         296   7.03
 63 Ninja Hattori-kun                                     TV         694   6.92
 64 Attack No.1                                           TV         104   6.85
 65 Azuki-chan                                            TV         117   6.83
 66 Cooking Papa                                          TV         151   6.83
 67 Spoon Oba-san                                         TV         130   6.83
 68 Gegege no Kitarou (1996)                              TV         114   6.79
 69 Chirorin Mura Monogatari                              TV         170   6.78
 70 Esper Mami                                            TV         119   6.78
 71 Gegege no Kitarou (1985)                              TV         108   6.77
 72 Time Bokan Series: Yatterman                          TV         108   6.76
 73 Warau Salesman                                        TV         103   6.76
 74 Ganso Tensai Bakabon                                  TV         103   6.75
 75 Line Offline: Salaryman                               TV         114   6.75
 76 Dokonjou Gaeru                                        TV         103   6.74
 77 Pokonyan!                                             TV         170   6.74
 78 Meme Iroiro Yume no Tabi                              TV         127   6.67
 79 Chou Tokkyuu Hikarian                                 TV         156   6.66
 80 Hamster Club                                          TV         140   6.65
 81 Kiteretsu Daihyakka                                   TV         331   6.63
 82 Cookin&#039; Idol Ai! Mai! Main!                      TV         305   6.56
 83 Kabatotto                                             TV         300   6.55
 84 Obake no Q-tarou (1985)                               TV         510   6.54
 85 Parasol Henbei                                        TV         200   6.54
 86 Yadamon                                               TV         170   6.53
 87 Mahoutsukai Sally                                     TV         109   6.49
 88 Manga Nippon Mukashibanashi (1976)                    TV        1471   6.48
 89 Tentou Mushi no Uta                                   TV         104   6.48
 90 O-bake no... Holly                                    TV         200   6.42
 91 Perman (1983)                                         TV         526   6.34
 92 Tamagotchi!                                           TV         143   6.3 
 93 Shima Shima Tora no Shimajirou                        TV         726   6.25
 94 Oishinbo                                              TV         136   6.24
 95 Hey! Bumboo                                           TV         130   6.2 
 96 Oyako Club                                            TV        1818   6.18
 97 Mazinger ZIP!                                         TV         237   6.14
 98 Hoka Hoka Kazoku                                      TV        1428   6.05
 99 Charady no Joke na Mainichi                           TV         365   5.48
100 Bouken Shounen Shadar                                 TV         156   6.65
101 Chengyu Donghua Lang                                  TV         180   6.04
102 Dokaben                                               TV         163   6.49
103 Dororonpa!                                            TV         115   7.5 
104 Dotanba no Manners                                    TV         283   6.75
105 Funassyi no Funafunafuna Biyori                       TV         130   6.86
106 Futago no Monchhichi                                  TV         130   4.86
107 Gan to Gon                                            TV         260   6.7 
108 Ganbare! Oden-kun                                     TV         102   5.83
109 Gatapishi                                             TV         199   7.07
110 Good Morning!!! Doronjo                               TV         225   6   
111 Guru Guru Town Hanamaru-kun                           TV         101   6.53
112 Hakken Taiken Daisuki! Shimajirou                     TV         101   6.85
113 Harley Spiny                                          TV         140   6.06
114 Hero Hero-kun                                         TV         104   6.33
115 Hoshi no Ko Poron                                     TV         260   6.76
116 Inakappe Taishou                                      TV         104   6.8 
117 Instant History                                       TV         312   6.68
118 Itazura Tenshi Chippo-chan                            TV         240   7.33
119 Johnny Cypher                                         TV         130   6.86
120 Kaiketsu Tamagon                                      TV         195   5.65
121 Kaitou Pride                                          TV         105   6.75
122 Kappamaki                                             TV         130   5.43
123 Kirin Ashita no Calendar                              TV        1306   6.43
124 Kirin Monoshiri Yakata                                TV        1565   5.56
125 Kotori Samba                                          TV         240   6.75
126 Kotowaza House                                        TV         773   5.63
127 Manga Hajimete Monogatari                             TV         305   6.36
128 Manga Hajimete Omoshiro Juku                          TV         110   6.68
129 Manga Jinbutsushi                                     TV         365   6.91
130 Manga Naruhodo Monogatari                             TV         102   6.74
131 Miracle! Mimika                                       TV         225   5.28
132 Monoshiri Daigaku: Ashita no Calendar                 TV        1274   6.8 
133 Ninja-tai Gatchaman ZIP!                              TV         475   5.5 
134 Non-tan to Issho                                      TV         263   6.84
135 Obocchama-kun                                         TV         164   6.47
136 Oden-kun                                              TV         156   7.36
137 Ojamanga Yamada-kun                                   TV         103   7.77
138 Otogi Manga Calendar                                  TV         312   6.11
139 Otoko Doahou! Koushien                                TV         156   6.6 
140 Otoko Ippiki Gaki Daishou                             TV         156   7.2 
141 Pinch to Punch                                        TV         156   5.71
142 Pro Golfer Saru (1985)                                TV         143   6.77
143 Robotan                                               TV         104   6.54
144 Roppou Yabure-kun                                     TV         110   6.75
145 Sekai Monoshiri Ryoko                                 TV        1006   5.92
146 Shimajirou Hesoka                                     TV         101   6.6 
147 Sobakasu Pucchi                                       TV         162   7.18
148 Susie-chan to Marvy                                   TV         104   6.69
149 Tetsujin 28-gou Gao!                                  TV         151   7.33
150 Tobidase! Bacchiri                                    TV         132   7.63
151 Uchi no 3 Shimai                                      TV         141   6.68
152 Ultra B                                               TV         119   5.52
153 Urikupen Kyuujo-tai                                   TV         156   5.78
154 Uwabaki Cook no Tekitou Uranai!                       TV         125   4.6 
155 Xiong Chu Mo                                          TV         104   5.67
156 Xiong Chu Mo Zhi Conglin Zhongdongyuan                TV         104   5.67
157 Xiong Chu Mo Zhi Huanqiu Da Maoxian                   TV         104   6.33
158 Youyou no Neko Tsumami                                TV         130   6.09
```
Summary

Anime ที่ออกฉายทางโทรทัศน์และมีจำนวนตอนมากกว่า 100 ตอนขึ้นไป มีดังนี้

Name                |                                 Type  |       Episodes  |      Rating
-------------                |                -------------    |   -------------  | -------------
  1 Hunter x Hunter (2011)                       |          TV      |   148 | 9.13
  2 Gintama                                      |          TV       |  201  | 9.04
  3 Slam Dunk                                    |          TV      |   101  | 8.56
  4 Yuu<U+2606>Yuu<U+2606>Hakusho                |          TV     |    112 |  8.47
  5 Katekyo Hitman Reborn!                       |          TV     |    203  | 8.37
  6 Dragon Ball Z                                |          TV     |    291  | 8.32
  7 Saiki Kusuo no <U+03A8>-nan (TV)             |          TV      |   120  | 8.29
  8 Fairy Tail (2014)                            |          TV    |     102  | 8.25
  9 Fairy Tail                                   |          TV    |     175  | 8.22
 10 D.Gray-man                                   |          TV    |     103  | 8.2 
 11 Kodomo no Omocha (TV)                        |          TV     |    102  | 8.18
 12 Dragon Ball                                  |          TV    |     153 |  8.16
 13 Touch                                        |          TV    |     101  | 8.16
 14 Eyeshield 21                                 |         TV    |     145  | 8.08
 15 Prince of Tennis                            |          TV   |      178  | 8.04
 16 Saint Seiya                                  |         TV   |      114   |8.03
 17 Hokuto no Ken                               |          TV    |     109  | 7.99
 18 Kindaichi Shounen no Jikenbo (TV)           |          TV     |    148 |  7.96
 19 Bleach                                       |         TV      |   366  | 7.95
 20 Keroro Gunsou                                |         TV     |    358   |7.93
 21 Lupin III: Part II                          |          TV    |     155  | 7.93
 22 Chi&#039;s Sweet Home: Atarashii Ouchi       |         TV     |    104   7.9 
 23 Ginga Tetsudou 999                          |          TV     |    113  | 7.9 
 24 InuYasha                                 |             TV     |    167   |7.89
 25 Ranma <U+00BD>                           |             TV     |    161 |  7.87
 26 Chibi Maruko-chan                        |             TV   |    142 |  7.86
 27 Chi&#039;s Sweet Home                     |            TV    |    104   |7.83
 28 Kochira Katsushikaku Kameari Kouenmae Hashutsujo (TV) |TV     |    373  | 7.82
 29 Naruto                                   |             TV     |    220   7.81
 30 Urusei Yatsura                           |             TV   |     195  | 7.78
 31 Doraemon (1979)                          |             TV    |    1787  | 7.76
 32 Toriko                                   |             TV   |     147  | 7.74
 33 Inazuma Eleven                           |             TV    |     127  | 7.72
 34 Mainichi Kaasan                          |             TV    |     142  | 7.71
 35 Aikatsu!                                  |            TV   |     178  | 7.69
 36 Konjiki no Gash Bell!!                    |            TV     |    150  | 7.66
 37 Yawara!                                    |           TV    |    124  | 7.63
 38 Candy Candy                                |           TV    |    115 |  7.58
 39 Yu<U+2606>Gi<U+2606>Oh! Duel Monsters       |          TV    |    224  | 7.57
 40 Yu<U+2606>Gi<U+2606>Oh! 5D&#039;s          |           TV     |    154  | 7.52
 41 Wagamama<U+2606>Fairy Mirumo de Pon!      |            TV     |    172  | 7.47
 42 Pokemon                                   |            TV    |     276 |  7.43
 43 M<U+00C4>R                                |            TV     |    102 |  7.42
 44 Atashin&#039;chi                           |           TV      |   330  | 7.39
 45 Tiger Mask                                |            TV     |    105  | 7.38
 46 Captain Tsubasa                           |            TV      |   128 |  7.35
 47 Kinnikuman                                |            TV     |    137 |  7.35
 48 Kirarin<U+2606>Revolution                 |            TV      |   153  | 7.35
 49 Di Gi Charat Nyo                          |            TV      |   104  | 7.32
 50 Manga Sekai Mukashibanashi                |            TV    |     127 |  7.31
 51 Dr. Slump: Arale-chan                     |            TV   |      243 |  7.28
 52 Tetsuwan Atom                              |           TV    |     193  | 7.28
 53 Pokemon Diamond &amp; Pearl                  |         TV    |     191 |  7.23
 54 Yu<U+2606>Gi<U+2606>Oh!: Duel Monsters GX   |          TV   |      180 |  7.23
 55 Pokemon Advanced Generation                |           TV    |     192 |  7.2 
 56 Tsurikichi Sanpei                        |             TV    |     109  | 7.17
 57 Kyojin no Hoshi                           |            TV      |   182 |  7.12
 58 Kagaku Ninja-tai Gatchaman                |            TV       |  105   7.1 
 59 Hai! Akko Desu                            |            TV     |    164  | 7.08
 60 Ikkyuu-san                                |            TV     |    296   7.05
 61 Tsuyoshi Shikkari Shinasai                |            TV    |     112   7.05
 62 Tottoko Hamtarou                           |           TV      |   296  | 7.03
 63 Ninja Hattori-kun                          |           TV     |   694  | 6.92
 64 Attack No.1                                 |          TV    |     104  | 6.85
 65 Azuki-chan                                 |           TV     |    117 |  6.83
 66 Cooking Papa                              |            TV     |    151  | 6.83
 67 Spoon Oba-san                             |            TV      |   130  | 6.83
 68 Gegege no Kitarou (1996)                  |            TV     |    114 |  6.79
 69 Chirorin Mura Monogatari                  |            TV     |    170  | 6.78
 70 Esper Mami                                |            TV     |    119  | 6.78
 71 Gegege no Kitarou (1985)                  |            TV     |    108 |  6.77
 72 Time Bokan Series: Yatterman               |           TV    |     108  | 6.76
 73 Warau Salesman                             |           TV     |    103  | 6.76
 74 Ganso Tensai Bakabon                      |            TV     |    103 |  6.75
 75 Line Offline: Salaryman                   |            TV     |    114 |  6.75
 76 Dokonjou Gaeru                            |            TV     |    103   |6.74
 77 Pokonyan!                                   |          TV    |     170 |  6.74
 78 Meme Iroiro Yume no Tabi                  |            TV    |     127 |  6.67
 79 Chou Tokkyuu Hikarian                    |             TV   |      156 |  6.66
 80 Hamster Club                              |            TV   |      140 |  6.65
 81 Kiteretsu Daihyakka                        |           TV   |      331 |  6.63
 82 Cookin&#039; Idol Ai! Mai! Main!         |            TV    |     305  | 6.56
 83 Kabatotto                                |             TV   |      300  | 6.55
 84 Obake no Q-tarou (1985)                   |            TV   |      510  | 6.54
 85 Parasol Henbei                            |            TV     |    200  | 6.54
 86 Yadamon                                   |            TV     |    170  | 6.53
 87 Mahoutsukai Sally                          |           TV     |    109  | 6.49
 88 Manga Nippon Mukashibanashi (1976)          |          TV   |     1471 |  6.48
 89 Tentou Mushi no Uta                          |         TV     |    104 |  6.48
 90 O-bake no... Holly                            |        TV    |     200 |  6.42
 91 Perman (1983)                                 |        TV     |    526 |  6.34
 92 Tamagotchi!                                    |       TV     |    143   |6.3 
 93 Shima Shima Tora no Shimajirou                |        TV    |     726 |  6.25
 94 Oishinbo                                      |        TV     |    136  | 6.24
 95 Hey! Bumboo                                   |        TV     |    130  | 6.2 
 96 Oyako Club                                    |        TV     |   1818  | 6.18
 97 Mazinger ZIP!                                 |        TV    |     237 |  6.14
 98 Hoka Hoka Kazoku                              |        TV     |   1428|   6.05
 99 Charady no Joke na Mainichi                   |        TV     |    365  | 5.48
100 Bouken Shounen Shadar                         |        TV      |   156  | 6.65
101 Chengyu Donghua Lang                          |        TV     |    180  | 6.04
102 Dokaben                                       |        TV     |    163  | 6.49
103 Dororonpa!                                    |        TV    |     115 |  7.5 
104 Dotanba no Manners                            |        TV      |   283  | 6.75
105 Funassyi no Funafunafuna Biyori              |         TV     |    130  | 6.86
106 Futago no Monchhichi                          |        TV     |    130  | 4.86
107 Gan to Gon                                    |        TV    |     260 |  6.7 
108 Ganbare! Oden-kun                            |         TV     |    102 |  5.83
109 Gatapishi                                     |        TV    |     199 |  7.07
110 Good Morning!!! Doronjo                      |         TV    |     225  | 6   
111 Guru Guru Town Hanamaru-kun                  |         TV      |   101  | 6.53
112 Hakken Taiken Daisuki! Shimajirou             |        TV     |    101  | 6.85
113 Harley Spiny                                   |       TV     |    140 |  6.06
114 Hero Hero-kun                                  |       TV    |     104 |  6.33
115 Hoshi no Ko Poron                             |        TV  |       260 |  6.76
116 Inakappe Taishou                              |        TV   |      104  | 6.8 
117 Instant History                               |        TV     |    312 |  6.68
118 Itazura Tenshi Chippo-chan                    |        TV   | |    240  | 7.33
119 Johnny Cypher                                 |        TV     |    130  | 6.86
120 Kaiketsu Tamagon                              |        TV    |     195   |5.65
121 Kaitou Pride                                  |        TV    |     105 |  6.75
122 Kappamaki                                     |        TV    |     130 |  5.43
123 Kirin Ashita no Calendar                       |       TV    |    1306 |  6.43
124 Kirin Monoshiri Yakata                        |        TV   |     1565 |  5.56
125 Kotori Samba                                    |      TV   |      240 |  6.75
126 Kotowaza House                                |        TV   |      773  | 5.63
127 Manga Hajimete Monogatari                     |        TV    |     305  | 6.36
128 Manga Hajimete Omoshiro Juku                 |         TV    |     110 |  6.68
129 Manga Jinbutsushi                             |        TV   |      365 |  6.91
130 Manga Naruhodo Monogatari                    |        TV     |    102  | 6.74
131 Miracle! Mimika                              |         TV    |     225 |  5.28
132 Monoshiri Daigaku: Ashita no Calendar        |         TV      |  1274  | 6.8 
133 Ninja-tai Gatchaman ZIP!                      |        TV     |     475  |  5.5 
134 Non-tan to Issho                              |        TV    |      263 |   6.84
135 Obocchama-kun                                 |        TV    |      164 |   6.47
136 Oden-kun                                      |        TV   |       156 |   7.36
137 Ojamanga Yamada-kun                           |        TV    |      103 |   7.77
138 Otogi Manga Calendar                          |        TV    |      312 |   6.11
139 Otoko Doahou! Koushien                        |        TV    |      156 |   6.6 
140 Otoko Ippiki Gaki Daishou                      |       TV    |      156 |   7.2 
141 Pinch to Punch                                |        TV   |       156 |   5.71
142 Pro Golfer Saru (1985)                        |        TV     |     143  |  6.77
143 Robotan                                       |        TV    |      104 |   6.54
144 Roppou Yabure-kun                            |         TV    |      110  |  6.75
145 Sekai Monoshiri Ryoko                        |         TV      |   1006 |   5.92
146 Shimajirou Hesoka                            |         TV     |     101 |    6.6 
147 Sobakasu Pucchi                                 |      TV   |     162   | 7.18
148 Susie-chan to Marvy                           |        TV    |     104  | 6.69
149 Tetsujin 28-gou Gao!                          |        TV     |    151  | 7.33
150 Tobidase! Bacchiri                            |        TV     |    132  | 7.63
151 Uchi no 3 Shimai                              |        TV     |    141  | 6.68
152 Ultra B                                        |       TV     |    119  | 5.52
153 Urikupen Kyuujo-tai                           |        TV     |    156  | 5.78
154 Uwabaki Cook no Tekitou Uranai!              |         TV     |    125  | 4.6 
155 Xiong Chu Mo                                    |      TV     |    104  | 5.67
156 Xiong Chu Mo Zhi Conglin Zhongdongyuan          |      TV     |    104  | 5.67
157 Xiong Chu Mo Zhi Huanqiu Da Maoxian            |       TV     |    104  | 6.33
158 Youyou no Neko Tsumami                         |       TV     |    130  | 6.09

###  7. มีประเภทของ Anime ทั้งหมดกี่ประเภท และแต่ละประเภทมี Anime อยู่ทั้งหมดกี่เรื่อง
Explain
```
library(tidyr)
anime %>% separate_rows(genre) %>% count(genre) %>% tally(!is.na(genre))
```
Result
```
      n
  <int>
1    47
```

Explain
```
anime %>% separate_rows(genre) %>% count(genre) %>% print(n = 50)
```
Result
```
   genre             n
   <chr>         <int>
 1 Action         2845
 2 Adventure      2348
 3 Ai              120
 4 Arts            265
 5 Cars             72
 6 Comedy         4645
 7 Dementia        240
 8 Demons          294
 9 Drama          2016
10 Ecchi           637
11 Fantasy        2309
12 Fi             2070
13 Game            181
14 Harem           317
15 Hentai         1141
16 Historical      806
17 Horror          369
18 Josei            54
19 Kids           1609
20 Life           1220
21 Magic           778
22 Martial         265
23 Mecha           944
24 Military        426
25 Music           860
26 Mystery         495
27 of             1220
28 Parody          408
29 Police          197
30 Power           465
31 Psychological   229
32 Romance        1464
33 Samurai         148
34 School         1220
35 Sci            2070
36 Seinen          547
37 Shoujo          658
38 Shounen        1777
39 Slice          1220
40 Space           381
41 Sports          543
42 Super           465
43 Supernatural   1037
44 Thriller         87
45 Vampire         102
46 Yaoi             39
47 Yuri             42
```
Summary
```
มีประเภท Anime ใน dataset ทั้งหมด 47 ประเภท ซึ่งแต่ละประเภทจะมีจำนวนเรื่องทั้งหมดดังตารางนี้
```
  Genre   |  n
------    | ------ 
Action      |   2845
Adventure   |   2348
Ai           |   120
Arts       |     265
Cars       |      72
Comedy     |    4645
Dementia   |     240
Demons     |     294
Drama     |     2016
Ecchi      |     637
Fantasy   |     2309
Fi        |     2070
Game      |      181
Harem      |     317
Hentai     |    1141
Historical  |    806
Horror     |     369
Josei     |       54
Kids     |      1609
Life      |     1220
Magic      |     778
Martial    |     265
Mecha      |     944
Military   |     426
Music      |     860
Mystery    |     495
of         |    1220
Parody     |     408
Police     |     197
Power      |     465
Psychological |  229
Romance   |     1464
Samurai    |     148
School     |    1220
Sci        |    2070
 Seinen     |     547
Shoujo     |     658
Shounen    |    1777
Slice      |    1220
Space      |     381
Sports      |    543
Super      |     465
Supernatural  | 1037
Thriller    |     87
Vampire     |    102
Yaoi        |     39
Yuri        |     42
