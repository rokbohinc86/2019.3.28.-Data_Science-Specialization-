con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en") # opens a connection to an url
htmlCode = readLines(con) # reads lines
close(con)# closes the connection to the url
htmlCode # but his s unreadable

# you can use xml
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=T) # doesn't work

xpathSApply(html, "//title", xmlValue)
xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

# httr package
library(httr)
html2 = GET(url)
content2 = content(html2,as="text") # extract content from the webpage
parsedHtml = htmlParse(content2,asText=TRUE) # parse the content -> the result is the same as with using xml
xpathSApply(parsedHtml, "//title", xmlValue)

# with get you can authenticate yourself for websites needing username and pasword
pg2 = GET("http://httpbin.org/basic-auth/user/passwd", authenticate("user","passwd")) # pg2 is a handle
pg2
names(pg2)

# Using handles is a good idea because if you authenticate yourself once through the a handel you don't need to do it later
# if you are looking at directories within this handle
google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google,path="search")