# SQL Exploratory Data Analysis (EDA) Project

![SQL](https://img.shields.io/badge/SQL-SQL%20Server-4479A1?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Azure Data Studio](https://img.shields.io/badge/Azure%20Data%20Studio-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)

A full end-to-end SQL Exploratory Data Analysis project on a real-world sales database — simulating exactly how a data analyst explores a new database in a professional environment.
<img width="1507" height="868" alt="image" src="https://github.com/user-attachments/assets/bfd53c1a-0ec5-49fe-a540-063a0061717e" />

---

## 📌 Project Overview

When a data analyst gets access to a new database at work, the first step is never to jump straight into analysis. You need to understand the data first — what tables exist, what columns are available, what time period it covers, and what the key numbers are.

This project follows a structured 6-step EDA framework to systematically explore a sales database containing customer, product and sales data.

---

## 🗄️ Database Structure

3 tables in the `gold` schema:

| Table | Description |
|---|---|
| `gold.dim_customers` | Customer details — name, country, gender, birthdate |
| `gold.dim_products` | Product details — category, subcategory, cost |
| `gold.fact_sales` | Sales transactions — orders, revenue, quantity, dates |

---

## 🔍 EDA Framework — 6 Steps

### Step 1 — Database Exploration
> *"What do I have to work with?"*

Used `INFORMATION_SCHEMA` to map all tables and columns before touching any data.

```sql
SELECT * FROM INFORMATION_SCHEMA.TABLES
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'
```

---

### Step 2 — Dimensions Exploration
> *"What are the categories and structure of the data?"*

Explored the who, what and where of the data.

**Key Findings:**
- 295 unique products across 3 categories: Bikes, Accessories, Clothing
- Customers from 6 countries
- United States leads with 7,482 customers — Australia is a strong 2nd with 3,591

| Country | Total Customers |
|---|---|
| United States | 7,482 |
| Australia | 3,591 |
| United Kingdom | 1,913 |
| France | 1,810 |
| Germany | 1,780 |
| Canada | 1,571 |

---

### Step 3 — Date Exploration
> *"What time period does the data cover?"*

```sql
SELECT MIN(order_date) AS first_order_date,
       MAX(order_date) AS last_order_date,
       DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_years
FROM gold.fact_sales
```

**Key Findings:**
- Sales data spans **4 years** (December 2010 → January 2014)
- Customer age range: **40 to 110 years old**

---

### Step 4 — Measures Exploration
> *"What are the big numbers?"*

Generated a consolidated business metrics report using `UNION ALL`:

| Metric | Value |
|---|---|
| Total Sales | $29,356,250 |
| Total Quantity Sold | 60,423 |
| Average Price | $486 |
| Total Orders | 27,659 |
| Total Products | 295 |
| Total Customers | 18,484 |

---

### Step 5 — Magnitude Analysis
> *"How does performance break down by category?"*

Used `GROUP BY` with `LEFT JOIN` across tables to break down revenue by category.

| Category | Total Revenue |
|---|---|
| Bikes | $28,316,272 |
| Accessories | $700,262 |
| Clothing | $339,716 |

**💡 Key Insight:** Bikes generate **96.5% of total revenue** — the business is heavily dependent on one category, which represents a significant strategic risk.

---

### Step 6 — Ranking Analysis
> *"Who and what are the top and bottom performers?"*

Used `ROW_NUMBER()` window functions with `PARTITION BY` to rank products within each category.

**Top 5 Products by Revenue:**

| Product | Revenue |
|---|---|
| Mountain-200 Black-46 | $1,373,454 |
| Mountain-200 Black-42 | $1,363,128 |
| Mountain-200 Silver-38 | $1,339,394 |
| Mountain-200 Silver-46 | $1,301,029 |
| Mountain-200 Black-38 | $1,294,854 |

**Top Product Per Category:**

| Category | Top Product | Revenue |
|---|---|---|
| Bikes | Mountain-200 Black-46 | $1,373,454 |
| Accessories | Sport-100 Helmet Red | $78,050 |
| Clothing | Women's Mountain Shorts L | $25,410 |

**Top Customers by Revenue:**

| Customer | Revenue |
|---|---|
| Kaitlyn Henderson | $13,294 |
| Nichole Nara | $13,294 |
| Margaret He | $13,268 |

---

## 💡 Business Insights & Recommendations

1. **Bikes dominate at 96.5% of revenue** — over-reliance on one category is a major business risk. Diversification into Accessories and Clothing should be a strategic priority.

2. **Mountain-200 is the star product** — all top 5 revenue-generating products are Mountain-200 variants. Marketing and inventory should prioritise this line.

3. **USA is the biggest market (40% of customers)** but Australia is a strong #2 — there is room to grow the Australian market with targeted campaigns.

4. **Customer age ranges from 40–110** — the older demographic skew suggests marketing should be tailored accordingly.

5. **295 products but only 3 categories** — there is significant opportunity to introduce new subcategories, especially in the underperforming Clothing segment.

---

## 🛠️ SQL Techniques Used

- `INFORMATION_SCHEMA` — database and column exploration
- `SELECT DISTINCT` — identifying unique values
- `MIN`, `MAX`, `DATEDIFF`, `GETDATE()` — date analysis
- `SUM`, `AVG`, `COUNT` — aggregate measures
- `UNION ALL` — consolidated metrics report
- `GROUP BY` + `ORDER BY` — magnitude analysis
- `LEFT JOIN` — combining customer, product and sales tables
- `ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)` — ranking within categories
- `TOP N` — filtering top and bottom performers
- `CTEs (WITH clause)` — organising complex ranking queries

---

## 📁 Repository Structure

```
📁 sql-eda-project
   📄 01_database_exploration.sql
   📄 02_dimensions_exploration.sql
   📄 03_date_exploration.sql
   📄 04_measures_exploration.sql
   📄 05_magnitude_analysis.sql
   📄 06_ranking_analysis.sql
   📄 README.md
```

---

## 🎯 Key Takeaway

This project demonstrates the structured approach a data analyst takes when exploring a new database — moving systematically from understanding the structure, to measuring the data, to uncovering actionable business insights.

---

*Dataset sourced from Baraa Khatib Salkini (Data With Baraa) — used for educational and portfolio purposes.*
