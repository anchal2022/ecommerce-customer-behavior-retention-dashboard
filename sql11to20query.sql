SELECT 
    p.department_id,
    COUNT(*) AS total_items_ordered
FROM final_order_items oi
JOIN final_products p
    ON oi.product_id = p.product_id
GROUP BY p.department_id
ORDER BY total_items_ordered DESC
LIMIT 10;

SELECT 
    p.aisle_id,
    COUNT(*) AS total_items_ordered
FROM final_order_items oi
JOIN final_products p
    ON oi.product_id = p.product_id
GROUP BY p.aisle_id
ORDER BY total_items_ordered DESC
LIMIT 10;

SELECT 
    p.product_id,
    p.product_name,
    COUNT(DISTINCT o.user_id) AS unique_users
FROM final_order_items oi
JOIN final_products p
    ON oi.product_id = p.product_id
JOIN final_orders o
    ON oi.order_id = o.order_id
GROUP BY p.product_id, p.product_name
ORDER BY unique_users DESC
LIMIT 10;

SELECT 
    p.department_id,
    ROUND(100.0 * SUM(CASE WHEN oi.reordered = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS reorder_rate_percent
FROM final_order_items oi
JOIN final_products p
    ON oi.product_id = p.product_id
GROUP BY p.department_id
ORDER BY reorder_rate_percent DESC;

SELECT 
    p.aisle_id,
    ROUND(100.0 * SUM(CASE WHEN oi.reordered = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS reorder_rate_percent
FROM final_order_items oi
JOIN final_products p
    ON oi.product_id = p.product_id
GROUP BY p.aisle_id
ORDER BY reorder_rate_percent DESC
LIMIT 10;

SELECT 
    ROUND(AVG(item_count), 2) AS avg_basket_size
FROM (
    SELECT 
        order_id,
        COUNT(*) AS item_count
    FROM final_order_items
    GROUP BY order_id
) t;

SELECT 
    order_id,
    COUNT(*) AS basket_size
FROM final_order_items
GROUP BY order_id
ORDER BY basket_size DESC
LIMIT 10;

SELECT 
    CASE
        WHEN item_count = 1 THEN '1 item'
        WHEN item_count BETWEEN 2 AND 5 THEN '2-5 items'
        WHEN item_count BETWEEN 6 AND 10 THEN '6-10 items'
        ELSE '10+ items'
    END AS basket_category,
    COUNT(*) AS total_orders
FROM (
    SELECT 
        order_id,
        COUNT(*) AS item_count
    FROM final_order_items
    GROUP BY order_id
) t
GROUP BY basket_category
ORDER BY total_orders DESC;

SELECT 
    p.product_id,
    p.product_name,
    COUNT(*) AS first_added_count
FROM final_order_items oi
JOIN final_products p
    ON oi.product_id = p.product_id
WHERE oi.add_to_cart_order = 1
GROUP BY p.product_id, p.product_name
ORDER BY first_added_count DESC
LIMIT 10;

SELECT 
    p.product_id,
    p.product_name,
    ROUND(AVG(oi.add_to_cart_order), 2) AS avg_cart_position
FROM final_order_items oi
JOIN final_products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(*) >= 5
ORDER BY avg_cart_position ASC
LIMIT 10;