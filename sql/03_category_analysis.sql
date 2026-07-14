-- Total Sales by Category

SELECT category,
ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- Total Profit by Category

SELECT category,
ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

-- Average Order Value by Category

SELECT category,
ROUND(SUM(sales),2) AS total_sales,
COUNT(DISTINCT order_id) AS total_orders,
ROUND(SUM(sales)/COUNT(DISTINCT order_id),2) AS average_order_value
FROM superstore
GROUP BY category
ORDER BY average_order_value DESC;

-- Profit Margin by Category

SELECT category,
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(profit),2) AS total_profit,
ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin
FROM superstore
GROUP BY category
ORDER BY profit_margin DESC;