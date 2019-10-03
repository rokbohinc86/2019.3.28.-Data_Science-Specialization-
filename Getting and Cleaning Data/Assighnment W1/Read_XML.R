# download
library(XML)
doc <- xmlTreeParse("./data/restaurants.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)

# the name of the node
xmlName(rootNode)

# look at all levels "//" of "rootnode" for a "zipcode" and return the value xmlValue
vec <-xpathSApply(rootNode,"//zipcode", xmlValue)

print(sum(as.numeric(vec) == 21231))