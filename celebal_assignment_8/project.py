import pandas as pd
import re
import os

# Read all the CSV files
orders = pd.read_csv("data/orders.csv")
order_items = pd.read_csv("data/customer_items.csv")
products = pd.read_csv("data/products.csv")
customers = pd.read_csv("data/customers.csv")

# Create folders to store cleaned data and reports
os.makedirs("cleaned_data", exist_ok=True)
os.makedirs("reports", exist_ok=True)

# Store all cleaning messages
report = []


# ---------------------------------------
# Clean orders data
# ---------------------------------------
def clean_orders():

    global orders

    # Replace missing customer IDs with UNKNOWN
    orders["customer_id"] = orders["customer_id"].fillna("UNKNOWN")

    # Convert order_date to datetime format
    # Invalid dates will become NaT
    orders["order_date"] = pd.to_datetime(
        orders["order_date"],
        errors="coerce"
    )

    report.append("Orders cleaned successfully")


# ---------------------------------------
# Clean product names
# ---------------------------------------
def clean_products():

    global products

    # Remove extra spaces and convert names to Title Case
    products["product_name"] = (
        products["product_name"]
        .str.strip()
        .str.title()
    )

    report.append("Products cleaned successfully")


# ---------------------------------------
# Find invalid email addresses
# ---------------------------------------
def validate_emails():

    # Regular expression for a valid email
    pattern = r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'

    # Get customers with invalid emails
    invalid = customers[
        ~customers["email"].str.match(pattern)
    ]

    # Save invalid emails into a separate file
    invalid.to_csv(
        "reports/invalid_emails.csv",
        index=False
    )

    report.append(
        f"Invalid Emails Found: {len(invalid)}"
    )


# ---------------------------------------
# Check referential integrity
# ---------------------------------------
def check_referential_integrity():

    # Find order_items whose order_id does not exist in orders table
    invalid = order_items[
        ~order_items["order_id"].isin(
            orders["order_id"]
        )
    ]

    # Save invalid records
    invalid.to_csv(
        "reports/invalid_order_items.csv",
        index=False
    )

    report.append(
        f"Invalid Order IDs Found: {len(invalid)}"
    )


# ---------------------------------------
# Run all cleaning functions
# ---------------------------------------
clean_orders()
clean_products()
validate_emails()
check_referential_integrity()


# ---------------------------------------
# Save cleaned CSV files
# ---------------------------------------
orders.to_csv(
    "cleaned_data/orders_cleaned.csv",
    index=False
)

products.to_csv(
    "cleaned_data/products_cleaned.csv",
    index=False
)

customers.to_csv(
    "cleaned_data/customers_cleaned.csv",
    index=False
)

order_items.to_csv(
    "cleaned_data/order_items_cleaned.csv",
    index=False
)


# ---------------------------------------
# Save cleaning report
# ---------------------------------------
with open("reports/cleaning_report.txt", "w") as file:
    for line in report:
        file.write(line + "\n")


print("Phase 2 Completed Successfully")