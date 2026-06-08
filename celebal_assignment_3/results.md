# Results & Insights

## Dataset Overview

After data cleaning and normalization, the Superstore dataset was organized into separate customer, product, and order tables for analysis.

| Metric           | Count |
| ---------------- | ----: |
| Records Imported | 9,694 |
| Customers        |   793 |
| Products         | 1,842 |
| Orders           | 9,693 |

---

## Customer Sales Analysis

### Top 5 Customers by Revenue

| Rank | Customer Name | Total Sales ($) |
| ---- | ------------- | --------------: |
| 1    | Sean Miller   |       25,043.05 |
| 2    | Tamara Chand  |       19,017.85 |
| 3    | Raymond Buch  |       15,117.34 |
| 4    | Tom Ashbrook  |       14,595.62 |
| 5    | Adrian Barton |       14,355.61 |

### Insight

A small group of customers generates a disproportionately high share of total revenue. Sean Miller alone contributed more than $25,000 in sales, highlighting the importance of identifying and retaining high-value customers.

---

## Lowest Revenue Customers

### Bottom 5 Customers by Sales

| Customer Name   | Total Sales ($) |
| --------------- | --------------: |
| Thais Sissman   |            4.83 |
| Lela Donovan    |            5.30 |
| Mitch Gastineau |           12.32 |
| Carl Jackson    |           16.52 |
| Roy Skaria      |           22.33 |

### Insight

Customer spending varies significantly across the dataset. The difference between the highest and lowest customer revenue demonstrates a highly skewed sales distribution and suggests opportunities for targeted customer engagement strategies.

---

## Single-Purchase Customers

### Customers with Only One Order

A total of **12 customers** placed only one order during the recorded period.

* Anemone Ratner
* Anthony O'Donnell
* Carl Jackson
* Jenna Caffey
* Jocasta Rupert
* Lela Donovan
* Mitch Gastineau
* Patricia Hirasaki
* Ricardo Emerson
* Roland Murray
* Susan MacKendrick
* Theresa Coyne

### Insight

Single-purchase customers may represent untapped retention opportunities. Understanding why these customers did not make repeat purchases could help improve long-term customer value.

---

## SQL Techniques Utilized

### Subqueries

* Retrieved orders with sales above the overall average
* Identified the highest-value order for each customer
* Selected customers whose sales exceeded the average customer revenue

### Common Table Expressions (CTEs)

* Calculated customer-level sales metrics
* Created reusable datasets for customer segmentation
* Simplified multi-step analytical queries

### Window Functions

* Ranked customers by total sales
* Assigned row numbers to customer orders
* Identified top-performing customers efficiently

### Joins

* Combined customer, product, and order information
* Generated customer performance reports
* Enabled multi-table business analysis

---

## Business Questions Answered

The project successfully addressed the following analytical questions:

1. Which orders generated sales above the average order value?
2. What was the highest-value order placed by each customer?
3. How much revenue did each customer generate?
4. Which customers performed above the average sales level?
5. How can customers be ranked by total revenue?
6. How can orders be sequenced within each customer group?
7. Who are the top-performing customers based on sales?

Additionally, a consolidated analysis was created using **CTEs, JOINs, and Window Functions** to produce customer sales rankings and performance reports.

---

## Key Findings

### Revenue Concentration

Sales are concentrated among a relatively small number of customers, indicating the presence of a valuable high-spending customer segment.

### Uneven Spending Patterns

Customer revenue ranges from less than $5 to over $25,000, demonstrating substantial variation in purchasing behavior.

### Effective Customer Segmentation

Window functions and ranking techniques enabled customers to be grouped and evaluated according to their sales performance.

### Strong Repeat Purchase Activity

The majority of customers placed multiple orders, suggesting healthy repeat purchasing behavior across the dataset.

---

## Project Outcome

This project successfully transformed raw Superstore sales data into a structured relational database and applied advanced SQL techniques to extract meaningful business insights.

Key areas demonstrated include:

* Database Normalization
* Data Transformation
* Aggregation & Reporting
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* Customer Analytics
* Business Intelligence Reporting

The final analysis provides a comprehensive view of customer performance and showcases practical SQL skills commonly used in Data Analytics and Data Engineering workflows.
