SELECT
        o.customer_id,
        COUNT(o.order_id) AS frequency,
        ROUND(SUM(o.final_amount), 2) AS monetary,
        ROUND(AVG(o.final_amount), 2) AS avg_order_value,
        DATEDIFF('day', MAX(o.order_date::DATE), DATE '2025-12-31') AS recency,
        DATEDIFF('day', MIN(o.order_date::DATE), MAX(o.order_date::DATE)) AS customer_age,
        COUNT(DISTINCT o.payment_method) AS payment_methods_used,
        COUNT(DISTINCT o.sales_channel) AS channels_used
    FROM orders o
    WHERE o.order_status = 'Delivered'
    GROUP BY o.customer_id