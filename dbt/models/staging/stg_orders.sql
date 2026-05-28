-- Staging model for orders
-- Cleans and standardizes raw orders data

SELECT
    order_id,
    customer_id,
    order_status,
    TIMESTAMP_TRUNC(order_purchase_timestamp, DAY) AS order_date,
    TIMESTAMP_TRUNC(order_delivered_customer_date, DAY) AS delivered_date,
    TIMESTAMP_TRUNC(order_estimated_delivery_date, DAY) AS estimated_delivery_date,
    DATE_DIFF(
        DATE(order_delivered_customer_date), 
        DATE(order_purchase_timestamp), 
        DAY
    ) AS delivery_days
FROM `retail-analytics-493018.olist_raw.orders`
WHERE order_status = 'delivered'