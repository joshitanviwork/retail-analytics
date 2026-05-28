WITH last_order_date AS (
    SELECT MAX(DATE(order_purchase_timestamp)) AS max_date
    FROM `retail-analytics-493018.olist_raw.orders`
),

rfm AS (
    SELECT
        o.customer_id,
        DATE_DIFF(l.max_date, MAX(DATE(o.order_purchase_timestamp)), DAY) AS recency,
        COUNT(o.order_id) AS frequency,
        SUM(p.payment_value) AS monetary
    FROM `retail-analytics-493018.olist_raw.orders` o
    JOIN `retail-analytics-493018.olist_raw.payments` p ON o.order_id = p.order_id
    CROSS JOIN last_order_date l
    WHERE o.order_status = 'delivered'
    GROUP BY o.customer_id, l.max_date
)

SELECT
    customer_id,
    recency,
    frequency,
    ROUND(monetary, 2) AS monetary
FROM rfm
ORDER BY monetary DESC