-- Q7. Retrieve all orders with status = 'Delivered'.  
SELECT * FROM orders WHERE status = 'Delivered'; 

-- Q8. Find all products in the 'Electronics' category with a unit_price greater than ₹2000.
SELECT * FROM products WHERE unit_price > 2000 ; 

-- Q9. List all customers who joined in the year 2024 and belong to the state 'Maharashtra'. 
SELECT * FROM customers WHERE state = 'Maharashtra' AND YEAR(join_date) = 2024; 

-- Q10. Find all orders placed between '2024-08-10' and '2024-08-25' (inclusive) that are NOT cancelled. 
SELECT * FROM orders WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25' AND status != 'Cancelled'; 

-- Q11. Explain what the index `idx_orders_date` does. How would it improve performance?
The `idx_orders_date` index is created on the `order_date` column of the `orders` table.

It helps the database find rows matching a date condition quickly without scanning the entire table. This improves query performance, especially when the table contains many records.

--Query : 
SELECT * FROM orders WHERE order_date BETWEEN '2024-08-01' AND '2024-08-31';

This query benefits from the `idx_orders_date` index because it filters records using the indexed column.


-- Q12. If you run: SELECT * FROM customers WHERE YEAR(join_date) = 2024; — would the index on join_date be used? Explain why or why not, and rewrite the query to be index-friendly (SARGable). 
No, the index on `join_date` would not be used efficiently because the `YEAR()` function is applied to the column. The database must evaluate the function for each row, which can prevent index usage.

--Query :
SELECT * FROM customers WHERE join_date >= '2024-01-01' AND join_date < '2025-01-01';


