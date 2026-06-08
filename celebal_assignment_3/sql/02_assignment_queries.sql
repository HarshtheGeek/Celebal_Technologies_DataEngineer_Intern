/* Week 3 Assignment */

/* 1. Finding orders where sales are higher than the average sales */

SELECT *
FROM orders
WHERE sales >
(
    SELECT AVG(sales)
    FROM orders
);


/* 2. Finding the highest sales order for every customer */

SELECT *
FROM orders o
WHERE sales =
(
    SELECT MAX(sales)
    FROM orders
    WHERE customer_id = o.customer_id
);


/* 3. Calculating total sales made by each customer */

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_sales;


/* 4. Customers whose total sales are above the overall average */

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);


/* Ranking customers based on their total sales */

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM customer_sales;


/* Assigning row numbers to orders within each customer */

SELECT
    customer_id,
    order_id,
    sales,
    ROW_NUMBER() OVER
    (
        PARTITION BY customer_id
        ORDER BY sales DESC
    ) AS row_num
FROM orders;


/* Getting the top 3 customers by total sales */

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
),

ranked_customers AS
(
    SELECT
        *,
        RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
    FROM customer_sales
)

SELECT *
FROM ranked_customers
WHERE sales_rank <= 3;


/* Combining CTE, JOIN and ranking to show customer sales */

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales,
    RANK() OVER
    (
        ORDER BY cs.total_sales DESC
    ) AS sales_rank
FROM customer_sales cs
JOIN customers c
ON cs.customer_id = c.customer_id;