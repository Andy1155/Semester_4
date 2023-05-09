#b
# Create two numeric vectors of different lengths
x <- c(1.2, 2.3, 3.4, 4.5)
y <- c(5.6, 6.7, 7.8)

# Calculate the expression 2*x + y - 3
result <- 2*x + y - 3

# Print the result
print(result)
#c
s = seq(101, 500, 2)
s
#d
mean(s)
sd(s)
summary(s)
#e
# create a vector, array, and list
vec <- c(1, 2, 3)
arr <- array(1:48, dim = c(2, 4, 3, 2))
lst <- list("a", 2, TRUE)

# create a list containing the vector, array, and list
mylist <- list(vec, arr, lst)

# print the list
print(mylist)
#f
m1 = matrix(1:6, 2,3)
m1
m2 = matrix(1:6, 3,2)
m2
m1%*%m2
#g
apply(m1, 1, mean)
rowMeans(m1)
apply(m1, 2, mean)
colMeans(m1)
#h
rbind(m1, t(m2))
cbind(m1, t(m2))
#i 
mat = matrix(1:12, 3, 4)
mat
mat[c(1,2), ]

#
#q2
#
data(airquality)
airquality
str(airquality)
head(airquality)
tail(airquality)

# Display the number of observations and variables
dim(airquality)
complete.cases(airquality)
sum(complete.cases(airquality))
temp7080 = subset(airquality, Temp >= 70 & Temp <= 80)
month5 = subset(airquality, Month == 5)
nrow(month5)
airquality[1:10, ]
summary(airquality$Wind)
sort(airquality,Wind)
airquality[order(-airquality$Wind), ]

data("airquality")
airquality = rbind(airquality, c(55,66,77,2.2, 88, 9))

################
#Q3
################

setwd("C:/Users/andy1/Downloads/toyDataSet")
toy_dataset = read.csv("toy_dataset.csv")
toy_dataset
summary(toy_dataset)
head(toy_dataset$Age)
nrow(subset(toy_dataset, City == "New York City"))
toy_income_ordered = toy_dataset[order(toy_dataset$Income),]
tail(toy_income_ordered, 5)
sum(toy_dataset$Income > mean(toy_dataset$Income))
max(subset(toy_dataset, Gender == "Female")$Income)
toy_dataset[sample(nrow(toy_dataset), 10), ]
attach(toy_dataset)
detach(toy_dataset)

########
#Q4
########

library(RSQLite)
stu = dbConnect(RSQLite::SQLite(), dbname = "students.db")
dbExecute(stu, "CREATE TABLE STUDENT (
                  ID INTEGER PRIMARY KEY,
                  NAME TEXT,
                  AGE INTEGER,
                  GRADE INTEGER);")

dbExecute(stu, "INSERT INTO STUDENT (ID, NAME, AGE, GRADE) VALUES 
                  (1, 'John', 18, 85),
                  (2, 'Alice', 17, 90),
                  (3, 'Bob', 18, 80),
                  (4, 'David', 17, 95);")
dbExecute(stu, "delete from student")
dbExecute(stu, "drop table student")

########
#Q6
########
install.packages("ggplot2")
data("iris")
iris
summary(iris)
seto = subset(iris, Species == "setosa")
par(mar = c(4, 4, 2, 1))
plot(seto$Sepal.Length, seto$Sepal.Width, 
     xlab = "Sepal Length", ylab = "Sepal Width",
     main = "Scatter plot of Sepal length vs Sepal width for Setosa")
hist(iris$Petal.Length, main = "Histogram of Petal Length", xlab = "Petal Length")
ver = subset(iris, Species == "versicolor")
ver
boxplot(ver$Petal.Length)

#######
#Q7
#######

getwd()
setwd("D:/andy/DELHI_UNIVERSITY/Hans_Raj_College/Semester_4/R")
Beer <- c(5.24, 5.15, 5.06, 5.07, 4.8, 4.97, 4.68, 4.58, 4.57, 4.49, 4.26)
Wine <- c(2.86, 2.87, 2.94, 2.95, 2.91, 3.01, 3.07, 3.13, 3.11, 2.59, 2.65)
Spirit <- c(1.81, 1.77, 1.88, 2.07, 1.81, 1.86, 2.06, 2.12, 2.15, 1.77, 1.64)
Country <- c("Australia", "Australia", "NewZealand", "Australia", "NewZealand", "NewZealand", "Australia", "NewZealand", "Australia", "NewZealand", "NewZealand")
Year <- c(1998, 1999, 2002, 2001, 1999, 2000, 2004, 2003, 2006, 1998, 2004)

df <- data.frame(Beer, Wine, Spirit, Country, Year)

# Write the tab-delimited data to a file
write.table(df, file = "mydata.txt", sep = "\t", row.names = FALSE)
df = read.delim("mydata.txt")
df

# For each year, display the country with maximum Beer consumption and minimum Wine consumption
for (year in unique(df$Year)) {
  temp <- subset(df, Year == year)
  print(temp)
  max_beer_country <- temp[which.max(temp$Beer), "Country"]
  min_wine_country <- temp[which.min(temp$Wine), "Country"]
  cat("For year", year, ":\n")
  cat("Country with maximum Beer consumption:", max_beer_country, "\n")
  cat("Country with minimum Wine consumption:", min_wine_country, "\n\n")
}

for (country in unique(df$Country)){
  temp = subset(df, Country == country)
  consumption = temp$Spirit + temp$Beer + temp$Wine
  print(paste("consumption each year in", country, "is", consumption), sep = " ")
  avg = mean(consumption)
  print(avg)
}
nz = subset(df, Country == "NewZealand")
drinkingyearnz = subset(nz, mean(Spirit) > Spirit)
drinkingyearnz$Year
paste("drinking years are", paste(drinkingyearnz$Year, collapse = " "))

      