size = read.table("C:/Users/jason/πŸ≈¡ »≠∏È/coding1/multivariate_data_analysis/Assignment 5/track.dat",header=T)
size

# (a) Cluster the countries using the single linkage, complete linkage, and group average hierarchical procedures.
# Construct dendrograms and compare the results.

# Scatterplot matrix 
pairs(size[,-1])
par(mfrow=c(3,1))

# Single Linkage
plot(hclust(dist(size[,-1]),method="single"),labels=size[,1],xlab=NA,ylab="Distance",main="Single linkage dendrogram")

# Complete Linkage
plot(hclust(dist(size[,-1]),method="complete"),labels=size[,1],xlab=NA,ylab="Distance",main="Complete linkage dendrogram")

# Group Average
plot(hclust(dist(size[,-1]),method="average"),labels=size[,1],xlab=NA,ylab="Distance",main="Group Average dendrogram")


# (b) Cluster the countires into K=2 and 3 using K-means clustering techniques.
size
size[-1]


size.kmeans = kmeans(size[-1],2)
size.kmeans

size.kmeans = kmeans(size[-1], 3)
size.kmeans

