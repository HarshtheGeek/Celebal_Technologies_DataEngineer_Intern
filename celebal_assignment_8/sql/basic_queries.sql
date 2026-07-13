/*==========================================================
  BASIC QUERY 1
  Question:
  Calculate the total revenue per category.
  Revenue = quantity × unit_price ×
            (1 - discount_percent / 100)
==========================================================*/

SELECT
    p.category,
    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount_percent / 100.0)
        ),
        2
    ) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;



/*==========================================================
  BASIC QUERY 2
  Question:
  Find the Top 10 customers by total order value.
==========================================================*/

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(
        SUM(
            oi.quantity *
            oi.unit_price *
            (1 - oi.discount_percent / 100.0)
        ),
        2
    ) AS total_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_order_value DESC
LIMIT 10;



/*==========================================================
  BASIC QUERY 3
  Question:
  Show month-wise order count for the last 12 months.
==========================================================*/

SELECT
    strftime('%Y-%m', order_date) AS order_month,
    COUNT(order_id) AS total_orders
FROM orders
WHERE DATE(order_date) >= DATE('now', '-12 months')
GROUP BY order_month
ORDER BY order_month;