## **Zepto Inventory Analysis using PostgreSQL** 

## **Project Overview** 

This project analyzes Zepto's product inventory dataset using PostgreSQL to uncover valuable business insights related to pricing, discounts, inventory management, and revenue opportunities. 

The objective was to perform end-to-end data analysis, including data exploration, data cleaning, and business-focused SQL analysis to support better inventory and pricing decisions. 

## **Business Problem** 

Quick-commerce platforms like Zepto manage thousands of products across multiple categories. Understanding inventory availability, pricing strategies, discount effectiveness, and revenue potential is critical for: 

- Inventory Optimization 

- Revenue Maximization 

- Pricing Strategy 

- Product Performance Analysis • Stock Availability Monitoring 

This project addresses several real-world business questions using SQL. 

## **Dataset Information** 

**Dataset:** Zepto Inventory Dataset 

**Source:** Kaggle 

The dataset contains product-level inventory information from Zepto's quick-commerce platform. 

## **Dataset Summary** 

|Metric|Value|
|---|---|
|Total Records|3,700+|
|Columns|9|
|Unique Product Names|1,681|
|Data Type|Inventory Dataset|



1 

## **Important Observation** 

Each row represents a unique **SKU (Stock Keeping Unit)** rather than a unique product. 

Therefore: 

- Multiple rows may contain the same product name. • Products can differ in: 

- Weight • Price 

- Discount 

- Packaging Size 

- Category 

This is common in e-commerce platforms where different variants are stored as separate SKUs. 

## **🛠️ Technologies Used** 

- PostgreSQL • SQL • Data Cleaning • Data Exploration • Business Analytics 

## **Database Schema** 

```
CREATETABLEzepto(
sku_idSERIALPRIMARYKEY,
categoryVARCHAR(120),
nameVARCHAR(150)NOTNULL,
mrpNUMERIC(8,2),
discountPercentNUMERIC(5,2),
availableQuantityINTEGER,
discountedSellingPriceNUMERIC(8,2),
weightInGmnsINTEGER,
outOfStockBOOLEAN,
quantityINTEGER
);
```

2 

## **Data Exploration** 

## **Performed Analysis** 

- Checked total records 

- Verified NULL values 

- Explored unique categories 

- Identified duplicate product names across SKUs 

- Analyzed stock availability 

- Investigated inventory structure 

## **Key Findings** 

- Product names can appear across multiple SKUs. 

- Inventory includes both in-stock and out-of-stock products. 

- Significant variation exists across categories and package sizes. 

## **Data Cleaning** 

## **1. Removed Invalid Records** 

Identified products where MRP was equal to 0. 

`DELETE FROM zepto WHERE mrp = 0;` re 

## **2. Currency Standardization** 

Discovered that MRP and Selling Price were stored in **Paise** rather than Rupees. 

Example: 

`2500 = ₹25` Be 

Converted values into Rupees. 

`UPDATE zepto SET mrp = mrp / 100.0, discountedSellingPrice = discountedSellingPrice / 100.0;` 

3 

## **Business Questions Solved** 

## **1️⃣ Top 10 Best Value Products** 

Identified products offering the highest discount percentages. 

## **Business Value:** 

- Helps customers discover highly discounted products. • Enables analysis of aggressive discounting strategies. 

## **2️⃣ High-MRP Products Currently Out of Stock** 

Identified premium products that are unavailable. 

## **Business Value:** 

- Highlights potential lost revenue opportunities. 

- Helps prioritize inventory replenishment. 

## **3️⃣ Estimated Revenue Potential by Category** 

Calculated: 

```
Estimated Revenue =
Discounted Selling Price × Available Quantity
```

## **Note:** 

Since the dataset contains inventory information rather than sales transactions, actual revenue cannot be calculated. 

Instead, this metric estimates the maximum revenue potential if all available inventory is sold. 

## **4️⃣ Premium Products with Low Discounts** 

Identified products where: 

- MRP > ₹500 

- Discount < 10% 

4 

## **Business Value:** 

• Indicates products that may already have strong demand. • Helps identify premium offerings requiring minimal promotional effort. 

## **5️⃣ Categories Offering the Highest Average Discounts** 

Calculated average discount percentages by category. 

## **Business Value:** 

- Helps marketing teams evaluate discounting strategies. • Supports profitability analysis. 

## **6️⃣ Price Per Gram Analysis** 

Formula: 

```
Price Per Gram =
Selling Price ÷ Weight
```

## **Why It Matters** 

Comparing product prices alone can be misleading because package sizes vary. 

Price-per-gram provides a standardized metric for comparing product value. 

## **Business Value:** 

- Identifies best-value products. 

- Supports smarter purchasing decisions. 

## **7️⃣ Product Weight Segmentation** 

Classified products into the following groups: 

|Category|Weight|
|---|---|
|Low|< 1000g|
|Medium|1000g - 4999g|



5 

|Category|Weight|
|---|---|
|Bulk|≥5000g|



## **Business Value:** 

- Supports inventory planning. 

- Enables product segmentation. 

## **8️⃣ Total Inventory Weight by Category** 

Calculated the total inventory weight available across categories. 

## **Business Value:** 

- Helps understand storage requirements. • Supports warehouse planning. 

## **Key Insights** 

- High-value products that are out of stock may lead to revenue loss. • Certain categories receive significantly higher discounts than others. 

- Price-per-gram analysis provides a more accurate measure of product value. 

- Revenue potential varies substantially across categories. • Duplicate product names often represent different SKU variants. 

## **Skills Demonstrated** 

- SQL Querying • Data Cleaning • Data Exploration • Aggregations • Conditional Logic ( `CASE WHEN` ) • Business Analytics • Revenue Analysis • Inventory Analysis • PostgreSQL Database Design 

## **Sample Analysis Outputs** 

- Top Discounted Products 

6 

- Out-of-Stock Product Analysis 

- Category Revenue Potential 

- Average Discount by Category 

- Product Value Analysis 

- Inventory Weight Distribution 

## € **Future Improvements** 

- Build an interactive Power BI dashboard 

- Add category-level KPI tracking 

- Create inventory forecasting metrics 

- Develop stock replenishment recommendations 

- Implement advanced SQL window functions 

## **Author** 

## **Sejal Bhole** 

Final-Year B.Tech Computer Engineering Student 

Interested in Data Analytics, Business Intelligence, SQL, and Data Visualization. 

- If you found this project useful, consider giving the repository a star. 

7 

