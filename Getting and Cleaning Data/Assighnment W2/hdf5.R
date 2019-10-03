library(rhdf5)
# creating files
created = h5createFile("example.h5") # create an hdf5 file called example.h5 
created

# creating groups and subgroups
created = h5createGroup("example.h5","foo") # creates a group foo inseide the file
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa") # creates a subgroup of a group
h5ls("example.h5")

# write to groups
A = matrix(1:10,nr=5,nc=2)
h5write(A, "example.h5","foo/A") # writes a matrix to a group
B = array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B, "scale") <- "liter" # the scale has units "liter"
h5write(B, "example.h5","foo/foobaa/B") # write an array to a group
h5ls("example.h5")

# write directly to a group
df = data.frame(1L:5L, seq(0,1,length.out=5), c("ab","cde","fghi","a","s"), stringsAsFactors=FALSE) # create dataframe
h5write(df, "example.h5","df")
h5ls("example.h5")

# reading data
readA = h5read("example.h5","foo/A")
readB = h5read("example.h5","foo/foobaa/B")
readdf= h5read("example.h5","df")
readA

# write to an existing table something
h5write(c(12,13,14),"example.h5","foo/A",index=list(1:3,1)) # index is specifiing to which row and column we should write
h5read("example.h5","foo/A")
# you can also use index to specify which elements you want to read with h5read

