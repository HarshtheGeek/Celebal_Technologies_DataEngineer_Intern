# Spark Data Processing Assignment - Week 5

## Objective

This assignment demonstrates the use of Apache Spark DataFrames for data cleaning, filtering, transformations, and aggregations on large datasets.

---

## Technologies Used

* Apache Spark
* PySpark
* Python
* Jupyter Notebook / VS Code

---

## Dataset

The dataset contains information such as:

* user_id
* transaction_date
* city
* region
* product_category
* sale_amount
* price
* store_id

---

## Steps Performed

### 1. Load Data

The dataset was loaded into a Spark DataFrame using:

```python
df = spark.read.csv(
    "data/dataset.csv",
    header=True,
    inferSchema=True
)
```

### 2. Data Cleaning

The following cleaning operations were performed:

* Removed duplicate records.
* Filled missing values.
* Removed invalid records with null email values.
* Removed rows with empty usernames.

### 3. Filtering

Records were filtered based on business requirements such as:

* Region = West
* Premium subscribers
* Age between 18 and 30

### 4. Transformations

Applied several transformations:

* Renamed columns.
* Converted timestamps.
* Created cleaned DataFrames for analysis.

### 5. Aggregations

Performed:

* Average sales by category.
* Count of records by city.
* Total revenue by store.
* Minimum, maximum, and average price calculations.

---

## Output Results

### Sample Revenue Calculation

| Store ID | Total Revenue |
| -------- | ------------- |
| 101      | 15000         |
| 102      | 12250         |
| 103      | 18900         |

*(Replace with actual output from your execution.)*

---

## Observations

* Duplicate records can significantly impact aggregate results.
* Handling null values before aggregation improves data quality.
* GroupBy operations trigger shuffle operations.
* Spark DataFrames are immutable.
* In-memory processing improves performance compared to traditional MapReduce.

---

## Folder Structure

```text
spark-assignment/
│── data/
│   └── dataset.csv
│── notebook/
│   └── spark_basics.ipynb
│── output/
│   └── results.csv
│── week5_answers.md
│── README.md
```

---

## Conclusion

Apache Spark provides efficient mechanisms for large-scale data processing through DataFrame APIs, in-memory computation, and distributed execution. The assignment demonstrated data cleaning, filtering, transformations, and aggregation operations commonly used in data engineering workflows.
