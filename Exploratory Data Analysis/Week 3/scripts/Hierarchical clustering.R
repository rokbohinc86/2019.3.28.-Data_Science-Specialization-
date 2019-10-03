distxy <- dist(dataFrame)
hc <- hclust(distxy) # forms a dendrogram
plot(hc)
plot(as.dendrogram(hc))
abline(h=1.5,col="blue")

heatmap(dataMatrix, col = cm.colors(25)) # forms heatmap