SELECT 
    user_id,
    COUNT(*) AS total_orders
FROM final_orders
GROUP BY user_id
ORDER BY total_orders DESC
LIMIT 10;

SELECT 
    o.user_id,
    ROUND(AVG(t.item_count), 2) AS avg_basket_size
FROM final_orders o
JOIN (
    SELECT 
        order_id,
        COUNT(*) AS item_count
    FROM final_order_items
    GROUP BY order_id
) t
    ON o.order_id = t.order_id
GROUP BY o.user_id
HAVING COUNT(o.order_id) >= 2
ORDER BY avg_basket_size DESC
LIMIT 10;

SELECT 
    user_id,
    ROUND(AVG(days_since_prior_order), 2) AS avg_days_between_orders
FROM final_orders
WHERE days_since_prior_order IS NOT NULL
GROUP BY user_id
ORDER BY avg_days_between_orders ASC
LIMIT 10;

SELECT 
    o.order_hour_of_day,
    ROUND(100.0 * SUM(CASE WHEN oi.reordered = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS reorder_rate_percent
FROM final_orders o
JOIN final_order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_hour_of_day
ORDER BY o.order_hour_of_day;

SELECT 
    o.order_dow,
    ROUND(100.0 * SUM(CASE WHEN oi.reordered = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS reorder_rate_percent
FROM final_orders o
JOIN final_order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_dow
ORDER BY o.order_dow;

SELECT 
    p.product_id,
    p.product_name,
    ROUND(100.0 * SUM(CASE WHEN oi.add_to_cart_order = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS first_add_rate_percent
FROM final_order_items oi
JOIN final_products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(*) >= 5
ORDER BY first_add_rate_percent DESC
LIMIT 10;

SELECT 
    p.product_id,
    p.product_name,
    COUNT(*) AS times_ordered,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM final_order_items), 2) AS contribution_percent
FROM final_order_items oi
JOIN final_products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY times_ordered DESC
LIMIT 10;

SELECT 
    p1.product_name AS product_1,
    p2.product_name AS product_2,
    COUNT(*) AS times_bought_together
FROM final_order_items oi1
JOIN final_order_items oi2
    ON oi1.order_id = oi2.order_id
   AND oi1.product_id < oi2.product_id
JOIN final_products p1
    ON oi1.product_id = p1.product_id
JOIN final_products p2
    ON oi2.product_id = p2.product_id
GROUP BY p1.product_name, p2.product_name
ORDER BY times_bought_together DESC
LIMIT 10;

WITH product_counts AS (
    SELECT 
        p.department_id,
        p.product_id,
        p.product_name,
        COUNT(*) AS times_ordered
    FROM final_order_items oi
    JOIN final_products p
        ON oi.product_id = p.product_id
    GROUP BY p.department_id, p.product_id, p.product_name
),
ranked_products AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY times_ordered DESC) AS rn
    FROM product_counts
)
SELECT 
    department_id,
    product_id,
    product_name,
    times_ordered
FROM ranked_products
WHERE rn = 1
ORDER BY times_ordered DESC;

SELECT 
    CASE
        WHEN t.item_count = 1 THEN '1 item'
        WHEN t.item_count BETWEEN 2 AND 5 THEN '2-5 items'
        WHEN t.item_count BETWEEN 6 AND 10 THEN '6-10 items'
        ELSE '10+ items'
    END AS basket_category,
    ROUND(100.0 * SUM(t.reordered_items) / SUM(t.item_count), 2) AS reorder_rate_percent
FROM (
    SELECT 
        order_id,
        COUNT(*) AS item_count,
        SUM(CASE WHEN reordered = 1 THEN 1 ELSE 0 END) AS reordered_items
    FROM final_order_items
    GROUP BY order_id
) t
GROUP BY basket_category
ORDER BY reorder_rate_percent DESC;