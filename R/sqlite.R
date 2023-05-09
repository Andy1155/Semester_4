install.packages("RSQLite")
library(RSQLite)

mydb = dbConnect(RSQLite::SQLite(), "mydatabase.sqlite")

result = dbSendQuery(mydb, "CREATE TABLE mytable (id INT NOT NULL ,name VARCHAR(50), age INT, PRIMARY KEY (id))")

df = data.frame(
	id = c(1,2,3,4),
	name = c("a", "b", "c", 'd'),
	age = c(11,12,13,14)
)
print(df)

dbWriteTable(mydb, "mytable", df, append = TRUE)

dbReadTable(mydb, "mytable")

dbGetQuery(mydb, "select * from mytable where age>12") 
