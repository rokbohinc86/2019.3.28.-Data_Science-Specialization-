ssd # matrix
names(ssd[562:563]) # subject and activity
# with function transform you can convert character to factor column, similar as mutate
sub1 <- subset(ssd, subject == 1)

#plot data
par(mfrow=c(1, 2), mar = c(5, 4, 1, 1))
plot(sub1[, 1], col = sub1$activity, ylab = names(sub1)[1])
plot(sub1[, 2], col = sub1$activity, ylab = names(sub1)[2])
legend("bottomright",legend=unique(sub1$activity),col=unique(sub1$activity), pch = 1)
par(mfrow=c(1,1))

mdist <- dist(sub1[,1:3]) 
# "tBodyAcc.mean...X" "tBodyAcc.mean...Y" "tBodyAcc.mean...Z"
hclustering <- hclust(mdist)
myplclust(hclustering, lab.col = unclass(sub1$activity))

mdist <- dist(sub1[,10:12]) # this are the maximum accelerations
hclustering <- hclust(mdist)
myplclust(hclustering, lab.col = unclass(sub1$activity))

svd1 <- svd(scale(sub1[,-c(562,563)])) # do svd on all values but activity and subject
# than you look at the first 2 columns of svd1$u, the frst column shows the sepparation between activity and nonactivity
# the second sepparates walking up from the others, but you dont know why. To understand this you look at which of the 500+ measurements
# contributes the most to the variation of this second column of svd1$v.
plot(svd1$u[,2], col = unclass(sub1$activity))
legend("topright", legend = unique(sub1$activity), col = unique(unclass(sub1$activity)), pch=1)

maxCon <- which.max(svd1$v[,2])
mdist <- dist(sub1[,c(10:12,maxCon)]) # We saw that 10:12 are good colums for clustering 
hclustering <- hclust(mdist)
myplclust(hclustering, lab.col = unclass(sub1$activity))
names(sub1[maxCon])
# So the mean body acceleration in the frequency domain in the Z direction is the main contributor to this clustering phenomenon we're seeing.

# K means
kClust <- kmeans(sub1[,-c(562,563)], centers = 6)
table(kClust$cluster, sub1$activity)

kClust <- kmeans(sub1[, -c(562, 563)], centers = 6, nstart=100)
table(kClust$cluster, sub1$activity)
# from the table you see that kClust$size==29 corrsponds to lying

dim(kClust$centers)
laying <- which(kClust$size==29)
plot(kClust$centers[laying, 1:12],pch=19,ylab="Laying Cluster") 
# We see the first 3 columns dominate this cluster center. (Well not really there are other columns past 12 that are larger than 1:3)
#Run names with the first 3 columns of sub1 as the argument to remind yourself of what these columns contain.
names(sub1[,1:3])
# So the 3 directions of mean body acceleration seem to have the biggest effect on laying.

walkdown <- which(kClust$size==49) 
plot(kClust$centers[walkdown, 1:12],pch=19,ylab="Walkdown Cluster")
# We see an interesting pattern here. From left to right, looking at the 12 acceleration measurements in groups of 3, the points decrease in
# value. The X direction dominates, followed by Y then Z. This might tell us something more about the walking down activity.
