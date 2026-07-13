/*==========================================================
 QUERY 7
 Running Total Revenue Per Region
 ==========================================================*/
WITH daily_revenue AS (
    SELECT o.region,
        DATE(o.order_date) AS order_date,
        SUM(
            oi.quantity * oi.unit_price * (1 - oi.discount_percent / 100.0)
        ) AS daily_revenue
    FROM orders o
        JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.region,
        DATE(o.order_date)
)
SELECT region,
    order_date,
    daily_revenue,
    SUM(daily_revenue) OVER(
        PARTITION BY region
        ORDER BY order_date
    ) AS running_total
FROM daily_revenue;
/*==========================================================
 QUERY 8
 Rank Products By Revenue Within Each Category
 ==========================================================*/
SELECT p.category,
    p.product_name,
    ROUND(
        SUM(
            oi.quantity * oi.unit_price * (1 - oi.discount_percent / 100.0)
        ),
        2
    ) AS total_revenue,
    DENSE_RANK() OVER(
        PARTITION BY p.category
        ORDER BY SUM(
                oi.quantity * oi.unit_price * (1 - oi.discount_percent / 100.0)
            ) DESC
    ) AS rank_in_category
FROM products p
    JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category,
    p.product_name;
/*==========================================================
 QUERY 9
 Days Between Consecutive Orders
 Flag Customers With Average Gap > 30 Days
 ==========================================================*/
WITH customer_orders AS (
    SELECT customer_id,
        order_date,
        LAG(order_date) OVER(
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS previous_order_date
    FROM orders
),
customer_gap AS (
    SELECT customer_id,
        order_date,
        previous_order_date,
        JULIANDAY(order_date) - JULIANDAY(previous_order_date) AS days_gap
    FROM customer_orders
)
SELECT customer_id,
    order_date,
    previous_order_date,
    ROUND(days_gap, 2) AS days_gap,
    CASE
        WHEN AVG(days_gap) OVER(PARTITION BY customer_id) > 30 THEN 'At Risk'
        ELSE 'Active'
    END AS customer_status
FROM customer_gap;