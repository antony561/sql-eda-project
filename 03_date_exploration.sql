
/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/


--Find the date of first and last order
--How many years of sales are available
SELECT MIN(order_date) AS first_order_date,
       MAX(order_date) AS last_order_date,
       DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_years
FROM gold.fact_sales

--Finding the youngest and oldest customers
SELECT MIN(birthdate) AS Oldest_birthdate,
       DATEDIFF(year, MIN(birthdate), GETDATE()) AS Oldest_age,
       DATEDIFF(year, MAX(birthdate), GETDATE()) AS Young_age,
       MAX(birthdate) AS youngest_birthdate
FROM gold.dim_customers