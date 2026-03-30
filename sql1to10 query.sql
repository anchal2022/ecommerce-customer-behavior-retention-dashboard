SELECT COUNT(*) AS total_orders
FROM final_orders;
SELECT COUNT(DISTINCT user_id) AS total_users
FROM final_orders;
SELECT COUNT(DISTINCT product_id) AS total_unique_products_ordered
FROM final_order_items;
SELECT COUNT(*) AS total_items_purchased
FROM final_order_items;
SELECT 
    ROUND(AVG(order_count), 2) AS avg_orders_per_user
FROM
(
    SELECT user_id, COUNT(order_id) AS order_count
    FROM final_orders
    GROUP BY user_id
) t;
SELECT 
    order_dow,
    COUNT(*) AS total_orders
FROM final_orders
GROUP BY order_dow
ORDER BY total_orders DESC;

SELECT 
    order_hour_of_day,
    COUNT(*) AS total_orders
FROM final_orders
GROUP BY order_hour_of_day
ORDER BY order_hour_of_day;
SELECT 
    p.product_id,
    p.product_name,
    COUNT(*) AS times_ordered
FROM final_order_items oi
JOIN final_products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY times_ordered DESC
LIMIT 10;

SELECT 
    p.product_id,
    p.product_name,
    SUM(CASE WHEN oi.reordered = 1 THEN 1 ELSE 0 END) AS reorder_count
FROM final_order_items oi
JOIN final_products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY reorder_count DESC
LIMIT 10;
SELECT 
    ROUND(100.0 * SUM(CASE WHEN reordered = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS reorder_rate_percent
FROM final_order_items;
ALTER TABLE final_orders
CHANGE COLUMN `ï»¿order_id` order_id INT;

ALTER TABLE final_order_items
CHANGE COLUMN `ï»¿order_id` order_id INT;

ALTER TABLE final_products
CHANGE COLUMN `ï»¿product_id` product_id INT;