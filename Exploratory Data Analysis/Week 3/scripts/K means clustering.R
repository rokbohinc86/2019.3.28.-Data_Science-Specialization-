# K-means is a partioning approach which requires that you first guess how many clusters you have (or want). Once you fix this
# number, you randomly create a "centroid" (a phantom point) for each cluster and assign each point or observation in your dataset to the
# centroid to which it is closest. Once each point is assigned a centroid, you readjust the centroid's position by making it the average of
# the points assigned to it.
# When it's finished k-means clustering returns a final position of each cluster's centroid as well as the assignment of each data point or
# observation to a cluster.

cmat # 2 by 3 matrix of initial x,y guesses
cx # x positions
cy # y positions
distTmp <- mdist(x,y,cx,cy) # custum function calculating the euclidian distans bewen points and centroids, returns a matrix of distances 3 by 12

# Then you assign points to clusters
newClust <- apply(distTmp,2, which.min)

# Then you recalculate the centroids x and y
newCx <- tapply(x,newClust,mean)
newCy <- tapply(y,newClust,mean)

distTmp <- mdist(x, y, newCx, newCy)
newClust2 <-apply(distTmp2,2, which.min)
finalCx <- tapply(x,newClust2,mean)
finalCy <- tapply(y,newClust2,mean)

# Now that you've gone through an example step by step, you'll be relieved to hear that R provides a command to do all this work for you.
# Unsurprisingly it's called kmeans and, although it has several parameters, we'll just mention four. These are x, (the numeric matrix of
# data), centers, iter.max, and nstart. The second of these (centers) can be either a number of clusters or a set of initial centroids. The
# third, iter.max, specifies the maximum number of iterations to go through, and nstart is the number of random starts you want to try if you
# specify centers as a number.

kmObj <- kmeans(dataFrame,3)
kmObj$iter
kmObj$cluster
plot(x,y,col=kmObj$cluster,pch=19,cex=2)
points(kmObj$centers,col=c("black","red","green"),pch=3,cex=3,lwd=3)

plot(x,y,col=kmeans(dataFrame,6)$cluster,pch=19,cex=2)