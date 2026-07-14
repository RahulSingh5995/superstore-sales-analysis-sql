-- Sales by Segment

SELECT segment,
ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;

-- Profit by Segment

SELECT segment,
ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_profit DESC;

-- Average Discount by Segment

SELECT segment,
ROUND(AVG(discount),2) AS average_discount
FROM superstore
GROUP BY segment
ORDER BY average_discount DESC;

-- Profit Margin by Segment

SELECT segment,
ROUND(SUM(sales),2) AS total_sales,
ROUND(SUM(profit),2) AS total_profit,
ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin
FROM superstore
GROUP BY segment
ORDER BY profit_margin DESC;