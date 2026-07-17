-- ==========================================================
-- BUSINESS INSIGHTS
-- ==========================================================

-- ==========================================================
-- Business Question 1:
-- Which product category generates the highest sales?
-- ==========================================================

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- Business Insight:
-- The Technology category generates the highest sales,
-- indicating strong customer demand.

-- Business Recommendation:
-- Before increasing investment in this category, analyze
-- profit, profit margin, discount levels and return rates.
-- If these metrics remain healthy, increase inventory,
-- marketing campaigns and product availability.


-- ==========================================================
-- Business Question 2:
-- Which product category generates the highest profit?
-- ==========================================================

SELECT
    category,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

-- Business Insight:
-- The Technology category contributes the highest profit,
-- making it the strongest contributor to overall profitability.

-- Business Recommendation:
-- Validate that healthy profits are supported by sustainable
-- sales, discounts and profit margins. If confirmed,
-- prioritize this category for inventory expansion and
-- marketing investment.


-- ==========================================================
-- Business Question 3:
-- Which customer segment generates the highest profit?
-- ==========================================================

SELECT
    segment,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_profit DESC;

-- Business Insight:
-- The Consumer segment contributes the highest profit,
-- making it the most valuable customer segment.

-- Business Recommendation:
-- Focus on customer retention, loyalty programs and targeted
-- marketing for the Consumer segment while identifying
-- opportunities to improve the profitability of Corporate
-- and Home Office segments.


-- ==========================================================
-- Business Question 4:
-- Which region generates the highest sales and profit?
-- ==========================================================

SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

-- Business Insight:
-- The West region generates the highest sales and profit,
-- making it the strongest-performing region.

-- Business Recommendation:
-- Before increasing investment, validate profit margin,
-- discount levels, order volume, customer growth and
-- operational costs. If these metrics remain healthy,
-- prioritize inventory expansion and marketing campaigns.


-- ==========================================================
-- Business Question 5:
-- Which states are making losses?
-- ==========================================================

SELECT
    state,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY state
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

-- Business Insight:
-- States such as Texas, Ohio and Pennsylvania are generating
-- overall losses and require immediate attention.

-- Business Recommendation:
-- Investigate discount levels, shipping costs, product mix,
-- return rates and customer demand. Optimize pricing,
-- logistics and promotional strategies to improve profitability.


-- ==========================================================
-- Business Question 6:
-- Which states generate high sales but low profit?
-- ==========================================================

SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin
FROM superstore
GROUP BY state
ORDER BY total_sales DESC, total_profit ASC;

-- Business Insight:
-- Some states generate strong sales but comparatively low
-- profits, indicating possible pricing or operational issues.

-- Business Recommendation:
-- Analyze discount levels, shipping costs, operational
-- expenses, product mix and return rates. Optimize pricing
-- strategies and promote higher-margin products to improve
-- profitability without reducing sales.


-- ==========================================================
-- Business Question 7:
-- Who are the Top 10 Most Valuable Customers?
-- ==========================================================

SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore
GROUP BY customer_name
ORDER BY
    total_profit DESC,
    total_sales DESC,
    total_orders DESC
LIMIT 10;

-- Business Insight:
-- These customers contribute significantly to business
-- profitability, sales and purchase frequency.

-- Business Recommendation:
-- Strengthen relationships through loyalty programs,
-- personalized offers and premium customer service.
-- Retaining valuable customers is generally more
-- cost-effective than acquiring new ones.


-- ==========================================================
-- Business Question 8:
-- Which product category has the highest profit margin?
-- ==========================================================

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin
FROM superstore
GROUP BY category
ORDER BY profit_margin DESC;

-- Business Insight:
-- Office Supplies generates the highest profit margin,
-- indicating efficient conversion of sales into profit.

-- Business Recommendation:
-- Increase product visibility and marketing efforts while
-- maintaining the healthy profit margin. Focus on growing
-- sales without relying on excessive discounts.


-- ==========================================================
-- Business Question 9:
-- Which customer segment receives the highest average discount?
-- ==========================================================

SELECT
    segment,
    ROUND(AVG(discount)*100,2) AS average_discount_percentage
FROM superstore
GROUP BY segment
ORDER BY average_discount_percentage DESC;

-- Business Insight:
-- The Consumer segment receives the highest average discount,
-- suggesting that the company relies more heavily on
-- discounting for this customer group.

-- Business Recommendation:
-- Evaluate whether these discounts improve sales and
-- profitability. If they are not generating sufficient
-- business value, optimize the discount strategy while
-- maintaining customer satisfaction.


-- ==========================================================
-- Business Question 10:
-- Which month generates the highest sales?
-- ==========================================================

SELECT
    MONTHNAME(order_date) AS month_name,
    MONTH(order_date) AS month_number,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY total_sales DESC;

-- Business Insight:
-- November generates the highest sales, indicating that it
-- is the strongest sales month of the year.

-- Business Recommendation:
-- Prepare for the peak sales season by increasing inventory,
-- staffing and marketing activities before November.
-- Validate that strong sales are also supported by healthy
-- profit margins and sustainable discount levels.