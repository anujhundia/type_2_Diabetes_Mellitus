# Load required libraries
library(proxy)

# Read the data from CSV file
data <- read.csv("merged_data.csv")  # Assuming there are no column headers

# Extract row names
row_names <- data[, 1]  # Assuming the first column contains row names
data <- data[, -1]      # Remove the first column from the data

# Calculate cosine distance matrix
cosine_dist_matrix <- dist(data, method = "cosine")

# Convert distance matrix to square matrix with row names
cosine_dist_matrix <- as.matrix(cosine_dist_matrix)
rownames(cosine_dist_matrix) <- row_names
colnames(cosine_dist_matrix) <- row_names

# Perform hierarchical clustering using cosine distance
hc <- hclust(as.dist(cosine_dist_matrix), method = "complete")

# Cut the dendrogram into 4 clusters
clusters <- cutree(hc, k = 4)

# Plot dendrogram with cluster assignments
plot(hc)
rect.hclust(hc, k = 4, border = 2:5)
