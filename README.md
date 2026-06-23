# 🛒 Zepto Product Analytics — SQL Data Analysis Project

> An end-to-end SQL project analyzing Zepto's product catalog data to uncover pricing strategies, inventory health, and category-level revenue insights.

---

## 📌 Project Overview

This project performs **exploratory data analysis (EDA)** and **business intelligence** on Zepto's quick-commerce product catalog using PostgreSQL. It covers data loading, cleaning, exploration, and answering 8 real-world business questions — making it ideal for showcasing SQL skills to potential employers.

**Dataset:** `zepto_v2.csv` — ~3,700 SKU-level product records scraped from Zepto's platform  
**Tool:** PostgreSQL  
**Skills Demonstrated:** DDL, DML, aggregations, CASE statements, data cleaning, window-less analytics

---

## 📂 Project Structure

```
zepto-sql-project/
│
├── zepto_v2.csv               # Raw dataset
├── zepto_sql_queries.sql      # All SQL queries (DDL + EDA + Cleaning + Business Insights)
└── README.md                  # Project documentation
```

---

## 🗃️ Dataset Schema

| Column | Type | Description |
|---|---|---|
| `sku_id` | SERIAL (PK) | Auto-incremented unique product ID |
| `category` | VARCHAR(120) | Product category (e.g., Fruits & Vegetables) |
| `name` | VARCHAR(150) | Product name |
| `mrp` | NUMERIC(8,2) | Maximum Retail Price (stored in paise, converted to ₹) |
| `discountPercent` | NUMERIC(5,2) | Discount percentage |
| `availableQuantity` | INTEGER | Units currently in stock |
| `discountedSellingPrice` | NUMERIC(8,2) | Final price after discount |
| `weightInGmns` | INTEGER | Product weight in grams |
| `outOfStock` | BOOLEAN | TRUE if product is unavailable |
| `quantity` | INTEGER | Pack size / quantity per unit |

---

## 🔍 Steps Performed

### 1. Table Creation (DDL)
Created the `zepto` table with appropriate data types, constraints (`NOT NULL`, `PRIMARY KEY`).

### 2. Data Exploration
- Counted total records
- Previewed sample rows
- Identified NULL values across all columns
- Explored distinct product categories
- Checked in-stock vs out-of-stock distribution

### 3. Data Cleaning
- Identified and deleted rows with `mrp = 0` (invalid pricing)
- Converted `mrp` and `discountedSellingPrice` from **paise to rupees** (÷ 100)

### 4. Business Insights (8 Queries)

| # | Question | Business Value |
|---|---|---|
| Q1 | Top 10 products by discount % | Identify best deals for customers |
| Q2 | High-MRP out-of-stock products | Flag revenue loss from stockouts |
| Q3 | Estimated revenue per category | Prioritize high-value categories |
| Q4 | Premium products with low discount | Identify confident pricing strategy |
| Q5 | Top 5 categories by avg discount | Optimize marketing promotions |
| Q6 | Price per gram (products >100g) | Surface best-value products |
| Q7 | Weight segmentation (Low/Medium/Bulk) | Support logistics & packaging decisions |
| Q8 | Total inventory weight per category | Aid supply chain planning |

---

## 💡 Key Findings

- **Prices were stored in paise** — a critical data cleaning step before any analysis
- Several **high-MRP products (₹300+) were out of stock**, indicating potential revenue loss
- **Fruits & Vegetables** category had the highest inventory count but varied pricing
- Products with **MRP > ₹500 and discount < 10%** tend to be premium staples with inelastic demand
- Categories with high average discounts (like Snacks/Beverages) suggest aggressive promotional strategy

---

## 🚀 How to Run

1. Install **PostgreSQL** (v13+ recommended)
2. Create a database: `CREATE DATABASE zepto_db;`
3. Import the CSV using pgAdmin or `COPY` command:
   ```sql
   COPY zepto FROM '/path/to/zepto_v2.csv' DELIMITER ',' CSV HEADER;
   ```
4. Run queries from `zepto_sql_queries.sql` in order (DDL → Cleaning → Insights)

---

## 🧠 Concepts Covered

- `CREATE TABLE` with constraints
- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, `HAVING`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `ROUND()`
- `CASE WHEN` for conditional logic / segmentation
- `UPDATE` for bulk data transformation
- `DELETE` for removing invalid records
- `DISTINCT` for deduplication
- Subgroup analysis using `BOOLEAN` filtering

---

## 📊 Tools & Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Database engine |
| pgAdmin / DBeaver | GUI for running queries |
| CSV (Excel/Sheets) | Initial data review |
| Git + GitHub | Version control |

---

## 🙋 About This Project

This project was built as part of a **data analyst portfolio** to demonstrate SQL proficiency on a real-world e-commerce dataset. The dataset simulates the kind of product catalog data analysts work with at quick-commerce companies like Zepto, Blinkit, and Swiggy Instamart.

---

## 📬 Connect

If you found this useful, feel free to ⭐ star the repo or connect on [LinkedIn](https://www.linkedin.com/in/sejal-bhole1).

---

*Data sourced from Zepto's public-facing product listings for educational purposes.*
