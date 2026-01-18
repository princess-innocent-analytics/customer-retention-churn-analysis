
Day 3: Churn Analysis (180 days)

Step 1: Last purchase date per customer
SELECT
  CustomerID,
  MAX(InvoiceDate) AS last_purchase_date
FROM customer_data
WHERE CustomerID IS NOT NULL
  AND Quantity > 0
GROUP BY CustomerID;


Reference date (end of dataset)
SELECT
  MAX(InvoiceDate) AS dataset_last_date
FROM customer_data
WHERE Quantity > 0;



=========================================
Day 3: Customer Churn Analysis (180 Days)
=========================================

“I performed churn analysis using a 180-day inactivity definition, handled date parsing issues in SQLite, and classified customers as Active or Churned.”

Step 3: Classify customers as Active or Churned
WITH cleaned AS (
  SELECT
    CustomerID,
    printf(
      '%04d-%02d-%02d',
      CAST(substr(InvoiceDate, instr(InvoiceDate, '/') + instr(substr(InvoiceDate, instr(InvoiceDate, '/') + 1), '/') + 1, 4) AS INTEGER),
      CAST(substr(InvoiceDate, 1, instr(InvoiceDate, '/') - 1) AS INTEGER),
      CAST(substr(
        InvoiceDate,
        instr(InvoiceDate, '/') + 1,
        instr(substr(InvoiceDate, instr(InvoiceDate, '/') + 1), '/') - 1
      ) AS INTEGER)
    ) AS invoice_date_clean
  FROM customer_data
  WHERE CustomerID IS NOT NULL
    AND Quantity > 0
),
last_purchase AS (
  SELECT
    CustomerID,
    MAX(invoice_date_clean) AS last_purchase_date
  FROM cleaned
  GROUP BY CustomerID
),
dataset_date AS (
  SELECT
    MAX(invoice_date_clean) AS dataset_last_date
  FROM cleaned
)
SELECT
  lp.CustomerID,
  lp.last_purchase_date,
  CAST(
    JULIANDAY(dd.dataset_last_date) - JULIANDAY(lp.last_purchase_date)
    AS INTEGER
  ) AS days_since_last_purchase,
  CASE
    WHEN (JULIANDAY(dd.dataset_last_date) - JULIANDAY(lp.last_purchase_date)) >= 180
      THEN 'Churned'
    ELSE 'Active'
  END AS churn_status
FROM last_purchase lp
CROSS JOIN dataset_date dd
ORDER BY days_since_last_purchase DESC;



Step 4: Churn count and churn rate (%)
(180-day inactivity definition)

“How bad is churn?”

- Count Active customers

- Count Churned customers

- Calculate churn percentage

WITH churn_data AS (
  WITH cleaned AS (
    SELECT
      CustomerID,
      printf(
        '%04d-%02d-%02d',
        CAST(substr(InvoiceDate, instr(InvoiceDate, '/') + instr(substr(InvoiceDate, instr(InvoiceDate, '/') + 1), '/') + 1, 4) AS INTEGER),
        CAST(substr(InvoiceDate, 1, instr(InvoiceDate, '/') - 1) AS INTEGER),
        CAST(substr(
          InvoiceDate,
          instr(InvoiceDate, '/') + 1,
          instr(substr(InvoiceDate, instr(InvoiceDate, '/') + 1), '/') - 1
        ) AS INTEGER)
      ) AS invoice_date_clean
    FROM customer_data
    WHERE CustomerID IS NOT NULL
      AND Quantity > 0
  ),
  last_purchase AS (
    SELECT
      CustomerID,
      MAX(invoice_date_clean) AS last_purchase_date
    FROM cleaned
    GROUP BY CustomerID
  ),
  dataset_date AS (
    SELECT
      MAX(invoice_date_clean) AS dataset_last_date
    FROM cleaned
  )
  SELECT
    CASE
      WHEN (JULIANDAY(dd.dataset_last_date) - JULIANDAY(lp.last_purchase_date)) >= 180
        THEN 'Churned'
      ELSE 'Active'
    END AS churn_status
  FROM last_purchase lp
  CROSS JOIN dataset_date dd
)
SELECT
  churn_status,
  COUNT(*) AS customers,
  ROUND(
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM churn_data),
    2
  ) AS percentage
FROM churn_data
GROUP BY churn_status;


