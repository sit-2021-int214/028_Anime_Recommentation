# Library
library(dplyr)
library(readr)
library("ggplot2")
library(forcats)

#Load data
books <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
View(books)


books %>% select(Book_title, Number_Of_Pages) %>% filter(Number_Of_Pages > 1000)

books %>% select(Type) %>% group_by(Type) %>% count(Type,sort=T)

books %>% mutate(Type = fct_lump(Type,n=5)) %>%  group_by(Type) %>%
  summarise(Price_Mean = mean(Price, na.rm = TRUE)) %>% filter(Price_Mean >40)

books %>% mutate(Type = fct_lump(Type,n=5)) %>%  group_by(Type) %>%
  summarise(Rating = mean(Rating, na.rm = TRUE)) %>% filter(Rating > 4.20)


books %>% select(Book_title, Type, Price, Rating) %>% filter(Type == 'Paperback' & Price > 100)


books %>% filter(Price < mean(Price, na.rm=TRUE)) %>% group_by(Type) %>% count(Type,sort=T)

Rate_plot <- books %>% mutate(Type = fct_lump(Type,n=5)) %>%  group_by(Type) %>%
  summarise(Rating = mean(Rating, na.rm = TRUE))

Rate_plot <- Rate_plot %>% ggplot(aes(x = fct_infreq(Type),y = Rating,fill=Type)) + 
  geom_bar(stat="identity") + geom_text(aes(label=Rating), vjust=2)


Rate_plot + ggtitle("Rating average of Type Book") + xlab("Type") + ylab("Rating average")

#GGPLOT2

count_plot <- books %>% mutate(Type = fct_lump(Type,n=5)) %>% count(Type,sort = T)

count_plot <- count_plot %>% ggplot(aes(x = fct_infreq(Type),y = n)) + 
  geom_line(size = 1) + geom_point(aes(color=Type), size=3) 

count_plot + ggtitle("Count of Type Book") +
  xlab("Type") + ylab("Quantity")
