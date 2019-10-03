# In this lesson we'll discuss principal component analysis (PCA) and singular value decomposition (SVD), two important and related techniques
# of dimension reduction. This last entails processes which finding subsets of variables in datasets that contain their essences. PCA and SVD
# are used in both the exploratory phase and the more formal modelling stage of analysis. We'll focus on the exploratory phase and briefly
# touch on some of the underlying theory.

dataMatrix
heatmap(dataMatrix)

## create data with a patterin
set.seed(678910)
for(i in 1:40){
        # flip a coin
        coinFlip <- rbinom(1,size=1,prob=0.5)
        # if coin is heads add a common pattern to that row
        if(coinFlip){
                dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3),each=5)
        }
}

hclust(dataMatrix)

############################################################
# PCA which stands for Principal Component Analysis and SVD, Singular Value Decomposition. This
# latter simply means that we express a matrix X of observations (rows) and variables (columns) as the product of 3 other matrices, i.e.,
# X=UDV^t. This last term (V^t) represents the transpose of the matrix V. Here U and V each have orthogonal (uncorrelated) columns. U's columns are the left singular vectors of X and V's columns are the right
# singular vectors of X.  D is a diagonal matrix, by which we mean that all of its entries not on the diagonal are 0. The diagonal entries of
# D are the singular values of X.

svd(mat) # singluar value decomposition
matu %*% diag %*% t(matv)

# PCA, Principal Component Analysis, "a simple, non-parametric method for extracting relevant information from confusing data sets.
#Basically, PCA is a method to reduce a high-dimensional data set to its essential elements (not lose information) and explain the
# variability in the data. SVD and PCA are closely related. First we have to scale mat, our simple example data matrix.  This means that we subtract the column mean from
# every element and divide the result by the column standard deviation. Of course R has a command, scale, that does this for you.
svd(scale(mat))
prcomp(scale(mat))

svd1$v[,1]

# the first column of U and V show the means of rows and columns
# Why were the first columns of both the U and V matrices so special?  Well as it happens, the D matrix of the SVD explains this phenomenon.
# It is an aspect of SVD called variance explained. Recall that D is the diagonal matrix sandwiched in between U and V^t in the SVD
# representation of the data matrix. The diagonal entries of D are like weights for the U and V columns accounting for the variation in the
# data. They're given in decreasing order from highest to lowest. Look at these diagonal entries now. Recall that they're stored in svd1$d.

svd1$d

# Here's a display of these values (on the left). The first one (12.46) is significantly bigger than the others. Since we don't have any units
# specified, to the right we've plotted the proportion of the variance each entry represents. We see that the first entry accounts for about
# 40% of the variance in the data. This explains why the first columns of the U and V matrices respectively showed the distinctive patterns in
# the row and column means so clearly.

# The problem with them that you should be aware of, is that they cannot deal with MISSING data.  luckily we have ways to work around this problem. One we'll just mention
# is called imputing the data. The bioconductor package (http://bioconductor.org) has an  impute package which you can use to fill in missing data. One specific function in it is impute.knn.

a1 <- (svd1$u[,1] * svd1$d[1]) %*% t(svd1$v[,1]) 
a2 <- svd1$u[,1:2] %*% diag(svd1$d[1:2]) %*% t(svd1$v[,1:2])
myImage(svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5]))
myImage(svd1$u[,1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[,1:10]))