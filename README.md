# ecommerce-customer-behavior-retention-dashboard
# E-commerce Customer Behavior, Reorder, Retention, and Basket Analytics Dashboard

## Project Overview
This project is an end-to-end e-commerce analytics portfolio project built using SQL, Excel, and Power BI. The objective was to analyze customer ordering behavior, repeat purchase trends, basket patterns, product performance, and retention behavior through a structured business analytics workflow.

The final output is a multi-page interactive Power BI dashboard supported by SQL analysis and Excel-based exploration.

---

## Business Problem
E-commerce businesses need to understand how customers behave after their first few purchases, which products are reordered most often, how user ordering patterns evolve over time, and where product demand is concentrated across departments and aisles.

This project addresses those questions by analyzing:
- customer ordering behavior
- reorder frequency
- product demand patterns
- basket characteristics
- retention by order sequence
- basic churn-oriented user segmentation

---

## Objectives
The main objectives of this project were to:

- clean and prepare raw e-commerce datasets for analysis
- perform structured SQL-based exploratory and business analysis
- identify top-performing products, departments, and aisles
- analyze reorder behavior and basket patterns
- study customer ordering frequency and ordering gaps
- build retention analysis using order-sequence cohorts
- create a basic churn-oriented behavioral view
- present all findings in an interactive Power BI dashboard

---

## Dataset Description
The project uses multiple e-commerce-related datasets including order-level, item-level, and product-level tables.

### Core datasets used
- `final_orders.csv`
- `final_order_items.csv`
- `final_products.csv`

### Additional supporting datasets explored
- `user_behaviour.csv`
- `user_behaviour_order.csv`

### Main table structure
**Orders table**
- user_id
- order_id
- order_number
- order_dow
- order_hour_of_day
- days_since_prior_order
- order_time_segment

**Order items table**
- order_id
- product_id
- add_to_cart_order
- reordered

**Products table**
- product_id
- product_name
- aisle
- aisle_id
- departments
- department_id

---

## Tools & Technologies
- **SQL** for core analytical querying
- **Excel** for initial exploration and tabular analysis
- **Power BI** for interactive dashboard design and reporting

---

## Project Workflow
1. Dataset collection and review  
2. Data cleaning and structure validation  
3. SQL-based exploratory analysis  
4. Excel-based analysis and checking  
5. Product and reorder analysis  
6. Customer behavior analysis  
7. Cohort / retention analysis using order sequence  
8. Basic churn-oriented behavioral interpretation  
9. Multi-page Power BI dashboard creation  

---

## SQL Analysis Highlights
SQL was used to perform structured business analysis across the core tables.

### Key analyses performed
- total orders and total users
- total items purchased
- reorder rate analysis
- average basket size
- average orders per user
- orders by hour of day
- orders by day of week
- top ordered products
- reordered products
- department-wise and aisle-wise order patterns
- products added first to cart
- user order frequency
- retention by order number
- basic churn-oriented user grouping

---

## Excel Analysis Highlights
Excel was used to support early-stage exploration and validation of patterns before dashboard creation.

### Excel work included
- reviewing table structure
- checking ordering patterns
- summarizing user behavior
- validating item and order relationships
- observing tabular trends before dashboarding

---

## Power BI Dashboard Pages

### 1. Executive Summary
This page provides a high-level snapshot of the project through KPI cards and ordering trend visuals.

**Includes:**
- Total Orders
- Total Items Purchased
- Total Users
- Reordered Items
- Reorder Rate %
- Avg Basket Size
- Orders by Hour of Day
- Orders by Day of Week
- Top Ordered Products
- Department, aisle, and reorder status slicers

---

### 2. Product & Reorder Analysis
This page focuses on product demand and repeat-purchase behavior.

**Includes:**
- Unique Products Ordered
- Reordered Items
- Reorder Rate %
- Top ordered products
- Reordered product patterns
- Orders by department
- Orders by aisle
- Products added first to cart
- Department / aisle filtering

---

### 3. Customer Behavior Analysis
This page explores user ordering habits and ordering intervals.

**Includes:**
- Total Users
- Avg Days Between Orders
- Avg Orders Per User
- Avg Basket Size
- Orders by time segment
- Orders by order number
- Avg days between orders by order number
- Basic user activity view
- Order day, time segment, and reorder slicers

---

### 4. Cohort / Retention Analysis
Since the dataset does not support calendar-based cohort construction with full transaction dates, retention was analyzed using **order sequence**.

**Includes:**
- Cohort Users
- Retained Users
- Retention %
- Retention by order number
- Retained users by order number
- Retention table

This helps show how many users continue from the 1st order to later order stages.

---

### 5. Churn Analysis
This page presents a **basic behavioral churn-oriented view** rather than predictive churn modeling.

**Includes:**
- total users
- loyal users
- user behavior proxies
- supporting churn-oriented interpretations from ordering behavior

---

## Key Insights
Some of the major findings from the project include:

- repeat buying behavior is strong, with reordered items forming a major share of total item-level activity
- order activity is concentrated during specific hours of the day, indicating clear behavioral peaks
- product demand is not evenly distributed; a smaller set of products drives a large share of interactions
- some departments and aisles show much stronger order concentration than others
- retention remains strong across early order stages and gradually declines in later purchase cycles
- customer behavior can be meaningfully analyzed even without revenue-based metrics when order and item level data are well-structured

---

## Limitations
This project is intentionally presented with honest scope boundaries.

### Important limitations
- the dataset does **not** support true clickstream funnel analysis
- the dataset does **not** support real revenue-based LTV analysis
- the dataset does **not** support real A/B testing analysis
- churn interpretation is **basic and behavioral**, not advanced predictive modeling
- retention is based on **order sequence**, not calendar-month cohorting

---

## Future Scope
This project can be extended further by adding:
- clickstream or session-level event data for true funnel analysis
- revenue / price data for LTV analysis
- experiment group data for A/B testing
- richer behavioral attributes for advanced churn modeling
- deployment into a more automated refresh-based BI pipeline

---

## How to View the Project

### Recommended viewing order
1. Read the project overview and objectives
2. Review SQL query files
3. Check dashboard screenshots
4. Open the Power BI `.pbix` dashboard file

### Files to explore
- SQL query scripts
- Power BI dashboard file
- dashboard screenshots
- cleaned datasets (if included)
- README documentation

---


