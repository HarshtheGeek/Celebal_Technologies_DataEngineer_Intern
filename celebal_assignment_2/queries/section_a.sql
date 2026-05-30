-- Q1. Write a query to display all columns and rows from the customer's table. 
SELECT * FROM customers;

-- Q2. Retrieve only the first_name, last_name, and city of all customers. 
SELECT first_name, last_name, city FROM customers; 

-- Q3. List all unique categories available in the products table. 
SELECT DISTINCT category from products;


-- Q4. Identify the Primary Key of each table in the schema. Explain why a Primary Key must be unique and NOT NULL. 
| Table       | Primary Key |
| customers   | customer_id |
| products    | product_id  |
| orders      | order_id    |
| order_items | item_id     |
A primary key must be unique to uniquely identify each record in a table and must not be NULL because every row must have an identifier


-- Q5. What constraints are applied to the email column in the customers table? What would happen if you tried to insert a duplicate email? 
NOT NULL & UNIQUE constraints are applied to the email column in the customers table, so inserting a duplicate email causes a unique constraint violation error.


-- Q6. Try inserting a product with unit_price = -50. What happens and which constraint prevents it? Write both the INSERT statement and explain the error. 
Inserting `unit_price = -50` fails because the `CHECK (unit_price > 0)` constraint rejects negative product prices.
--Query : 
INSERT INTO products VALUES (209, 'Test Product', 'Electronics', 'TestBrand', -50.00, 100);

This insertion fails because the CHECK (unit_price > 0) constraint prevents negative prices. The database returns a CHECK constraint violation error.


