# Customer Churn Analysis

## 1.Project Overview
This project analyzes customer churn behavior using customer data from a telecommunication company, using SQL for data preprocessing and Power BI for visualization and analysis.

The objective is to identify churn patterns and visualize churn rates across multiple dimensions, including demographics, geography, payment methods, contract types, and subscribed services.

By analyzing customer characteristics and churn reasons, the project delivers actionable insights into the key drivers of customer attrition supporting data-driven decision-making and effective churn reduction strategies.


## 2. Project Structure 

```text
customer-churn-analysis/
│
├── data/
│   ├── raw/
│   │   └── customer_data.csv
│   ├── processed/
│   │   └── clean_churn.csv        # cleaned dataset after SQL preprocessing
│
├── sql/
│   ├── 01_churn_analysis.sql      # exploratory analysis & aggregation queries
│   ├── 02_missing_value.sql       # missing value handling and data cleaning
│
├── powerbi/
│   └── churn_analysis.pbix        # Power BI dashboard file
│
└── README.md
```


## 3. Power BI Dashboard
The Power BI dashboard provides an interactive overview of customer churn, including:
- Key performance indicators (KPIs):
  - Total customers
  - Total churned customers
  - New joiners
  - Churn rate
  
- Demographic analysis:
  - Churn rate by gender
  - Churn behavior across age groups

- Account and contract insights:
  - Churn rate by payment method
  - Churn rate by contract type
  - Churn trends across customer tenure groups

- Geographic distribution:
  - Top regions by churn rate
 
- Churn drivers:
  - Churn reason distribution by category 

- Service usage analysis:
  - Impact of subscribed services and internet type on churn behavior



<div align="center">
  <img
    src="https://github.com/user-attachments/assets/da9c1189-08af-443a-b499-b75f5cb53e97"
    width="990"
    height="1160"
    alt="Streamlit App Screenshot"
  />
</div>


## 4. Key Insights
- Contract type is the most significant driver of customer churn
  - Customers on month-to-month contracts show higher churn rates than those on one-year or two-year contracts, reflecting lower switching costs and weaker customer commitment.
  - **Business implication** : churn can be reduced by offering discounts, loyalty incentives, or bundled benefits that encourage customers to transition to longer-term contracts.

- Competitive pressure plays a critical role in churn behavior
  - A large proportion of churned customers leave due to competitor-related factors, including more attractive pricing or superior service offerings.
  - **Business implication**: the company should implement a competitive pricing strategy while simultaneously enhancing service quality and overall customer experience, rather than relying solely on price-based competition.

- High data-usage customers show an unexpectedly higher churn risk
  - Customers subscribed to unlimited data and internet services are more likely to churn, despite their higher service consumption. This suggests that these customers may have higher expectations, and greater awareness of alternative offers.
  - **Business implication**: retention strategies for high-usage customers should focus on personalized plans, proactive engagement, and premium service enhancements, rather than generic retention incentives.

