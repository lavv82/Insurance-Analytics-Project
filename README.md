# Insurance Policy Analytics Project

## 📌 Project Summary

This project delivers an end-to-end analysis of an insurance company's policy, customer, claims, and payment data using **SQL, Excel, Power BI, and Tableau**. It covers the full analytics workflow — from data storage and querying in MySQL, through KPI computation in SQL and Excel, to interactive dashboarding in Power BI and Tableau.

The analysis tracks 10+ core KPIs including policy status distribution, customer demographics, multi-policy ownership, claims performance, payment success rates, and revenue trends (YoY/QoQ/MoM). The goal was to convert raw policy data into actionable business insights around **renewals, payment failures, claim approvals, and customer targeting** — helping stakeholders identify where to focus retention and growth efforts.

## 🔑 Key Business Insights

- **Cross-sell opportunity:** 3,148 customers hold multiple policies, indicating a strong existing base for cross-selling and retention campaigns.
- **Policy mix:** Health insurance leads policy count (1,316), followed by Property (1,236), Life (1,234), and Auto (1,214) — a fairly balanced portfolio.
- **Customer segments:** The 56+ age group holds the highest number of policies, while 46–55 is another key segment to retain. The 18–25 segment is underrepresented, flagging it as a growth opportunity for future acquisition.
- **Payment health:** Payments are nearly split down the middle — 2,516 successful vs. 2,484 failed — pointing to a meaningful opportunity to investigate and reduce payment failures.
- **Claims:** 1,712 claims were approved, giving a clear baseline for tracking claims turnaround and customer experience.
- **Recommendation areas:** Focus on reducing failed payments, renewing lapsed policies, improving claim approval experience, and targeting younger customers for acquisition.

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **MySQL** | Data storage, table joins, and KPI queries (window functions, rollups, CTEs) |
| **Excel** | Data preparation, cleaning, and KPI-level analysis |
| **Power BI** | Interactive dashboard with DAX measures and KPI visualizations |
| **Tableau** | Additional dashboard and data visualization layer |

## 📊 KPIs Tracked

1. Policy Status-wise Policy Count (Active / Lapsed / Terminated)
2. Total Unique & Multi-Policy Customers
3. Age Bucket-wise Policy Count (18–25, 26–35, 36–45, 46–55, 56+)
4. Gender-wise Policy Count
5. Policy Type-wise Policy Count (Health, Property, Life, Auto)
6. Policies Expiring in Current Year
7. Premium Trend Analysis — YoY, QoQ, and MoM Growth
8. Claim Status-wise Policy Count
9. Payment Status-wise Policy Count (Successful vs. Failed)
10. Total Approved Claim Amount

## 📁 Repository Contents

| File | Description |
|------|-------------|
| `SQL_Insurance_Analytics_Project.sql` | SQL queries for all 10 KPIs — includes rollups, window functions (LAG), and CTEs for trend analysis |
| `Project_insurence_Policy_Final.xlsx` | Excel workbook with data preparation and KPI-level analysis |
| `Final_PBI_project.pbix` | Power BI dashboard with interactive KPI visualizations and DAX measures |
| `Project_Insurance_Policy_TABLEAU.twbx` | Tableau workbook with dashboard visualizations |
| `INSURANCE_POLICY_DATA_ANALYSIS_PPT.pptx` | Presentation summarizing the analysis, findings, and business recommendations |

## 🎯 Skills Demonstrated

- SQL: Joins, `GROUP BY ... WITH ROLLUP`, window functions (`LAG`), CTEs, conditional logic (`CASE`, `IFNULL`)
- Excel: Data cleaning and KPI computation
- Power BI: DAX measures, interactive dashboard design
- Tableau: Dashboard design and data visualization
- Business analysis: Translating raw metrics into actionable recommendations

---
*This project was built as part of my Data Analyst portfolio, demonstrating an end-to-end analytics workflow across SQL, Excel, Power BI, and Tableau.*
