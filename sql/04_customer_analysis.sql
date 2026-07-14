-- Top 10 Customers by Sales

SELECT customer_name,
ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Top 10 Customers by Profit

SELECT customer_name,
ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;

-- Customers with Most Orders

SELECT customer_name,
COUNT(DISTINCT order_id) AS total_orders
FROM superstore
GROUP BY customer_name
ORDER BY total_orders DESC
LIMIT 10;

-- Average Order Value

SELECT customer_name,
ROUND(SUM(sales),2) AS total_sales,
COUNT(DISTINCT order_id) AS total_orders,
ROUND(SUM(sales)/COUNT(DISTINCT order_id),2) AS average_order_value
FROM superstore
GROUP BY customer_name
ORDER BY average_order_value DESC
LIMIT 10;