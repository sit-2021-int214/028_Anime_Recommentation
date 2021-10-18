
library(dplyr)
library(readr)
library("ggplot2")
library(forcats)

#Load data
books <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

View(books)

books %>% mutate(Type = fct_lump(Type,n=3)) %>%
  count(Type, sort = TRUE)

#1 What is the average review of each book type?
books %>% mutate(Type = fct_lump(Type,n=5)) %>%  group_by(Type) %>%
  summarise(mean = mean(Reviews, na.rm = TRUE))
 
#2 What is the average price of each book type?
books %>% mutate(Type = fct_lump(Type,n=5)) %>%  group_by(Type) %>%
  summarise(Price = mean(Price, na.rm = TRUE))

#3 What is the average rating of each book type?
books %>% mutate(Type = fct_lump(Type,n=5)) %>%  group_by(Type) %>%
  summarise(Rate = mean(Rating, na.rm = TRUE))

#4 Find hardcover books that cost over $100. grouped by book type
books %>% filter(Type == 'Hardcover' & Price > 100) %>% group_by(Type)

#5 Find the average number of pages for each type of book.
books %>% mutate(Type = fct_lump(Type,n=5)) %>%  group_by(Type) %>%
  summarise(Number_Of_Pages = mean(Number_Of_Pages, na.rm = TRUE))

#6 Find Book title,Price,Reviews,Rating with higher than average reviews
books %>% select(Book_title,Price,Reviews,Rating) %>% filter(Reviews > mean(Reviews, na.rm = TRUE))


#plot1  The bar chart represents the Number Of Pages average of Type Book.

Page_plot <- books %>% mutate(Type = fct_lump(Type,n=5)) %>%  group_by(Type) %>%
  summarise(Number_Of_Pages = mean(Number_Of_Pages, na.rm = TRUE))

Page_plot <- Page_plot %>% ggplot(aes(x = fct_infreq(Type),y = Number_Of_Pages,fill=Type)) + geom_bar(stat="identity") 

Page_plot + ggtitle("Number Of Pages average of Type Book") + xlab("Type") + ylab("Number Of Pages average")

#plot2 the average price of each book type?

bookPrice_plot <- books %>% mutate(Type = fct_lump(Type,n=5)) %>%  group_by(Type) %>%
  summarise(Price = mean(Price, na.rm = TRUE))

bookPrice_plot <- bookPrice_plot %>% ggplot(aes(x = Type,y = Price)) + geom_point(aes(color=Type)) + coord_flip() 

bookPrice_plot + ggtitle("Price Average of Type Book") +
  xlab("Type") + ylab("Price average")

