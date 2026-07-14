USE salesdb;

-- Check total rows
SELECT COUNT(*) AS total_rows
FROM superstore;

-- Check NULL values
SELECT *
FROM superstore
WHERE order_id IS NULL
   OR customer_name IS NULL
   OR sales IS NULL
   OR profit IS NULL;

-- Check duplicate Order IDs
SELECT order_id,
COUNT(*) AS total_rows
FROM superstore
GROUP BY order_id
HAVING COUNT(*) > 1;

-- View dataset
SELECT *
FROM superstore
LIMIT 10;