# 📊 Loan Portfolio Analytics Dashboard (Power BI)

## 🚀 Project Overview
 
This project analyzes a large-scale loan dataset (2007–2016) to uncover key insights into borrower behavior, loan performance, and default risk. The goal is to transform raw financial data into actionable insights that support better lending decisions.

---

## 🎯 Problem Statement

Financial institutions face significant risk due to loan defaults.
This project aims to:

* Measure default rates
* Identify high-risk borrower segments
* Analyze loan trends over time
* Provide data-driven recommendations to reduce risk

---

## 📁 Dataset

* **Source:** Lending Club Dataset
* **Time Period:** 2007–2016
* **Size:** Large-scale transactional dataset

### Key Features:

* Loan Status (Fully Paid / Charged Off)
* Loan Amount
* Interest Rate
* Loan Term (36 / 60 months)
* Grade (A–G)
* Home Ownership
* Loan Purpose

---

## 🛠️ Tools & Technologies
* **Python** → Data Cleanig
* **PostgreSQL** → EDA
* **Power BI** → Dashboard & Visualization
* **Power Query** → Data Cleaning & Transformation
* **DAX** → KPI & Measure Calculation

---

## 🧹 Data Cleaning Steps

* Removed missing and duplicate records
* Standardized categorical values (Loan Status, Purpose)
* Converted data types (Date, Numeric fields)
* Handled inconsistencies and outliers

👉 Clean data ensured accurate analysis and reliable insights.

---

## 📊 Data Analysis

Key metrics were calculated using DAX:

* **Default Rate**
* **Total Loan Portfolio**
* **Average Loan Amount**
* **Average Interest Rate**

### Example:

Default Rate = Charged Off Loans / Total Loans

---

## 📈 Dashboard Features

* KPI Cards (Total Loan, Avg Loan, Default Rate)
* Loan Status Distribution (Default vs Fully Paid)
* Home Ownership Analysis
* Loan Term Comparison (36 vs 60 months)
* Year-wise Loan Trend
* Loan Purpose Breakdown
* Interactive Filters (Grade, Application Type)

---

## 🔍 Key Insights

* 📉 **Default Rate:** ~19.58% → Nearly 1 in 5 loans default
* 💰 Majority of loans used for **Debt Consolidation**
* 🏠 Borrowers are mostly **Mortgage holders and Renters**
* ⏳ **36-month loans dominate**, but long-term loans carry higher risk
* 📈 Loan growth peaked around **2014**, followed by decline

---

## ⚠️ Risk Analysis

* High exposure in debt-driven borrowers
* Significant default percentage indicates credit risk
* Longer tenure loans may increase probability of default

---

## 💡 Business Recommendations

* Implement stricter credit checks for high-risk segments
* Apply risk-based interest rates
* Limit long-term (60-month) loans
* Focus on borrower segmentation (Grade, Ownership)
* Monitor early warning signals for default

---

## 📌 Conclusion

The analysis reveals a growing loan portfolio with a notable default rate. By leveraging data-driven insights, financial institutions can better manage risk, improve lending strategies, and enhance overall portfolio performance.

---

## 🔥 Key Learning Outcomes

* End-to-end data analysis workflow (Cleaning → Analysis → Visualization)
* Practical use of DAX for KPI calculation
* Building interactive dashboards for business decision-making
* Translating data into actionable insights


---

