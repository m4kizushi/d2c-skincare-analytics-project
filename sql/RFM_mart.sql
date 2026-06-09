SELECT
        customer_id,
        
        
        DATEDIFF('day', MAX(order_date::DATE), DATE '2025-12-31') AS recency,
        
        
        COUNT(order_id) AS frequency,
        
        
        ROUND(SUM(final_amount), 2) AS monetary

    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id