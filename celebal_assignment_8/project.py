import pandas as pd
import random

orders = pd.read_csv("data/orders.csv")
order_items = pd.read_csv("data/order_items.csv")
products = pd.read_csv("data/products.csv")
customers = pd.read_csv("data/customers.csv")


indices = customers.sample(frac=0.05).index
customers.loc[indices, "customer_id"] = None

indices = order_items.sample(frac=0.03).index
order_items.loc[indices, "quantity"] *= -1