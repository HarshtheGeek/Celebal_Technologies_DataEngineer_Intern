-- Q13. Count the total number of orders in the orders table. 
SELECT COUNT(order_id) as "Total Orders" FROM orders; 

-- Q14. Find the total revenue (SUM of total_amount) from all 'Delivered' orders. 
SELECT SUM(total_amount) as "Total Revenue" FROM orders WHERE status = "Delivered";

-- Q15. Calculate the average unit_price of products in each category. 
SELECT Category, AVG(unit_price) as "Average Price" From products GROUP BY category ;

-- Q16. For each order status, find the count of orders and the total revenue. Sort the result by total revenue in descending order. 
SELECT status, COUNT(order_id) AS "Order Count", SUM(total_amount) AS "Total Revenue" FROM orders GROUP BY status ORDER BY SUM(total_amount) DESC;

-- Q17. Find the most expensive (MAX) and cheapest (MIN) product in each category. 
SELECT category, MAX(unit_price) AS "Most Expensive", MIN(unit_price) AS "Cheapest" FROM products GROUP BY category;

-- Q18. List all product categories where the average unit_price is greater than ₹2000. (Hint: Use HAVING clause) 
SELECT category, AVG(unit_price) as "Average Price" FROM products GROUP BY category HAVING AVG(unit_price) > 2000;

