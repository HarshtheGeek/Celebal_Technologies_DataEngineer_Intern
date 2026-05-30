-- Q19. Write an INNER JOIN query to display each order along with the customer's first_name and last_name. Show: order_id, order_date, first_name, last_name, total_amount. 

SELECT
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;


-- Q20. Using a LEFT JOIN, list ALL customers and their orders (if any). Customers with no orders should still appear with NULL values for order columns.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


-- Q21. Write a query using JOINs across three tables (orders → order_items → products) to show: order_id, product_name, quantity, unit_price, and discount_pct for each order item. 

SELECT
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.discount_pct
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;


-- Q22. Explain the difference between LEFT JOIN and RIGHT JOIN with an example from this schema. When would you use a FULL OUTER JOIN? 

LEFT JOIN: Returns all records from the left table and matching records from the right table.

Example:

SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

RIGHT JOIN: Returns all records from the right table and matching records from the left table.

Example:

SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;



-- Q23. Identify all Foreign Key relationships in the schema. Explain what would happen if you tried to insert an order with customer_id = 999 (which doesn't exist in customers)

| Child Table | Foreign Key | Parent Table |
| orders      | customer_id | customers    |
| order_items | order_id    | orders       |
| order_items | product_id  | products     |

-- What happens if customer_id = 999 is inserted?

--Query : 

INSERT INTO orders
VALUES (1011, 999, '2024-09-01', 'Pending', 1000.00);

This query will fail because `customer_id = 999` does not exist in the `customers` table.

The database will show an Error
