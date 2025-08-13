# 🛍 Retail Customer Segmentation via K-Means Clustering

This project applies **unsupervised learning** to segment customers of an online retail store based on their purchasing behavior.  
The dataset is sourced from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/352/online%2Bretail) and contains **UK-based online transactions** between **01/12/2010 and 09/12/2011**.

---

## 🧠 Business Context

The company sells **unique all-occasion gifts** to both individual customers and wholesalers.  
With thousands of customers and varying purchase patterns, the business seeks to:

- **Identify meaningful customer segments**
- **Understand each segment’s purchasing profile**
- **Adapt marketing and retention strategies** accordingly

---

## 📊 Dataset Overview

- **Period:** Dec 2010 – Dec 2011  
- **Scope:** All transactions from a UK-based online retailer  
- **Notable:** Many customers are wholesalers with bulk purchase behavior

### Features Engineered for Segmentation:
- **Recency** (days since last purchase)  
- **Frequency** (number of purchases)  
- **Monetary value** (total spend)  
- **Product diversity** (unique SKUs purchased)  
- **Average basket value**

---

## 🎯 Objective

- Apply **K-Means clustering** to group customers with similar purchasing behaviors  
- Profile each segment using **mean feature values**  
- Link insights to **business recommendations**

---

## 🔍 Key Insights

✅ **Six customer segments identified** with distinct behaviors, including:
- Low-spend occasional buyers  
- Inactive low-value customers  
- Loyal mid-value customers  
- Rare but high-spend bulk buyers  
- Ultra-high spenders with frequent purchases  
- Infrequent massive-order clients (likely B2B)3

### 🗂 Customer Segments Identified

| Segment Label | Share of Customers | Key Characteristics |
|---------------|--------------------|---------------------|
| **Low-Spend Occasional** | 64.34% | Moderate recency (~46d), low frequency (3.27), small baskets (215) |
| **'Inactive' Low-Value** | 24.54% | Very high recency (~247d), very low spend (€522), smallest baskets (169) |
| **High-Freq Mid-Value** | 10.74% | Low recency (~17d), high frequency (13.95), small baskets (283) |
| **High-Freq High-Value** | 0.28% | Low recency (~6d), extreme frequency (82), large baskets (681) |
| **Infrequent Large-Order** | 0.05% | High recency (~163d), massive spend (€122k), very large baskets (57k) |
| **Rare Bulk Buyers** | 0.05% | Very low recency (~4d), extreme frequency (53), very high spend (227k), large baskets ( 1,295  units) |


✅ **Actionable recommendations** created for each cluster:
- **Targeted marketing campaigns** tailored to segment behavior
- **Win-back strategies** for inactive or low-engagement customers
- **VIP programs** for high-value and frequent buyers
- **Inventory planning** aligned with bulk and seasonal purchase patterns
- **Cross-selling & upselling** based on basket size and product diversity

---

## 📂 Files Included

- `clustering_business_case.ipynb` — Full pipeline: data cleaning, feature engineering, clustering, PCA visualization and recommendations  
- `cluster_profiles.csv` — Summary of segment means for reference  
- `charts/` — PCA scatterplots and segment visualizations

---

## 🧰 Tech Stack

- Python (Pandas, NumPy, Scikit-learn)
- Visualization: Matplotlib, Seaborn
- Dimensionality Reduction: PCA
- Algorithm: K-Means clustering

---

## 📎 Next Steps

- Test **other clustering algorithms** (e.g., DBSCAN, Hierarchical Clustering)  
- Add **RFM segmentation** for marketing-specific use cases  
- Integrate results into **Power BI** for dynamic exploration
