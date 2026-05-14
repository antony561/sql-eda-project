/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

-- Find the Total Sales
SELECT SUM(Sales_amount) AS total_sales FROM gold.fact_sales

-- Find how many items are sold
SELECT SUM(Quantity) AS total_items_sold FROM gold.fact_sales

-- Find the average selling price
SELECT AVG(price) AS avg_price FROM gold.fact_sales

-- Find the Total number of Orders
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales
--its because sometimes, customer order 3 products at same time, so i used DISTINCT

-- Find the total number of products
SELECT COUNT(product_name) AS total_products FROM gold.dim_products
SELECT COUNT(DISTINCT product_name) AS total_products FROM gold.dim_products

-- Find the total number of customers
SELECT COUNT(customer_key) AS total_customers FROM gold.dim_customers

-- Find the total number of customers that has placed an order
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.fact_sales

--Generating a report that shows all key metrics for business
SELECT 'Total Sales' AS measure_name, SUM(Sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) AS avg_price FROM gold.fact_sales
UNION ALL
SELECT 'Total Number of orders',COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales
UNION ALL
SELECT 'Total Number of Products',COUNT(DISTINCT product_name) AS total_products FROM gold.dim_products
UNION ALL
SELECT 'Total Number of customers',COUNT(customer_key) AS total_customers FROM gold.dim_customers