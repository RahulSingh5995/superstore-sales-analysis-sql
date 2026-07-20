-- ==========================================================
-- 10_DATA_QUALITY.SQL
-- Project: Superstore Sales Analysis
-- ==========================================================

-- ==========================================================
-- Q1. Check for NULL values in important columns
-- ==========================================================

SELECT *
FROM superstore
WHERE order_id IS NULL
   OR order_date IS NULL
   OR customer_name IS NULL
   OR category IS NULL
   OR product_name IS NULL
   OR sales IS NULL
   OR profit IS NULL;


-- ==========================================================
-- Q2. Check for duplicate records
-- ==========================================================

SELECT
    order_id,
    product_name,
    order_date,
    COUNT(*) AS duplicate_count
FROM superstore
GROUP BY
    order_id,
    product_name,
    order_date
HAVING COUNT(*) > 1;


-- ==========================================================
-- Q3. Find duplicate records using ROW_NUMBER()
-- ==========================================================

WITH duplicate_rows AS
(
    SELECT
        *,
        ROW_NUMBER() OVER(
            PARTITION BY
                order_id,
                product_name,
                order_date
            ORDER BY order_id
        ) AS row_num
    FROM superstore
)

SELECT *
FROM duplicate_rows
WHERE row_num > 1;


-- ==========================================================
-- Q4. Find orders with negative profit
-- ==========================================================

SELECT
    order_id,
    customer_name,
    product_name,
    sales,
    profit
FROM superstore
WHERE profit < 0
ORDER BY profit;


-- ==========================================================
-- Q5. Find products with zero sales
-- ==========================================================

SELECT *
FROM superstore
WHERE sales = 0;


-- ==========================================================
-- Q6. Find products with zero profit
-- ==========================================================

SELECT *
FROM superstore
WHERE profit = 0;


-- ==========================================================
-- Q7. Find invalid discounts
-- (Discount should normally be between 0 and 1)
-- ==========================================================

SELECT *
FROM superstore
WHERE discount < 0
   OR discount > 1;


-- ==========================================================
-- Q8. Check for future order dates
-- ==========================================================

SELECT *
FROM superstore
WHERE order_date > CURDATE();


-- ==========================================================
-- Q9. Check for duplicate Order IDs
-- ==========================================================

SELECT
    order_id,
    COUNT(*) AS total_rows
FROM superstore
GROUP BY order_id
HAVING COUNT(*) > 1;


-- ==========================================================
-- Q10. Summary of Data Quality
-- ==========================================================

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT customer_name) AS unique_customers,
    COUNT(DISTINCT product_name) AS unique_products
FROM superstore;