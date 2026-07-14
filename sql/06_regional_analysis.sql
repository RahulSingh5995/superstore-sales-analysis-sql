-- ==========================================================
-- Total Sales by Region
-- ==========================================================

SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- ==========================================================
-- Total Profit by Region
-- ==========================================================

SELECT
    region,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

-- ==========================================================
-- Profit Margin by Region
-- ==========================================================

SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100,2) AS profit_margin
FROM superstore
GROUP BY region
ORDER BY profit_margin DESC;

-- ==========================================================
-- Loss Making States
-- ==========================================================

SELECT
    state,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY state
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;