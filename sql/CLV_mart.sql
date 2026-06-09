SELECT
        customer_id,
        COUNT(order_id) - 1 AS frequency,
        DATEDIFF('day', MIN(order_date::DATE), MAX(order_date::DATE)) AS recency,
        DATEDIFF('day', MIN(order_date::DATE), DATE '2025-12-31') AS T,
        ROUND(AVG(final_amount), 2) AS monetary_value
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
    HAVING COUNT(order_id) >= 1