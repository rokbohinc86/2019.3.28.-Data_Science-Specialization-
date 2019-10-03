

con = url("http://biostat.jhsph.edu/~jleek/contact.html") # opens a connection to an url
htmlCode = readLines(con) # reads lines
close(con)# closes the connection to the url
htmlCode # but his s unreadable
nchar(htmlCode)[c(10,20,30,100)]