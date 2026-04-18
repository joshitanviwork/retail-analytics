# 🛍️ Retail Analytics - End-to-End Data Project

## Overview
An end-to-end retail analytics pipeline built on the Olist Brazilian E-Commerce dataset. This project demonstrates the full modern data stack — from raw data ingestion to cloud warehousing, data modeling, analysis, machine learning, and business intelligence.

## Tech Stack
| Layer | Tool |
|---|---|
| Cloud Warehouse | Google BigQuery |
| Data Modeling | dbt |
| Analysis & EDA | Python, Pandas, Jupyter |
| Machine Learning | scikit-learn (K-Means) |
| Dashboard | Power BI |
| Version Control | Git, GitHub |

## Dataset
Olist Brazilian E-Commerce public dataset — 100,000+ orders across 9 tables including orders, customers, products, payments, reviews, and sellers.

## Project Structure
retail-analytics/
├── archive/          # Raw CSV files
├── dbt/              # dbt models
│   └── models/
│       ├── staging/  # Cleaned raw tables
│       └── marts/    # Business-ready models
├── 01_EDA.ipynb              # Exploratory Data Analysis
├── 02_RFM_analysis.ipynb     # RFM Customer Segmentation
├── 03_cohort_analysis.ipynb  # Cohort Analysis
├── 04_AB_test.ipynb          # A/B Test - Delivery vs Reviews
├── 05_clustering.ipynb       # K-Means Customer Clustering
└── upload_to_bigquery.py     # Data ingestion script

## Key Findings
- **97% delivery rate** across 100,000+ orders
- **Top category**: Bed & Bath (11,115 orders)
- **Revenue grew 10x** from late 2016 to mid-2018
- **Average delivery time**: 12 days
- **Fast delivery drives satisfaction**: Customers receiving orders in under 10 days rate 4.38/5 vs 3.28/5 for slow delivery (p < 0.0001)
- **56,960 customers at risk** of churning based on RFM segmentation
- **Low repeat purchase rate** confirmed by cohort analysis — retention is a key business challenge

## How to Run
1. Clone the repo
2. Add your bigquery_key.json to the root folder
3. Run upload_to_bigquery.py to load data
4. Open notebooks in order (01 to 05)