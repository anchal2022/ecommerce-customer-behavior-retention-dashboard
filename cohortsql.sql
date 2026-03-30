SELECT COUNT(DISTINCT user_id) AS cohort_users
FROM final_orders
WHERE order_number = 1;

SELECT 
    order_number,
    COUNT(DISTINCT user_id) AS users_count
FROM final_orders
GROUP BY order_number
ORDER BY order_number;

SELECT 
    order_number,
    COUNT(DISTINCT user_id) AS retained_users,
    ROUND(
        100.0 * COUNT(DISTINCT user_id) /
        (SELECT COUNT(DISTINCT user_id) FROM final_orders WHERE order_number = 1),
        2
    ) AS retention_percent
FROM final_orders
GROUP BY order_number
ORDER BY order_number;

SELECT 
    order_number,
    COUNT(DISTINCT user_id) AS retained_users,
    ROUND(
        100.0 * COUNT(DISTINCT user_id) /
        (SELECT COUNT(DISTINCT user_id) FROM final_orders WHERE order_number = 1),
        2
    ) AS retention_percent
FROM final_orders
WHERE order_number <= 10
GROUP BY order_number
ORDER BY order_number;