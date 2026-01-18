=========================================
Day 1: Data Loading & Initial Exploration
Project: Customer Retention & Churn Analysis
=========================================

1. Preview the dataset (first 20 rows)
SELECT *
FROM customer_data
LIMIT 20;

2. Count total rows in the dataset
SELECT COUNT(*) AS total_rows
FROM customer_data;

3. Inspect table structure (column names & types)
PRAGMA table_info(customer_data);

4. Check how many unique customers exist
SELECT COUNT(DISTINCT CustomerID) AS unique_customers
FROM customer_data;

5. Check how many rows have missing CustomerID
SELECT COUNT(*) AS missing_customerid_rows
FROM customer_data
WHERE CustomerID IS NULL;

6. Check date range of transactions
SELECT
  MIN(InvoiceDate) AS first_transaction_date,
  MAX(InvoiceDate) AS last_transaction_date
FROM customer_data;

7. Basic sanity check on quantities and prices
SELECT
  MIN(Quantity) AS min_quantity,
  MAX(Quantity) AS max_quantity,
  MIN(UnitPrice) AS min_unit_price,
  MAX(UnitPrice) AS max_unit_price
FROM customer_data;
