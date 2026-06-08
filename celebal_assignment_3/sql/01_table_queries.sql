/*
SUPERSTORE SALES ANALYSIS
Week 3 Assignment - Celebal Technology Data Engineering Internship

Objective:
Create normalized tables from the imported superstore_raw dataset.
*/
CREATE DATABASE superstore_db;
USE superstore_db;

-- =======================================================
-- CUSTOMERS TABLE
-- =======================================================

CREATE TABLE customers (
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50)
);

INSERT INTO customers
SELECT DISTINCT
    `Customer ID`,
    `Customer Name`,
    Segment
FROM superstore_raw;


-- =======================================================
-- PRODUCTS TABLE
-- =======================================================

CREATE TABLE products (
    product_id VARCHAR(50),
    product_name VARCHAR(255),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);

INSERT INTO products
SELECT DISTINCT
    `Product ID`,
    `Product Name`,
    Category,
    `Sub-Category`
FROM superstore_raw;


-- =======================================================
-- ORDERS TABLE
-- =======================================================

CREATE TABLE orders (
    order_id VARCHAR(50),
    order_date VARCHAR(50),
    ship_date VARCHAR(50),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    sales DOUBLE,
    quantity INT,
    discount DOUBLE,
    profit DOUBLE
);

INSERT INTO orders
SELECT DISTINCT
    `Order ID`,
    `Order Date`,
    `Ship Date`,
    `Ship Mode`,
    `Customer ID`,
    `Product ID`,
    Sales,
    Quantity,
    Discount,
    Profit
FROM superstore_raw;


-- =======================================================
-- VALIDATION
-- =======================================================

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_orders
FROM orders;