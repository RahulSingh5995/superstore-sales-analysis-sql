-- ==========================================================
-- Project: Superstore Sales Analysis
-- File: 02_kpi_analysis.sql
-- Description:
-- This file calculates the overall business KPIs.
-- ==========================================================

USE salesdb;

-- ==========================================================
-- Overall Business KPIs
-- ==========================================================

SELECT
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_products_sold
FROM superstore;




-- ==========================================================
-- Average Order Value
-- ==========================================================

SELECT
    ROUND(SUM(sales) / COUNT(DISTINCT order_id),2) AS average_order_value
FROM superstore;


-- ==========================================================
-- Overall Profit Margin
-- ==========================================================

SELECT
    ROUND((SUM(profit) / SUM(sales)) * 100,2) AS profit_margin
FROM superstore;


-- ==========================================================
-- Average Products Sold Per Order
-- ==========================================================

SELECT
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM superstore;














