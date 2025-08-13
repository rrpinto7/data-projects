# 📈 Revenue Prediction via Multiple Linear Regression

This project simulates a business scenario where the goal is to **understand and optimize revenue** through pricing strategies, discount policies, and marketing investments.

---

## 🧠 Business Context

Companies often apply pricing or promotional tactics without fully understanding their effectiveness. This project addresses that by building a data-driven model that:

- Identifies **key revenue drivers**
- Detects **inefficiencies in promotional strategies**
- Supports **scenario simulation** for smarter commercial decisions

---

## 📁 Files Included

- `generate_dataset.ipynb` — Generates a synthetic dataset with 1 million product sales transactions
- `business_dataset.csv` — Simulated dataset containing pricing, marketing, and sales features
- `T_20250521_business_case_example.ipynb` — End-to-end notebook including data cleaning, EDA, model building, evaluation, and insights

---

## 🎯 Objective

To build a multiple regression model that predicts revenue based on:

- Pricing and discount levels  
- Marketing spend  
- Product category  
- Customer segment  
- Seasonality and units in stock  

The goal is not just prediction but also **explanation**, **interpretability**, and **actionable business recommendations**.

---

## 🔍 Key Insights

✅ **Top Revenue Drivers Identified**  
- Base price and marketing spend have strong positive influence on revenue  
- Product category and customer segment also play a major role  
- Units in stock had near-zero impact and were safely excluded

✅ **Promotional Inefficiencies Detected**  
- Segments with high discounts but minimal marketing spend underperformed vs model expectations  
- Particularly in *Distributor segment + Sensor products*, the combination of discount without promotion led to lost revenue  
- **Recommendation**: Avoid applying deep discounts without parallel marketing effort — discounts alone aren't enough

---

## 📊 Model Performance

| Metric           | Train Set | Test Set |
|------------------|-----------|----------|
| R² Score         | 0.94      | 0.94     |
| MAE              | ~$2,028   | ~$2,050  |
| RMSE             | ~$2,860   | ~$2,890  |

- Average revenue per transaction ≈ $28,000  
- **Relative error ≈ 10%**, acceptable for business forecasting use cases

---

## 💡 Business Applications

- Forecast revenue under different pricing and promotion strategies
- Define optimal discount thresholds by customer/product segment
- Prioritize marketing investment for maximum ROI
- Support commercial decisions with interpretable data insights

---

## 🧰 Tech Stack

- Python (Pandas, NumPy, Scikit-learn)
- Jupyter Notebooks
- Visualization: Matplotlib, Seaborn

---

## 📎 Next Steps

- Integrate the model into a dashboard (e.g., Power BI or Dash) for scenario testing  
- Extend to other machine learning models (e.g., tree-based regressors) for comparison  
- Consider regularization and feature selection pipelines

---
