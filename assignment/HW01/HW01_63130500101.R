#Exercise 1
ex1 <- c(10.4, 5.6, 3.1, 6.4, 21.7)
mean(ex1) #1.1 average
sum(ex1) #1.2 sum
median(ex1) #1.3 median
sd(ex1) #1.4 sd
var(ex1) #1.5 variance

#Exercise 2
# List of Marvel movies (Order by Marvel Phase released)
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# Or using Function
years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))


marvel_movies <- data.frame(
  Movies = names,
  Years = years
)
View(marvel_movies) # 2.1
# Because data.frame makes the data related.

#2.2 Finding the information:
#The numbers of movies
length(names) # 2.2.1

#Finding the 19th movies name
names[19] #2.2.2

#Which year is most released movies 
#(In this question can using observation data, 
#not necessary to used command to find answer)
table (years)

