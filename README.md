# Customer Retention & Churn Analysis (SQL → Power BI)

## Project Overview
This project analyses customer retention, churn, inactivity behaviour, and re-engagement risk using e-commerce transaction data.

Churn is defined as customers with no purchases for 180 days or more.  
Beyond identifying churn, the project translates insights into actionable business recommendations using interactive dashboards.

---

## Business Objectives
- Identify churned and active customers
- Measure retention and inactivity patterns
- Segment customers by inactivity duration
- Highlight customers at risk of churn
- Support data-driven re-engagement strategies

---

## Tools & Technologies
- SQL (SQLite) – data extraction, transformation, churn logic
- DB Browser for SQLite – query execution and validation
- Excel (CSV exports) – intermediate outputs
- Power BI – interactive dashboards & KPIs
- DAX – measures, calculated columns, business logic
- Microsoft Word – insights & recommendations

---

## Methodology

### 1. Data Exploration & Preparation (SQL)
- Explored transactional e-commerce data
- Cleaned customer and order records
- Aggregated transactions at customer level
- Calculated:
  - Total orders
  - Last purchase date per customer
  - Days since last purchase

---

### 2. Churn & Retention Logic (SQL)
- Classified customers based on activity:
  - **Active:** purchase within last 180 days
  - **Churned:** no purchase for 180+ days
- Exported a customer-level churn dataset for reporting

---

### 3. Inactivity Segmentation
Customers were grouped into inactivity buckets:
- 0–30 days
- 31–60 days
- 61–90 days
- 91–120 days
- 121–180 days
- 180+ days

This enables deeper behavioural and risk analysis beyond binary churn.

---

## Dashboard Development (Power BI)

### Page 1 — Executive Overview
**Purpose:** High-level KPIs for stakeholders

**KPIs:**
- Total Customers
- Active Customers
- Churned Customers
- Churn Rate (%)

**Visuals:**
- Customer Status Distribution (Active vs Churned)
- Customer Activity Over Time
- Churn by Inactivity Period
  

![Page 1 – Executive Overview Dashboard]([images/Page1_executive_overview.png](https://github.com/princess-innocent-analytics/customer-retention-churn-analysis/blob/main/Page1_executive_overview.png))

---

### Page 2 — Customer Retention Analysis
**Purpose:** Understand retention trends and inactivity behaviour

**KPIs:**
- Retention Rate (%)
- Average Days Since Last Purchase
- At-Risk Customers

**Visuals:**
- Active vs Churned Customers by Month (Trend Analysis)
- Customer Status by Inactivity Bucket (Segmented View)

**Insights:**
- Retention declines as inactivity increases
- Customers in higher inactivity buckets show higher churn risk

![Page 2 – Customer Retention Dashboard](images/Page2_customer_retention.png)

---

### Page 3 — Risk & Action Analysis
**Purpose:** Translate insights into business actions

**KPIs:**
- At-Risk Customers
- Maximum Inactivity (Days)
- Average Inactivity (Days)

**Visuals:**
- Customers at Risk by Inactivity Period
- Customers Requiring Re-engagement (Table)

![Page 3 – Risk & Action Dashboard](images/Page3_risk_action.png)

---

## Advanced Feature — Recommended Action Logic (Portfolio-Level)
A calculated column was created to convert analytics into action:

| Inactivity Level | Recommended Action |
|------------------|-------------------|
| 180+ days | Immediate outreach |
| 121–180 days | Reactivation campaign |
| 61–120 days | Reminder / offer |
| ≤ 60 days | Monitor |

This allows stakeholders to prioritise re-engagement efforts directly from the dashboard.

---

## Key Insights
- A large portion of customers fall into long inactivity buckets
- Retention is strongly linked to recency of purchase
- Customers inactive for 121+ days represent the highest churn exposure
- Segmenting inactivity enables targeted and cost-effective re-engagement

---

## Business Recommendations
- Launch immediate outreach campaigns for customers inactive 180+ days
- Use incentives and reminders for mid-risk segments (61–120 days)
- Monitor recently active customers to prevent churn
- Integrate retention insights into CRM and marketing workflows

---

## Project Outputs
- SQL scripts (Day 1–Day 3)
- Customer-level churn dataset (CSV)
- Interactive Power BI dashboard (3 pages)
- Business insights & recommendations (Word document)

---

## Author
**Princess (Adaku) Innocent**  
Data Analyst | Customer Retention & Churn Analytics  
Certified in Power BI, SQL & Data Visualisation
