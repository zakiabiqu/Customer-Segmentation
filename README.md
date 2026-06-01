# Customer Segmentation Using K-Means Clustering  


**Author:** Zaki Abiyu Aqilah   
**Tools:** R (ggplot2, kmeans, factoextra)  
**Goal:** Segment customers into distinct groups based on demographic and spending behavior to enable targeted marketing strategies

---

## Project Overview

This project applies **unsupervised machine learning (K-Means clustering)** to segment customers into five distinct groups using their demographic profile (gender, age, profession, residence type) and annual spending. The model helps businesses tailor marketing campaigns, optimize product offerings, and improve customer retention.



**Key Results:**
- **Between-SS / Total-SS: 92.4%** (excellent cluster separation)
- **5 distinct customer segments** identified
- **Highest spending segment:** Cluster 5 (Silver Mid Professional) — ~8.8 million Rupiah/year

---

## Dataset

The dataset contains **50 customer records** with the following variables:

| Variable               | Type        | Description                                                                 |
|------------------------|-------------|-----------------------------------------------------------------------------|
| `Customer_ID`          | Character   | Unique customer identifier                                                  |
| `Nama Pelanggan`       | Character   | Customer name                                                               |
| `Jenis Kelamin`        | Categorical | Gender (Pria/Wanita) → numeric mapping (1 = Pria, 2 = Wanita)               |
| `Umur`                 | Numeric     | Age in years                                                                |
| `Profesi`              | Categorical | Profession (mapped to integers 1‑5)                                         |
| `Tipe Residen`         | Categorical | Residence type (Cluster/Sector) → numeric (1 = Cluster, 2 = Sector)         |
| `NilaiBelanjaSetahun`  | Numeric     | Annual spending (in Rupiah, converted to millions)                          |

> The original Text file is not included in this repository. See [`data/README.md`](data/README.md) for data structure details.

---

## Clustering Result

### Optimal Number of Clusters (Elbow Method)

The Elbow Method was applied to determine the optimal `k` for K-Means clustering. The total within-cluster sum of squares (WSS) was calculated for `k = 1` to `10`. The elbow is clearly observed at **k = 5**, where the reduction in WSS starts to diminish.

| k (clusters) | Total Within-Cluster SS | Interpretation                         |
|--------------|-------------------------|----------------------------------------|
| 1            | 2,551.74                | -                                      |
| 2            | 1,329.98                | Sharp drop                             |
| 3            | 995.83                  | Continued drop                         |
| 4            | 810.71                  | Continued drop                         |
| **5**        | **682.89**              | **Elbow point** → optimal k            |
| 6            | 608.81                  | Marginal improvement                   |
| 7            | 539.85                  | Marginal improvement                   |
| 8            | 469.26                  | Marginal improvement                   |
| 9            | 435.77                  | Marginal improvement                   |
| 10           | 393.60                  | Marginal improvement                   |

> **Between_SS / Total_SS = 92.4%** – This indicates that the 5-cluster solution explains 92.4% of the total variance, a very strong separation.

### Final Clusters (k=5)

| Cluster | Size | Gender<sup>1</sup> | Avg Age | Profession<sup>2</sup> | Residence<sup>3</sup> | Avg Spending (Mio Rupiah) | Segment Name                  |
|---------|------|--------------------|---------|------------------------|-----------------------|---------------------------|-------------------------------|
| 1       | 12   | 1.75 (Mixed)       | 31.58   | 3.92 (Professional mix)| 1.25 (Mostly Cluster) | 7.33                      | Silver Youth Gals             |
| 2       | 10   | 1.70 (Mixed)       | 52.50   | 3.80 (Professional mix)| 1.30 (Mostly Cluster) | 6.02                      | Diamond Senior Member         |
| 3       | 5    | 1.40 (Mostly Male) | 61.80   | 4.20 (Entrepreneurial) | 1.40 (Mixed)          | 8.70                      | Gold Young Professional       |
| 4       | 14   | 2.00 (All Female)  | 20.07   | 3.57 (Student mix)     | 1.36 (Mixed)          | 5.90                      | Diamond Professional          |
| 5       | 9    | 2.00 (All Female)  | 42.33   | 4.00 (Professional mix)| 1.56 (Mixed)          | 8.80                      | Silver Mid Professional       |

<sup>1</sup> **Gender mapping:** 1 = Pria (Male), 2 = Wanita (Female)  
<sup>2</sup> **Profession mapping:** 1 = Ibu Rumah Tangga, 2 = Mahasiswa, 3 = Pelajar, 4 = Professional, 5 = Wiraswasta  
<sup>3</sup> **Residence mapping:** 1 = Cluster, 2 = Sector

### Segment Profiles & Business Insights

#### Cluster 1 – Silver Youth Gals  
- **Profile:** Young adults (avg 32 years), mixed gender, professionals/entrepreneurs, moderate spending (~7.3M).  
- **Recommendation:** Target with digital campaigns, lifestyle products, and social media engagement.

#### Cluster 2 – Diamond Senior Member  
- **Profile:** Seniors (avg 53 years), mixed gender, stable spending (~6.0M).  
- **Recommendation:** Offer loyalty programs, healthcare products, and retirement planning services.

#### Cluster 3 – Gold Young Professional  
- **Profile:** Mostly male seniors (avg 62 years), entrepreneurs, high spending (~8.7M).  
- **Recommendation:** Premium/exclusive products, personalized services, partnership opportunities.

#### Cluster 4 – Diamond Professional  
- **Profile:** Young females (avg 20 years), students/early professionals, moderate spending (~5.9M).  
- **Recommendation:** Build long-term loyalty via educational content, discounts, and community events.

#### Cluster 5 – Silver Mid Professional  
- **Profile:** Middle-aged females (avg 42 years), professionals/entrepreneurs, **highest spending** (~8.8M).  
- **Recommendation:** Prioritize VIP treatment, exclusive offers, and upselling campaigns.

**Download detailed outputs:**  [Cluster centers (CSV)](output/cluster_centers.csv)  | [Segment summary (CSV)](output/segment_summary.csv)  | [Segment summary (TXT)](output/segment_summary.txt)


---


## Predictions New Customers

The trained K-Means model can predict the segment for new customers using distance to cluster centers. Below are sample predictions:

| Application | Gender | Age | Profession | Residence | Spending (Million Rupiah) | Predicted Segment |
|-------------|--------|-----|------------|-----------|---------------------------|:-----------------:|
| App 1 | Female | 20 | Pelajar | Cluster | 3.5 | **Diamond Professional** |
| App 2 | Male | 45 | Wiraswasta | Sector | 9.0 | **Gold Young Professional** |
| App 3 | Female | 35 | Professional | Cluster | 7.0 | **Silver Youth Gals** |

---

## How to Run the Code

1. Clone this repository  
2. Place your data file (CustomerSegmen.txt) in the [`data/`](data/) folder
3. Run [`script/model.R`](script/model.R) in RStudio or R console

---

## Connect with Me

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/zakiabiyu)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/zakiabiqu)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:zakiabiqu@gmail.com)
