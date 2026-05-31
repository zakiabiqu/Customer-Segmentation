# Data Folder

This folder contains the dataset used for customer segmentation analysis.

## Data Source

The dataset was obtained from **Bootcamp DQLAB** as part of a learning project on customer segmentation using R. Due to copyright and data privacy considerations, **the raw data file is not included in this repository**.

## Data Structure

If you wish to replicate this analysis, your data should have the following structure (tab-separated values, `.txt` or `.csv`):

| Column Name          | Type        | Description                                                                 |
|----------------------|-------------|-----------------------------------------------------------------------------|
| `Customer_ID`        | Character   | Unique customer identifier (e.g., CUST-001)                                |
| `Nama Pelanggan`     | Character   | Customer name                                                              |
| `Jenis Kelamin`      | Categorical | Gender: `Pria` (Male) or `Wanita` (Female)                                 |
| `Umur`               | Integer     | Age in years                                                               |
| `Profesi`            | Categorical | Profession: `Wiraswasta`, `Professional`, `Pelajar`, `Ibu Rumah Tangga`, `Mahasiswa` |
| `Tipe Residen`       | Categorical | Residence type: `Cluster` or `Sector`                                      |
| `NilaiBelanjaSetahun`| Numeric     | Annual spending in Rupiah (raw value, before conversion to millions)       |

## Example Data Row (For Reference)

|Customer_ID | Nama Pelanggan | Jenis Kelamin | Umur | Profesi | Tipe Residen | NilaiBelanjaSetahun |
|------------|----------------|---------------|------|---------|--------------|---------------------|
| CUST-001 | Budi Anggara | Pria | 58 | Wiraswasta | Sector | 9497927 |
