# Week 6 – Apache Spark Assignment

## Objective

The objective of this assignment is to understand the basic architecture of Apache Spark and perform data processing using PySpark. It covers reading data, applying transformations, filtering records, handling schemas, and working with different file formats like CSV and Parquet.

---

# Q1. Explain the roles of the Driver, Cluster Manager, and Executor in a Spark application.

**Answer:**

- **Driver:** The Driver is the main program that controls the Spark application. It creates the SparkSession, plans the execution, and sends tasks to executors.
- **Cluster Manager:** It manages the available resources and assigns executors to Spark applications.
- **Executor:** Executors run the tasks assigned by the Driver and return the results after processing the data.

---

# Q2. How does Spark's Lazy Evaluation strategy improve performance when chain-processing large datasets?

**Answer:**

Spark does not execute transformations immediately. Instead, it records all operations and waits until an action like `show()` or `count()` is called. This allows Spark to optimize the execution plan, reduce unnecessary work, and improve performance.

---

# Q3. Read a CSV file with header and inferSchema enabled.

**Code:** Refer to `commands.py`

**Note:**
This command reads the CSV file, treats the first row as column names, and automatically detects the data types of each column.

---

# Q4. What is the difference between CSV and Parquet?

**Answer:**

| CSV                   | Parquet                 |
| --------------------- | ----------------------- |
| Row-based storage     | Column-based storage    |
| Larger file size      | Smaller compressed size |
| Slower to read        | Faster to read          |
| Does not store schema | Stores schema           |

Parquet performs better because Spark reads only the required columns instead of the whole file.

---

# Q5. Select product_id and price where category is 'Electronics'.

**Code:** Refer to `commands.py`

**Note:**
This query filters only the Electronics category and displays the `product_id` and `price` columns.

---

# Q6. Rename a column and cast the price column.

**Code:** Refer to `commands.py`

**Note:**
The code renames `old_name` to `new_name` and converts the `price` column from String to Double so that numerical operations can be performed.

---

# Q7. How does Spark use the Lineage Graph (DAG) for fault tolerance?

**Answer:**

Spark keeps track of all transformations using a Lineage Graph (DAG). If a worker node fails, Spark recreates only the lost data instead of recomputing the entire dataset. This makes Spark fault tolerant.

---

# Q8. Filter completed orders where amount is greater than 1000.

**Code:** Refer to `commands.py`

**Note:**
This query returns only those orders whose status is `Completed` and amount is greater than `1000`.

---

# Q9. Explain Predicate Pushdown in Parquet.

**Answer:**

Predicate Pushdown allows Spark to apply filter conditions while reading the Parquet file. Instead of loading the entire file, only the required rows are read into memory. This reduces memory usage and improves performance.

---

# Q10. Add a new column final_price.

**Code:** Refer to `commands.py`

**Note:**
This creates a new column called `final_price` by multiplying the `base_price` by `1.18`, adding 18% tax.

---

# Q11. Difference between Transformations and Actions.

**Answer:**

**Transformations**

- Create a new DataFrame.
- Executed lazily.
- Examples: `filter()`, `select()`.

**Actions**

- Trigger execution.
- Return results or save data.
- Examples: `show()`, `count()`.

---

# Q12. Read a Parquet file, remove null user IDs, and save as CSV.

**Code:** Refer to `commands.py`

**Note:**
This command reads a Parquet file, removes rows where `user_id` is null, and saves the cleaned data as a CSV file.

---

# Q13. Difference between Client Mode and Cluster Mode.

**Answer:**

| Client Mode                      | Cluster Mode                               |
| -------------------------------- | ------------------------------------------ |
| Driver runs on the local machine | Driver runs inside the cluster             |
| Mainly used for development      | Mainly used for production                 |
| Client must stay connected       | Client can disconnect after job submission |

---

# Conclusion

In this assignment, I learned the basic architecture of Apache Spark, how Spark processes data using lazy evaluation, and how to perform common DataFrame operations such as reading files, filtering data, renaming columns, handling null values, and saving processed data. I also understood why Parquet is preferred over CSV for large-scale data processing due to its better performance.
