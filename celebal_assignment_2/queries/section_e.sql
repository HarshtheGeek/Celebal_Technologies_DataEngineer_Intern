/* Q24. Write a query using CASE to classify products into price tiers: 
  • 'Budget'    → unit_price < 1000 
  • 'Mid-Range' → unit_price BETWEEN 1000 AND 3000 
  • 'Premium'   → unit_price > 3000 
Display: product_name, unit_price, price_tier. */

SELECT 
    product_name,
    unit_price,
    CASE
        WHEN unit_price < 1000 THEN 'Budget'
        WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_tier
FROM products;


/* Q25. Using a CASE statement inside an aggregate function, 
count how many orders are 'Delivered' vs 'Not Delivered' (all other statuses). 
Display the result in a single row.  */

SELECT
    COUNT(CASE WHEN status = 'Delivered' THEN 1 END) AS delivered_orders,
    COUNT(CASE WHEN status != 'Delivered' THEN 1 END) AS not_delivered_orders
FROM orders;

/* Q26. Explain each letter of ACID: 
  • A – Atomicity 
  • C – Consistency 
  • I – Isolation 
  • D – Durability 
Give a real-world example (e.g., bank transfer) showing why each property is important. */

ACID properties ensure that database transactions are reliable and accurate.

A – Atomicity
All operations in a transaction happen completely or not at all.
Example: During a bank transfer, if money is deducted from one account but not added to another due to an error, the whole transaction is cancelled.

C – Consistency
A transaction must keep the database in a valid state.
Example: If ₹1000 is transferred, the total money in both accounts should remain unchanged.

I – Isolation
Transactions running at the same time should not affect each other.
Example: Two people withdrawing money simultaneously should not cause an incorrect balance.

D – Durability
Once a transaction is completed, the data is permanently saved.
Example:After a successful transfer, the transaction remains saved even if the system crashes.


/*Q27. Write a SQL transaction that does the following atomically: 
  1. Insert a new order (order_id=1011, customer_id=102, today's date, 'Pending', 1598.00) 
  2. Insert two order items for that order 
  3. Update the stock_qty of the purchased products 
  4. If any step fails, ROLLBACK the entire transaction. Otherwise, COMMIT. 
Write the complete BEGIN...COMMIT/ROLLBACK block. */

START TRANSACTION;

-- 1. We insert new order
INSERT INTO orders
VALUES (1011, 102, CURRENT_DATE, 'Pending', 1598.00);

-- 2. Insert order items
INSERT INTO order_items
VALUES (5016, 1011, 202, 1, 799.00, 0);

INSERT INTO order_items
VALUES (5017, 1011, 208, 1, 599.00, 0);

-- 3. Update product stock
UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 202;

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 208;

-- 4. Save all changes
COMMIT;


If any statement fails before `COMMIT`, execute:

ROLLBACK;
