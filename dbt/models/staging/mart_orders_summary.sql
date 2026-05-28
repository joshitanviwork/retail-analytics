SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.delivery_days,
    p.payment_value,
    p.payment_type,
    c.customer_city,
    c.customer_state
FROM `retail-analytics-493018.olist_raw.orders` o
JOIN `retail-analytics-493018.olist_raw.payments` p ON o.order_id = p.order_id
JOIN `retail-analytics-493018.olist_raw.customers` c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
