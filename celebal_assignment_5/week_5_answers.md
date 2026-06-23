# Spark Data Processing Assignment - Week 5

## Student Details

- Name: Harsh Vishwakarma
- Course: B.Tech CSE
- Subject: Big Data Analytics / Apache Spark
- Assignment: Week 5

---

# Dataset Used

**File:** `business-financial-data-march-2026-quarter.csv`

The dataset contains quarterly business financial statistics including:

- Series Reference
- Period
- Data Value
- Status
- Units
- Magnitude
- Subject
- Group
- Series Titles

---

# Q1. What are the key limitations of traditional MapReduce that make Spark a preferred choice for modern big data processing?

### Answer

Traditional MapReduce writes intermediate results to disk after every stage, resulting in high disk I/O overhead and slower processing. It is inefficient for iterative machine learning algorithms and real-time analytics. Apache Spark uses in-memory computation, supports multiple workloads, and provides significantly faster execution.

---

# Q2. Explain how Spark uses In-Memory Computing to speed up iterative machine learning algorithms compared to disk-based systems.

### Answer

Spark stores intermediate data in memory rather than repeatedly writing it to disk. Iterative machine learning algorithms can reuse cached data across multiple iterations, reducing disk access and improving execution speed.

---

# Q3. Remove duplicate rows based on Series_reference and Period.

```python
df_no_duplicates = df.dropDuplicates(
    ["Series_reference", "Period"]
)
```

---

# Q4. Filter records where STATUS = 'F' and calculate average Data_value by Group.

```python
from pyspark.sql.functions import avg

result = (
    df.filter(df.STATUS == "F")
      .groupBy("Group")
      .agg(avg("Data_value").alias("avg_value"))
)

result.show()
```

---

# Q5. Difference between .na.drop() and .na.fill()

### Answer

- `.na.drop()` removes rows containing null values.
- `.na.fill()` replaces null values with a specified value.

Example:

```python
df = df.na.fill({
    "STATUS": "Unknown"
})
```

---

# Q6. Find the count of records for each Group where count > 100.

```python
from pyspark.sql.functions import count

result = (
    df.groupBy("Group")
      .agg(count("*").alias("record_count"))
      .filter("record_count > 100")
)

result.show()
```

---

# Q7. How does DataFrame immutability affect data cleaning?

### Answer

Spark DataFrames are immutable. Operations such as dropping columns or renaming columns create new DataFrames rather than modifying the original DataFrame.

Example:

```python
df_clean = df.drop("Suppressed")

df_clean = df_clean.withColumnRenamed(
    "Data_value",
    "value"
)
```

---

# Q8. Filter rows where Magnitude is between 3 and 6 and STATUS = 'F'.

```python
result = df.filter(
    (df.Magnitude >= 3) &
    (df.Magnitude <= 6) &
    (df.STATUS == "F")
)

result.show()
```

---

# Q9. Why should null values be handled before aggregation?

### Answer

Null values can lead to incorrect calculations, inaccurate averages, and missing aggregation results. Cleaning null values before performing operations such as `sum()` and `avg()` ensures reliable analysis.

---

# Q10. Convert Period column and rename it as event_time.

```python
from pyspark.sql.functions import col
from pyspark.sql.types import DoubleType

df = (
    df.withColumn(
        "event_time",
        col("Period").cast(DoubleType())
    )
    .drop("Period")
)
```

---

# Q11. Explain the Shuffle process.

### Answer

Shuffle is the process of redistributing data across partitions during operations such as `groupBy()`, `join()`, and `reduceByKey()`.

Example:

```python
df.groupBy("Group")
```

Shuffle is considered a wide transformation because data moves across executors and partitions over the network.

---

# Q12. Remove rows where Data_value or STATUS contains null values.

```python
from pyspark.sql.functions import col

df_clean = df.filter(
    col("Data_value").isNotNull() &
    col("STATUS").isNotNull()
)
```

---

# Q13. Calculate minimum, maximum, and average Data_value.

```python
from pyspark.sql.functions import min, max, mean

result = df.agg(
    min("Data_value").alias("min_value"),
    max("Data_value").alias("max_value"),
    mean("Data_value").alias("avg_value")
)

result.show()
```

---

# Q14. What is the risk of using inferSchema=True?

### Answer

When source data contains inconsistent formats, Spark may infer incorrect data types. This can lead to parsing errors, null values, and inaccurate analysis. It is often safer to validate data before relying on automatic schema inference.

---

# Q15. Final Processing Pipeline

### Requirements

- Remove duplicates
- Fill null values in Data_value with 0
- Group by Group
- Calculate total value

```python
from pyspark.sql.functions import sum

result = (
    df
    .dropDuplicates()
    .na.fill({"Data_value": 0})
    .groupBy("Group")
    .agg(
        sum("Data_value")
        .alias("total_value")
    )
)

result.show()
```

---

# Steps Performed

1. Loaded the CSV dataset into a Spark DataFrame.
2. Removed duplicate records.
3. Handled missing values using `.na.fill()`.
4. Filtered records using conditional queries.
5. Applied transformations such as renaming and type conversion.
6. Performed aggregation operations including count, average, minimum, maximum, and sum calculations.
7. Generated summary statistics for business data analysis.

---

# Observations

- Spark performs data processing much faster than traditional MapReduce due to in-memory computation.
- DataFrame immutability ensures data consistency.
- Handling null values before aggregation improves result accuracy.
- GroupBy operations trigger shuffle operations which may impact performance.
- Aggregations provide useful insights into business financial data.

---

# Folder Structure

```text
spark-assignment/
│── data/
│   └── business-financial-data-march-2026-quarter.csv
│── notebook/
│   └── spark_basics.ipynb
│── output/
│   └── results.csv
│── README.md
```
