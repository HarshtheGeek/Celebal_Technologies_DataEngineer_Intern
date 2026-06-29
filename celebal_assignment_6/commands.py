import os
import sys

# Configure PySpark to use the current Python interpreter
os.environ["PYSPARK_PYTHON"] = sys.executable
os.environ["PYSPARK_DRIVER_PYTHON"] = sys.executable

from pyspark.sql import SparkSession
from pyspark.sql.functions import col

# Create Spark Session
spark = SparkSession.builder \
    .appName("Week6 Assignment") \
    .getOrCreate()


# Q3: Read a CSV file with header and inferSchema enabled

df = spark.read \
    .option("header", True) \
    .option("inferSchema", True) \
    .csv("data/source.csv")

print("\nQ3 Output:")
df.show()



# Q5: Select product_id and price where category is Electronics


print("\nQ5 Output:")

electronics = df.filter(
    col("category") == "Electronics"
).select(
    "product_id",
    "price"
)

electronics.show()



# Q6: Rename old_name to new_name and cast price to Double


print("\nQ6 Output:")

df = df.withColumnRenamed(
    "old_name",
    "new_name"
)

df = df.withColumn(
    "price",
    col("price").cast("double")
)

df.show()



# Q8: Filter completed orders where amount > 1000

print("\nQ8 Output:")

df_orders = df

completed_orders = df_orders.filter(
    (col("status") == "Completed") &
    (col("amount") > 1000)
)

completed_orders.show()



# Q10: Add final_price column (18% tax)


print("\nQ10 Output:")

df = df.withColumn(
    "final_price",
    col("base_price") * 1.18
)

df.show()



# Q12: Read Parquet, remove null user_id, save as CSV


print("\nQ12 Output:")

# Read Parquet file
parquet_df = spark.read.parquet("path/to/input")

# Remove rows where user_id is null
clean_df = parquet_df.filter(
    col("user_id").isNotNull()
)

# Save as CSV
clean_df.write \
    .mode("overwrite") \
    .option("header", True) \
    .csv("path/to/output")

print("Filtered data successfully written to path/to/output")




spark.stop()