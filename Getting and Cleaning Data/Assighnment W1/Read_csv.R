#  How many properties are worth $1,000,000 or more?
# data should be first read into the workspace

data <- read.csv("./data/housing.csv")
# table counts the number of occurences of each element in a list
print(table(data$VAL))

