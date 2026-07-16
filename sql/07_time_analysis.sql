-- ==========================================================
-- TIME ANALYSIS
-- ==========================================================

-- ==========================================================
-- 1. Total Sales by Year
-- ==========================================================

SELECT
    YEAR(order_date) AS order_year,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY YEAR(order_date)
ORDER BY order_year;

-- ==========================================================
-- 2. Total Profit by Year
-- ==========================================================

SELECT
    YEAR(order_date) AS order_year,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY YEAR(order_date)
ORDER BY order_year;

-- ==========================================================
-- 3. Total Sales by Quarter
-- ==========================================================

SELECT
    QUARTER(order_date) AS order_quarter,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY QUARTER(order_date)
ORDER BY order_quarter;

-- ==========================================================
-- 4. Total Profit by Quarter
-- ==========================================================

SELECT
    QUARTER(order_date) AS order_quarter,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY QUARTER(order_date)
ORDER BY order_quarter;

-- ==========================================================
-- 5. Total Sales by Month
-- ==========================================================

SELECT
    MONTHNAME(order_date) AS month_name,
    MONTH(order_date) AS month_number,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY month_number;

-- ==========================================================
-- 6. Total Profit by Month
-- ==========================================================

SELECT
    MONTHNAME(order_date) AS month_name,
    MONTH(order_date) AS month_number,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY month_number;

-- ==========================================================
-- 7. Monthly Sales Trend
-- ==========================================================

SELECT
    YEAR(order_date) AS order_year,
    MONTHNAME(order_date) AS month_name,
    MONTH(order_date) AS month_number,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY
    YEAR(order_date),
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY
    order_year,
    month_number;

-- ==========================================================
-- 8. Monthly Profit Trend
-- ==========================================================

SELECT
    YEAR(order_date) AS order_year,
    MONTHNAME(order_date) AS month_name,
    MONTH(order_date) AS month_number,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY
    YEAR(order_date),
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY
    order_year,
    month_number;