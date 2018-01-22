#Hierarchical Clustering

#Importing the dataset
dataset = read.csv('Mall_Customers.csv')
X = dataset[4:5]

#using the dendrogram to find the optimal no of clusters
dendrogram = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
plot(dendrogram, 
     main = paste('dendrogram'),
     xlab = 'customers',
     ylab = 'Euclidean Distances')

#Fitting Hierarchical Clustering to the Mall Dataset
hc = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc, 5)

#Visualising the clusters
library(cluster)
clusplot(X, y_hc, lines = 0, shade = TRUE, color = TRUE, labels = 2, plotchar = FALSE,
         span = TRUE, main = paste('Clusters of Clients'), xlab = "Annual Income", ylab = "Spending Score")