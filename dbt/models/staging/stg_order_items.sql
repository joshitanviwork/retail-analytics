SELECT
    order_id,
    product_id,
    seller_id,
    price,
    freight_value,
    price + freight_value AS total_value
FROM `retail-analytics-493018.olist_raw.order_items`