library(RMySQL)
ucscDb <- dbConnect(MySQL(),user="genome", host="genome-mysql.cse.ucsc.edu") # Use DB connect to connect to server (can be also other than mysql)
result <- dbGetQuery(ucscDb,"show databases;") # get databse
dbDisconnect(ucscDb) # disconnect from the serever

hg19 <- dbConnect(MySQL(),user="genome", db="hg19",host="genome-mysql.cse.ucsc.edu") # access "hg19" data base from the server
allTables <- dbListTables(hg19) # tables(=data frame) names within the database
length(allTables)
dbListFields(hg19,"affyU133Plus2") # What are the fields (column names) in table "affyU133Plus2" of "hg19"
dbGetQuery(hg19, "select count(*) from affyU133Plus2") # what are the number of rows, return the number of records

affyData <- dbReadTable(hg19, "affyU133Plus2") # Read table out
head(affyData)


query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3") # Read subset of a table, misMatches between 1 and 3
affyMis <- fetch(query); # You have to fetch the result 
quantile(affyMis$misMatches)

affyMisSmall <- fetch(query,n=10); # fetch only a small amout of the data set, only ten rows
dbClearResult(query) # clear query

dbDisconnect(hg19) # disconnect from the serever