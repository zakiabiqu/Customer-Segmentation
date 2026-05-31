library(ggplot2)

# Load customer data
customers <- read.csv(
  "CustomerSegment.txt",
  sep = "\t"
)

# Convert categorical variables into numeric matrix
customer_matrix <- data.matrix(
  customers[c("Gender", "Profession", "Residence.Type")]
)

customers <- data.frame(customers, customer_matrix)

# Master Data
customers$AnnualSpending <- customers$AnnualSpending / 1000000

profession_data <- unique(customers[c("Profession", "Profession.1")])
gender_data <- unique(customers[c("Gender", "Gender.1")])
residence_data <- unique(customers[c("Residence.Type", "Residence.Type.1")])

selected_features <- c(
  "Gender.1",
  "Age",
  "Profession.1",
  "Residence.Type.1",
  "AnnualSpending"
)

# K-Means Clustering
set.seed(1)

clustering_result <- kmeans(
  x = customers[selected_features],
  centers = 5,
  nstart = 25
)

# Merge cluster results into dataset
clustering_result$cluster

customers$cluster <- clustering_result$cluster

str(customers)

### Cluster Analysis ###

# Filter Cluster 1
which(customers$cluster == 1)

# Number of observations in Cluster 2
length(which(customers$cluster == 2))

# View data from Clusters 3–5
customers[which(customers$cluster == 3), ]
customers[which(customers$cluster == 4), ]
customers[which(customers$cluster == 5), ]

# View cluster centroids
clustering_result$centers

# Compare K-Means results using 2 and 5 clusters
set.seed(1)
kmeans(
  x = customers[selected_features],
  centers = 2,
  nstart = 25
)

set.seed(1)
kmeans(
  x = customers[selected_features],
  centers = 5,
  nstart = 25
)

# K-Means Components
set.seed(1)

clustering_result <- kmeans(
  x = customers[selected_features],
  centers = 5,
  nstart = 25
)

clustering_result$withinss
clustering_result$cluster
clustering_result$tot.withinss

# Elbow Method Plot
set.seed(1)

sse <- sapply(
  1:10,
  function(k) {
    kmeans(
      customers[selected_features],
      centers = k,
      nstart = 25
    )$tot.withinss
  }
)

max_clusters <- 10

elbow_data <- data.frame(
  cluster = c(1:max_clusters),
  sse = sse
)

ggplot(elbow_data, aes(x = cluster, y = sse)) +
  geom_line(color = "red") +
  geom_point() +
  ylab("Within Cluster Sum of Squares") +
  xlab("Number of Clusters") +
  geom_text(
    aes(label = format(round(sse, 2), nsmall = 2)),
    hjust = -0.2,
    vjust = -0.5
  ) +
  scale_x_discrete(limits = c(1:max_clusters))

## Cluster Segmentation

# Create cluster labels
customer_segments <- data.frame(
  cluster = c(1, 2, 3, 4, 5),
  Segment.Name = c(
    "Silver Youth Gals",
    "Diamond Senior Member",
    "Gold Young Professional",
    "Diamond Professional",
    "Silver Mid Professional"
  )
)

# Store all clustering assets
cluster_identity <- list(
  Profession = profession_data,
  Gender = gender_data,
  Residence = residence_data,
  Clustering = clustering_result,
  Customer.Segments = customer_segments,
  Selected.Features = selected_features
)

saveRDS(
  cluster_identity,
  "cluster.rds"
)

# New Customer Data
new_customer <- data.frame(
  Customer_ID = "CUST-100",
  Customer_Name = "Rudi Wilamar",
  Age = 20,
  Gender = "Female",
  Profession = "Student",
  Residence.Type = "Cluster",
  AnnualSpending = 3.5
)

new_customer

# Load clustering model
cluster_identity <- readRDS(
  file = "cluster.rds"
)

cluster_identity

# Convert categorical variables using saved mappings
new_customer <- merge(
  new_customer,
  cluster_identity$Profession
)

new_customer <- merge(
  new_customer,
  cluster_identity$Gender
)

new_customer <- merge(
  new_customer,
  cluster_identity$Residence
)

new_customer

# Determine which cluster the new customer belongs to
cluster_identity$Customer.Segments[
  which.min(
    sapply(
      1:5,
      function(x) {
        sum(
          (
            new_customer[
              cluster_identity$Selected.Features
            ] -
            cluster_identity$Clustering$centers[x, ]
          )^2
        )
      }
    )
  ),
]
