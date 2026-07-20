-- ==========================================================
-- 09_WINDOW_FUNCTIONS.SQL
-- Project: Superstore Sales Analysis
-- ==========================================================

-- ==========================================================
-- Q1. Rank all customers based on total sales using ROW_NUMBER()
-- ==========================================================

SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales,
    ROW_NUMBER() OVER(
        ORDER BY SUM(sales) DESC
    ) AS sales_rank
FROM superstore
GROUP BY customer_name;


-- ==========================================================
-- Q2. Rank all customers based on total sales using RANK()
-- ==========================================================

SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales,
    RANK() OVER(
        ORDER BY SUM(sales) DESC
    ) AS sales_rank
FROM superstore
GROUP BY customer_name;


-- ==========================================================
-- Q3. Rank all customers based on total sales using DENSE_RANK()
-- ==========================================================

SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales,
    DENSE_RANK() OVER(
        ORDER BY SUM(sales) DESC
    ) AS sales_rank
FROM superstore
GROUP BY customer_name;


-- ==========================================================
-- Q4. Rank customers within each region based on total sales
-- ==========================================================

SELECT
    region,
    customer_name,
    ROUND(SUM(sales),2) AS total_sales,
    ROW_NUMBER() OVER(
        PARTITION BY region
        ORDER BY SUM(sales) DESC
    ) AS sales_rank
FROM superstore
GROUP BY
    region,
    customer_name;


-- ==========================================================
-- Q5. Find Top 3 customers in each region
-- ==========================================================

WITH customer_rank AS
(
    SELECT
        region,
        customer_name,
        ROUND(SUM(sales),2) AS total_sales,
        DENSE_RANK() OVER(
            PARTITION BY region
            ORDER BY SUM(sales) DESC
        ) AS sales_rank
    FROM superstore
    GROUP BY
        region,
        customer_name
)

SELECT *
FROM customer_rank
WHERE sales_rank <= 3
ORDER BY
    region,
    sales_rank;


-- ==========================================================
-- Q6. Display monthly sales with previous month's sales
-- ==========================================================

WITH monthly_sales AS
(
    SELECT
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        ROUND(SUM(sales),2) AS total_sales
    FROM superstore
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)

SELECT
    order_year,
    order_month,
    total_sales,
    LAG(total_sales) OVER(
        ORDER BY order_year, order_month
    ) AS previous_month_sales
FROM monthly_sales;


-- ==========================================================
-- Q7. Display monthly sales with next month's sales
-- ==========================================================

WITH monthly_sales AS
(
    SELECT
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        ROUND(SUM(sales),2) AS total_sales
    FROM superstore
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)

SELECT
    order_year,
    order_month,
    total_sales,
    LEAD(total_sales) OVER(
        ORDER BY order_year, order_month
    ) AS next_month_sales
FROM monthly_sales;


-- ==========================================================
-- Q8. Calculate Running Total of Monthly Sales
-- ==========================================================

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    ROUND(SUM(sales),2) AS total_sales,

    ROUND(
        SUM(SUM(sales)) OVER(
            ORDER BY
                YEAR(order_date),
                MONTH(order_date)
        ),
        2
    ) AS running_total_sales

FROM superstore

GROUP BY
    YEAR(order_date),
    MONTH(order_date)

ORDER BY
    order_year,
    order_month;


-- ==========================================================
-- Q9. Calculate Month-over-Month (MoM) Sales Growth
-- ==========================================================

WITH monthly_sales AS
(
    SELECT
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        ROUND(SUM(sales),2) AS total_sales
    FROM superstore
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
),
sales_with_previous AS
(
    SELECT
        order_year,
        order_month,
        total_sales,
        LAG(total_sales) OVER(
            ORDER BY order_year, order_month
        ) AS previous_month_sales
    FROM monthly_sales
)

SELECT
    order_year,
    order_month,
    total_sales,
    previous_month_sales,
    ROUND(
        ((total_sales - previous_month_sales) / previous_month_sales) * 100,
        2
    ) AS mom_growth_percentage
FROM sales_with_previous;


-- ==========================================================
-- Q10. Find Top 3 Products in each Category
-- ==========================================================

WITH product_sales AS
(
    SELECT
        category,
        product_name,
        ROUND(SUM(sales),2) AS total_sales,

        DENSE_RANK() OVER(
            PARTITION BY category
            ORDER BY SUM(sales) DESC
        ) AS sales_rank

    FROM superstore

    GROUP BY
        category,
        product_name
)

SELECT
    category,
    product_name,
    total_sales,
    sales_rank
FROM product_sales
WHERE sales_rank <= 3
ORDER BY
    category,
    sales_rank;