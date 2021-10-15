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
5. มี Anime ประเภท OVA ทั้งหมดกี่เรื่องที่มี rating น้อยกว่า 5.0 
6. มี Anime เรื่องใดบ้างที่ออกฉายทางโทรทัศน์และมีจำนวนตอนมากกว่า 100 ตอนขึ้นไป
7. มีประเภทของ Anime ทั้งหมดกี่ประเภท และแต่ละเภทมี Anime ทั้งหมดกี่เรื่อง


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
anime %>% count(genre,sort = TRUE) %>% head(n = 5L)
```
Result
```
  genre                     n
  <chr>                 <int>
1 Hentai                  785
2 Comedy                  500
3 Music                   297
4 Kids                    190
5 Comedy, Slice of Life   166
```

## 4.Anime เรื่องไหนบ้างที่มี Episodes มากกว่า 100 ตอน และมีคะแนนมากกว่า 8.5/10 คะแนน
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
1   148
```

## 6. มี Anime เรื่องใดบ้างที่ออกฉายทางโทรทัศน์และมีจำนวนตอนมากกว่า 100 ตอนขึ้นไป
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
## 7. มีประเภทของ Anime ทั้งหมดกี่ประเภท และแต่ละเภทมี Anime ทั้งหมดกี่เรื่อง
Explain
```

```
Result
```

```
