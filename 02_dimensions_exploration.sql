SELECT * FROM gold.dim_customers
SELECT * FROM gold.dim_products
SELECT * FROM gold.fact_sales
/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

--Exploring all countries customers comes from
SELECT DISTINCT country FROM gold.dim_customers

--Exploring all Categories 'The Major Divisions' 
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1,2,3