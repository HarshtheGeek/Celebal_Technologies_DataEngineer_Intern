/*==========================================================
  INTERMEDIATE QUERY 4
  Question:
  Find customers who placed orders but never had
  any order delivered.
==========================================================*/

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
HAVING
SUM(
    CASE
        WHEN o.status = 'DELIVERED'
        THEN 1
        ELSE 0
    END
) = 0;



/*==========================================================
  INTERMEDIATE QUERY 5
  Question:
  Find products that were ordered but had more
  returns than purchases.
==========================================================*/

SELECT
    p.product_id,
    p.product_name,

    SUM(
        CASE
            WHEN o.status = 'RETURNED'
            THEN oi.quantity
            ELSE 0
        END
    ) AS returned_items,

    SUM(
        CASE
            WHEN o.status <> 'RETURNED'
            THEN oi.quantity
            ELSE 0
        END
    ) AS purchased_items

FROM products p

JOIN order_items oi
    ON p.product_id = oi.product_id

JOIN orders o
    ON oi.order_id = o.order_id

GROUP BY
    p.product_id,
    p.product_name

HAVING returned_items > purchased_items;



/*==========================================================
  INTERMEDIATE QUERY 6
  Question:
  Calculate the return rate
  (returned items / total items)
  for each category.
==========================================================*/

SELECT
    p.category,

    ROUND(
        (
            SUM(
                CASE
                    WHEN o.status = 'RETURNED'
                    THEN oi.quantity
                    ELSE 0
                END
            ) * 100.0
        ) /
        SUM(oi.quantity),
        2
    ) AS return_rate

FROM products p

JOIN order_items oi
    ON p.product_id = oi.product_id

JOIN orders o
    ON oi.order_id = o.order_id

GROUP BY p.category

ORDER BY return_rate DESC;